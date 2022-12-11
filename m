Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD92C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF6D4F326;
	Mon, 20 Feb 2023 22:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF6D4F326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fu1tKmoQwaXd; Mon, 20 Feb 2023 22:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E323A4F351;
	Mon, 20 Feb 2023 22:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E323A4F351
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 906771BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE836109A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE836109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22R4q6A_5c92 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2466125F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2466125F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF2C8648F; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:05:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c0e09a1b0a6a57f3bda48d87f7292af136d59949
X-Git-Newrev: ef708b0c195d168c311b1096c1ab2b7bf6c2aa1e
X-Patchwork-Hint: ignore
Message-Id: <20230220205208.2CF2C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-maturin: drop
 host-python-tomli dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef708b0c195d168c311b1096c1ab2b7bf6c2aa1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-maturin/python-maturin.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index ab87df3842..3dedfdce11 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -12,7 +12,6 @@ PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
 HOST_PYTHON_MATURIN_DEPENDENCIES = \
 	host-python-setuptools-rust \
-	host-python-tomli \
 	host-rustc
 HOST_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
