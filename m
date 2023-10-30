Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FBBC4167B
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 22:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AB482133;
	Mon, 30 Oct 2023 22:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AB482133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuGc2K729iWk; Mon, 30 Oct 2023 22:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21244820EC;
	Mon, 30 Oct 2023 22:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21244820EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3C41BF34E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E83A54054B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83A54054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8bIwxBto_h6 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 22:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78804052D
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E78804052D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D44ED8622A; Mon, 30 Oct 2023 22:01:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 23:00:16 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4a5f362728b99c4292b709ac54496568bf190ade
X-Git-Newrev: e856907cd9f0a601e71985abcfed74e08498495c
X-Patchwork-Hint: ignore
Message-Id: <20231030220111.D44ED8622A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/python-pycryptodomex: fix package build with gcc 4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e856907cd9f0a601e71985abcfed74e08498495c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

python-pycryptodomex uses C99 features like variable
declaration in for-loop statement, while old compilers
assumes C89 by default.

This patch explicitly specifies C99 standard.

Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
[yann.morin.1998@free.fr: use TARGET/HOST_CFLAGS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3c6f3af24db4b79d652874dd6c381ce3d6c5266b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycryptodomex/python-pycryptodomex.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 3790aa4787..d6eb2a9513 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -13,5 +13,8 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
 	Public Domain (pycrypto original code)
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
+PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
+HOST_PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
