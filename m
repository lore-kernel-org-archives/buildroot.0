Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FFC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2E4418F9;
	Sun,  7 May 2023 09:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2E4418F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Biy7GEceUdy0; Sun,  7 May 2023 09:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53F541909;
	Sun,  7 May 2023 09:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E53F541909
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49E5A1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B7FB41909
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 09:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7FB41909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGp7pP3tRtZ8 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 09:06:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED276418F9
 for <buildroot@buildroot.org>; Sun,  7 May 2023 09:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED276418F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1BE885EE2; Sun,  7 May 2023 09:06:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 10:56:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e6e2bde8bc1ae0069c534b95f66b8fbb3117c2e
X-Git-Newrev: 8e33cc012e53a3964ff7144df1492b3c61c14948
X-Patchwork-Hint: ignore
Message-Id: <20230507090652.D1BE885EE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/heimdal: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e33cc012e53a3964ff7144df1492b3c61c14948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Samba-4.16 bumped its internal heimdal code[1] which made it
incompatible with asn1_compile built with heimdal-7.7.1:

/home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: Ignoring char(_)
/home/user/buildroot/output/build/samba4-4.18.2/third_party/heimdal/lib/asn1/rfc2459.asn1:260: syntax error

Bump this package to the same version LibreELEC is using

https://github.com/LibreELEC/LibreELEC.tv/commit/1dc0b5bf3e50500658c8a61e89f57a98dfc0468d
https://github.com/LibreELEC/LibreELEC.tv/commit/1112a1879523fdff7f6dec5a083d4f2bc82e7017
https://github.com/LibreELEC/LibreELEC.tv/commit/763eddbab10f89da42a380624192cc4039eed086

to fix the build error.

Removed HOST_HEIMDAL_MAKE_SYMLINK as asn1_compile is now installed in
$(HOST_DIR)/bin/.

[1] https://www.samba.org/samba/history/samba-4.16.0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/heimdal/heimdal.hash |  4 +---
 package/heimdal/heimdal.mk   | 14 ++++----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index cf822340da..250ddbbd4d 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,5 +1,3 @@
-# From https://github.com/heimdal/heimdal/releases
-sha1  a33fdc957f84ab13f39f164b04fe1deeaab3179e  heimdal-7.7.1.tar.gz
-sha256  117cb1ede7848db24cf27311c46f7f735a99f9c836c22e80aec92b91efe56644  heimdal-7.7.1.tar.gz
 # Locally computed
+sha256  2576c5e2d793db53c86e108fd117b278437bb02d6c6db2bec4d1b86958f1980a  heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17.tar.gz
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 21b6c0ccb3..59b64c358b 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.7.1
-HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
+HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
+HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
+HOST_HEIMDAL_AUTORECONF = YES
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
@@ -39,14 +40,7 @@ define HOST_HEIMDAL_INSTALL_COMPILE_ET
 		$(HOST_DIR)/bin/compile_et
 endef
 
-# We need asn1_compile in the PATH for samba4
-define HOST_HEIMDAL_MAKE_SYMLINK
-	ln -sf $(HOST_DIR)/libexec/heimdal/asn1_compile \
-		$(HOST_DIR)/bin/asn1_compile
-endef
-
 HOST_HEIMDAL_POST_INSTALL_HOOKS += \
-	HOST_HEIMDAL_INSTALL_COMPILE_ET \
-	HOST_HEIMDAL_MAKE_SYMLINK
+	HOST_HEIMDAL_INSTALL_COMPILE_ET
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
