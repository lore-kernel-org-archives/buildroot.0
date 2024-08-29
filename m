Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE75DC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C3A81EBB;
	Thu, 29 Aug 2024 16:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vd2zHVXEDuSb; Thu, 29 Aug 2024 16:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E5D81F22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E5D81F22;
	Thu, 29 Aug 2024 16:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8CB1BF84C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 960B481F22
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaA7Vcupr9HI for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4F8381D72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F8381D72
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F8A2866D2; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 18:06:43 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3d5741d911f5a44263458c63cc989ffc14b80877
X-Git-Newrev: 32844c4ca256bd40d441a85dcf45769c8758dca5
X-Patchwork-Hint: ignore
Message-Id: <20240829161701.8F8A2866D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/tftpd: bump to
 latest git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=32844c4ca256bd40d441a85dcf45769c8758dca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

- Update hash of tftpd.c (changes not related to license)
- --include=$(@D)/autoconf/m4 and --disable-tcpwrappers must be passed
  since
  https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=fefaa2cc5c2ae1537fccbb552496787130feeeaa
- This bump will also fix the following musl build failure raised since
  latest bump in ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb:

  In file included from tftpsubs.h:41,
                   from tftpsubs.c:34:
  /home/autobuild/autobuild/instance-9/output-1/build/tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0/config.h:209:13: error: conflicting types for 'socklen_t'; have 'int'
    209 | typedef int socklen_t;
        |             ^~~~~~~~~

Fixes: ee2b57e0c98acf1d02cf66a38c9ec82bd69bcbeb
 - http://autobuild.buildroot.org/results/4b5320013d8ab50499a459d64a71e0b71814fb2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4a84e61615553ff678d3c3b52ed33f898e9fcc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/tftpd.hash | 4 ++--
 package/tftpd/tftpd.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 3fab9dba07..5a4e87f689 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9bdb3e2ab2b68e4d8cd057d102395c362baf07c7b052f1d5e40e5190afecc15e  tftpd-e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0-git4.tar.gz
+sha256  452b2d630f884d80a7c4c324aa8248470224048ffb9473e3490460658b8ebea4  tftpd-2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1-git4.tar.gz
 
 # Hash for license file
-sha256  5936d0764cb6e8f2f5ce8a11c249d81037b5f275f5983e8538ee4fbe57195369  tftpd/tftpd.c
+sha256  9c46847a03d4cf290616a173d526b9bbdfcaf6846cbc01f361989b4e61f2d72e  tftpd/tftpd.c
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 81b67f82ce..73ac7006a4 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-TFTPD_VERSION = e52af4207a6e09a1ba21f61d6f85d8b2b1e6efc0
+TFTPD_VERSION = 2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1
 TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
 TFTPD_SITE_METHOD = git
-TFTPD_CONF_OPTS = --without-tcpwrappers
+TFTPD_CONF_OPTS = --disable-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
@@ -15,6 +15,7 @@ TFTPD_CPE_ID_PRODUCT = tftpd-hpa
 TFTPD_SELINUX_MODULES = tftp
 # From git
 TFTPD_AUTORECONF = YES
+TFTPD_AUTORECONF_OPTS = --include=$(@D)/autoconf/m4
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
