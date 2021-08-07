Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2074C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:19:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138F361078
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 138F361078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDABA81BF5;
	Sat,  7 Aug 2021 17:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7Erni5WVpgt; Sat,  7 Aug 2021 17:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F207781BC6;
	Sat,  7 Aug 2021 17:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30FFE1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2072D4015A
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8uP8JFe656O for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F946400F2
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA94A8CA15; Sat,  7 Aug 2021 17:19:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 18:16:41 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d1118e42895df84c220167872fe88b94e9936183
X-Git-Newrev: 5237d62e255ea13e978bd639ccc8cee5ae0218aa
X-Patchwork-Hint: ignore
Message-Id: <20210807171910.AA94A8CA15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/tftpd: bump to
 latest git commit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5237d62e255ea13e978bd639ccc8cee5ae0218aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

- Update indention in hash file (two spaces)
- This will fix a static build failure with gcc-10 thanks to
  https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=18ac1e26f756dd47fef33f5f706b0ec8fa696216

Fixes:
 - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8fb6678e0d49330e5495af27a048c0799ba8bb08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/tftpd.hash | 6 +++---
 package/tftpd/tftpd.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index c876b2edc2..3cccb0f20e 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
-sha256	afee361df96a2f88344e191f6a25480fd714e1d28d176c3f10cc43fa206b718b	tftp-hpa-5.2.tar.xz
+# Locally calculated
+sha256  c86520c30dab0b6bcbae021ab26d2ac63227696596d37a9b02aa3e56ec5c2e77  tftpd-b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7-br1.tar.gz
 
 # Hash for license file
-sha256	5efef82650b8ece733e37790fc70f05e426c9e1ef9640d4ebcb04867bd3f5e28	tftpd/tftpd.c
+sha256  67754ebd8f265571d3226ac97e521b1bd6fd8a61363ecd4ab7806a6f90efab92  tftpd/tftpd.c
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 494e963d64..ffd52ce0d0 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-TFTPD_VERSION = 5.2
-TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
-TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
+TFTPD_VERSION = b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7
+TFTPD_SITE = git://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
 TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
 TFTPD_CPE_ID_PRODUCT = tftpd-hpa
+# From git
+TFTPD_AUTORECONF = YES
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
