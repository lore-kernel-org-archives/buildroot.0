Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18288FA3748
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 13:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC534405E5;
	Fri,  2 Jan 2026 13:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJBh2848W2Cm; Fri,  2 Jan 2026 13:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B516740500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767361040;
	bh=Q0h9ezih5ClMBKbL3YlxujJ5kSoZ4Ea67Fuu8tLO2rQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Cf5M9BBCHi1WG6/6Mv81b0PyCLr7V/e+HhklpeUxkm9P85dvqZyyfIrUAXjOPUo88
	 iVZUo/xYM10XH1l4bBxw8rMC757EICNtuS5Qo0ztY2reOvXnHsnas6VWrwlLskOJAS
	 HegMc9rhufNxSbhoHKzdDv4ojyYy9uVq8OcyN+gTUMCawJJolhu7UAIc6L8SKIS51p
	 P5gU1hdD6hlRMjUueiPRhU6MEvcGG2l13YqzH21FHf11Rx8njifiS5r3VSAuZshB5g
	 kQCH7hUWvdJw/cS1wfqh1HNvQNKnN/cMHX1e2BdoXIXGc7mvd2z5sLNguRN4ZX7pFz
	 5HqQ7aG0JXjqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B516740500;
	Fri,  2 Jan 2026 13:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33FEFD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2676D40500
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FN6alRhOPO6m for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 13:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657A0404EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 657A0404EF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E35B87E75; Fri,  2 Jan 2026 13:37:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 13:43:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c4d501e815b6aab7b26c7d61bd63865f9c46a98
X-Git-Newrev: b30d95335172b6873f8695bc69b40bd1f6e55c4c
X-Patchwork-Hint: ignore
Message-Id: <20260102133718.5E35B87E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imlib2: bump to 1.12.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b30d95335172b6873f8695bc69b40bd1f6e55c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 1.7.5:
- imlib2-config is dropped. pkgconfig is used since.
- release tarballs are delivered in .xz instead of .bz2

Changelog:
https://git.enlightenment.org/old/legacy-imlib2/src/tag/v1.12.5/ChangeLog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
[Julien: reorder hashes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imlib2/imlib2.hash | 10 ++++++----
 package/imlib2/imlib2.mk   | 12 ++----------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 690d836c2e..6c316b5d0b 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,10 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.3/
-md5  1e79055a0b8fe27d208b6f8bb1bde60c  imlib2-1.7.3.tar.bz2
-sha1  3d55965f946d0b2754a84c8e57c78ddc227252c6  imlib2-1.7.3.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/
+md5  c81c9f91d92ecbd87cf652f867ec5d74  imlib2-1.12.5.tar.xz
+sha1  055778fca4639962290426c37d909c1a6a4c8e1c  imlib2-1.12.5.tar.xz
+
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.5/imlib2-1.12.5.sha256
+sha256  fa2315f28379b430a6e6605b4284b07be06a3ef422d4f5e1c9bb24714c4cf6dd  imlib2-1.12.5.tar.xz
 
 # Locally computed
-sha256  158d0b8c20bc11221af9e77a64a116fca7051b03cdea2c4f31d31f469382f997  imlib2-1.7.3.tar.bz2
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 89b4769f92..5ad89289a4 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.7.3
-IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
+IMLIB2_VERSION = 1.12.5
+IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.xz
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
 IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
@@ -14,7 +14,6 @@ IMLIB2_CPE_ID_VENDOR = enlightenment
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
-IMLIB2_CONFIG_SCRIPTS = imlib2-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
 IMLIB2_CONF_OPTS += --with-x
@@ -58,11 +57,4 @@ else
 IMLIB2_CONF_OPTS += --without-id3
 endif
 
-# drop -L<dir> from linker flags
-define IMLIB2_FIXUP_IMLIB2_CONFIG
-	$(SED) 's/-L[^ ]*//g' $(STAGING_DIR)/usr/bin/imlib2-config
-endef
-
-IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
