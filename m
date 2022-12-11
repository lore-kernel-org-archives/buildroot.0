Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9212C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEEB4EF34;
	Mon, 20 Feb 2023 22:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEEB4EF34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILCeBPbmU6hO; Mon, 20 Feb 2023 22:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E985A4EFD3;
	Mon, 20 Feb 2023 22:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E985A4EFD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 233171BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF4F416D3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF4F416D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEcCKrOp0R3f for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C59C416CE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C59C416CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68CB886495; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:40:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 16ed6b9a4a689496b69ba7b5daf122a88db40ce9
X-Git-Newrev: 6398d18d50c021992375c4229e3898402c3a1cc8
X-Patchwork-Hint: ignore
Message-Id: <20230220205209.68CB886495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-automat: drop
 host-python-m2r build dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6398d18d50c021992375c4229e3898402c3a1cc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since version 22.10.0, used since Buildroot commit
12c430f880f9255529d8c53cdb59f4178d2cd8f4, python-automat no longer
needs host-python-m2r, so let's drop this dependency.

This is needed as host-python-m2r is about to be removed from
Buildroot, due to incompatibility with its dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-automat/python-automat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index 675fbd2260..101197b15b 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/7a/7b/9c3d26d8a041
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
