Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB006C433FE
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D8560F90
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86D8560F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2859A400A6;
	Wed,  3 Nov 2021 17:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MYN6BTiMj9z; Wed,  3 Nov 2021 17:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E3D400C4;
	Wed,  3 Nov 2021 17:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD281BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A21080F8D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAZtu6wDuR-l for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:52:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65FB980F86
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1781E8A39F; Wed,  3 Nov 2021 17:48:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 18:52:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac49e2b4f610e679e84120b4d6ea96d20833362e
X-Git-Newrev: 661917efd8101a4bc5b7417f8926b48014a0b082
X-Patchwork-Hint: ignore
Message-Id: <20211103174853.1781E8A39F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: bump to version
 7dbfffa
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

commit: https://git.buildroot.net/buildroot/commit/?id=661917efd8101a4bc5b7417f8926b48014a0b082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

7dbfffa Fix parsing multiple .flags variables
de31f3d Add REUSE badge
6390c1c Make libubootenv REUSE compliant
0573071 doxygen: fix libuboot_open/close return value description
0d12468 Add documentation for the configuration file
b1178c1 Add configuration for disabling MTD lock
5dadcb3 main: Remove duplicated code about '=' in variable name.
e085e37 libubootenv: Forbid to give empty variable name to fw_setenv.
42f919e main: Check libuboot_set_env() result.
1bc91d1 CI: add gitlab config

License update details: see commit 6390c1c ("Make libubootenv REUSE
compliant") in [0]

[0] - https://github.com/sbabic/libubootenv/commit/6390c1c26a816a96c9a72588679df3b9445dc192

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubootenv/libubootenv.hash |  6 ++++--
 package/libubootenv/libubootenv.mk   | 11 +++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index d6de614612..5ff7450806 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256  662ef1efe058e2d5a07498f7b63aff7b2a521c0f6f199c499fb3ae84b54121bd  libubootenv-0.3.2.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
+sha256  760fe53ca20ced93a09dea0f123eb429c820b565c103920afa738873e8cd16b7  libubootenv-7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7.tar.gz
+sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 295226b9aa..51ea02e678 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.2
-LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
-LIBUBOOTENV_LICENSE = LGPL-2.1
-LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
+LIBUBOOTENV_VERSION = 7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
+LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt
+
 LIBUBOOTENV_INSTALL_STAGING = YES
 LIBUBOOTENV_DEPENDENCIES = zlib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
