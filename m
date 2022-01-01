Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD06C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4576840184;
	Sat,  1 Jan 2022 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vnaVXQAS6y2; Sat,  1 Jan 2022 22:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A3BE40186;
	Sat,  1 Jan 2022 22:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7901BF32D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0597F81358
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHjxtBVXMH3s for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 22:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25EE28134C
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 22:15:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso16423671wmk.4
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 14:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+XWMzq3JMOo3+ogwDVbkir1NGpqTH6eUvv8FLEyUIzI=;
 b=aLcZNltAdvcR9IJ5hBf8Y5Bfak7rtQxs4ZJsRFK8TBV1KAq8C0bUhcA3cxTVr2B4Rm
 UFR4JuEWVt3WcYtyKy6U+LmBYX0NW8hQDG6tKmn6ZOPE6uYVAR6pp4qJ1cJGCmomXUDo
 h8yYE33D3KX4pKEYN3o9kOrs2zOAfFgS4+bc2wLSn3bqziPUxw54lGLnZMSuecwDW2pr
 PES1+FdZLqo2oCnCmKtJNsgHsC2uYPAppf8lCk4sjYBFNsjCcr3S4e4MLvLdO3BXFf3c
 /c0str1pGLzl39+Rnrl/zeWKXv3EQFvL+Ifo0G06UB5uaK49rxxqF2bkh5L+t5pIneWP
 1fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+XWMzq3JMOo3+ogwDVbkir1NGpqTH6eUvv8FLEyUIzI=;
 b=ONJDqCvvrUWnzELU/xUjDKyToxQ8uhRzFxvChNwAi1oxzp78D9A9pY/Cs6tRQvvkpm
 R/C2MQVWBKRghJNuX//nLhcqgwcK9rsvmIS67X+IgzoAOBmgIVMHIxeN5A0a7nhIo+T3
 yIEKKVgSnAeTVKYJNDy49gqIx/c7doTDtZVBclS4YTu9KMYbNDeMp92NMQ0YeUAih5Xh
 0lHQp/5O2XbmUi0jUijXf/loKcAGqJqAaFriEXH8UcW4AgMMYrFmaH5HCzilYW2xQKAQ
 NAkj4gwqjKhy/t4hr3Xnm1bNfwYCiuYLph7s4BXocv3lUDMyl9lPFNUMqWyjyi2NiYM3
 MVSw==
X-Gm-Message-State: AOAM531hlrBQzNL3pAjy6UQsj98GDGeSSeLHKx2LWLbmjWYgDgpeEFW3
 UcS+ByCupWQ3A7pGky7rS6pHTRoSTM8=
X-Google-Smtp-Source: ABdhPJxuPwTmNXazaZblotZsEjxIfDbENs4QTY1//VcHbj6svTASZHzcFlo6cju2P6IMLQELwVHKGw==
X-Received: by 2002:a7b:c448:: with SMTP id l8mr33656852wmi.173.1641075347162; 
 Sat, 01 Jan 2022 14:15:47 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id s1sm30298853wrr.8.2022.01.01.14.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 14:15:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 23:14:25 +0100
Message-Id: <20220101221425.2059395-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xxhash: bump to version 0.8.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop first patch (already in version)
- Refresh upstream status of latest patch
- Update hash of LICENSE and add cli/COPYING:
  https://github.com/Cyan4973/xxHash/commit/85e1ea2ab0d90463b804f4a65b0f67d99718c6f8

https://github.com/Cyan4973/xxHash/releases/tag/v0.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h => 0001-fix-man-page-installation.patch} |  0
 .../0001-fixed-man-page-installation.patch    | 31 -------------------
 ...efile-add-dedicated-install-targets.patch} |  8 ++---
 package/xxhash/xxhash.hash                    |  5 +--
 package/xxhash/xxhash.mk                      |  4 +--
 5 files changed, 8 insertions(+), 40 deletions(-)
 rename package/xxhash/{0002-fix-man-page-installation.patch => 0001-fix-man-page-installation.patch} (100%)
 delete mode 100644 package/xxhash/0001-fixed-man-page-installation.patch
 rename package/xxhash/{0003-Makefile-add-dedicated-install-targets.patch => 0002-Makefile-add-dedicated-install-targets.patch} (94%)

diff --git a/package/xxhash/0002-fix-man-page-installation.patch b/package/xxhash/0001-fix-man-page-installation.patch
similarity index 100%
rename from package/xxhash/0002-fix-man-page-installation.patch
rename to package/xxhash/0001-fix-man-page-installation.patch
diff --git a/package/xxhash/0001-fixed-man-page-installation.patch b/package/xxhash/0001-fixed-man-page-installation.patch
deleted file mode 100644
index a9f68db4b4..0000000000
--- a/package/xxhash/0001-fixed-man-page-installation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6 Mon Sep 17 00:00:00 2001
-From: Yann Collet <cyan@fb.com>
-Date: Fri, 6 Aug 2021 15:29:32 -0700
-Subject: [PATCH] fixed man page installation
-
-[Retrieved from:
-https://github.com/Cyan4973/xxHash/commit/e345ccaf4daa8c35698ab02c0de346fcc0ca9ef6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index b8552a9f..556a32a0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -498,10 +498,10 @@ endif
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh64sum
- 	$(Q)ln -sf xxhsum $(DESTDIR)$(BINDIR)/xxh128sum
- 	@echo Installing man pages
--	$(Q)$(INSTALL_DATA) xxhsum.1 $(DESTDIR)$(MANDIR)/xxhsum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh32sum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh64sum.1
--	$(Q)ln -sf xxhsum.1 $(DESTDIR)$(MANDIR)/xxh128sum.1
-+	$(Q)$(INSTALL_DATA) $(MAN) $(DESTDIR)$(MANDIR)/xxhsum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh32sum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh64sum.1
-+	$(Q)ln -sf $(MAN) $(DESTDIR)$(MANDIR)/xxh128sum.1
- 	@echo xxhash installation completed
- 
- .PHONY: uninstall
diff --git a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
similarity index 94%
rename from package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
rename to package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
index 0607c8ee82..17d34a0823 100644
--- a/package/xxhash/0003-Makefile-add-dedicated-install-targets.patch
+++ b/package/xxhash/0002-Makefile-add-dedicated-install-targets.patch
@@ -10,13 +10,14 @@ This is especially useful on embedded systems where dynamic library is
 not always supported by toolchains
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Cyan4973/xxHash/pull/665]
+[Retrieved from:
+https://github.com/Cyan4973/xxHash/commit/db9c199e99f7b4d419647b1ef49c547fc2547516]
 ---
  Makefile | 18 +++++++++++++++---
  1 file changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8d4fcd2..5fe7297 100644
+index 8d4fcd21..5fe72972 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -505,11 +505,14 @@ libxxhash.pc: libxxhash.pc.in
@@ -68,6 +69,3 @@ index 8d4fcd2..5fe7297 100644
  	@echo xxhash installation completed
  
  .PHONY: uninstall
--- 
-2.33.0
-
diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index feb5000808..2c99236a45 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,3 +1,4 @@
 # locally computed
-sha256  7054c3ebd169c97b64a92d7b994ab63c70dd53a06974f1f630ab782c28db0f4f  xxhash-0.8.0.tar.gz
-sha256  9da63520e9293d82c4b1613be5c84058cadb82b02f5972179bad13731d589910  LICENSE
+sha256  3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c  xxhash-0.8.1.tar.gz
+sha256  553d0035773ddd1590045f8fdc3a4c6ead31e36336721aeca8421e88ed1c9f80  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 3e7f3244b3..a8f8d1d179 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.0
+XXHASH_VERSION = 0.8.1
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
-XXHASH_LICENSE_FILES = LICENSE
+XXHASH_LICENSE_FILES = LICENSE cli/COPYING
 XXHASH_INSTALL_STAGING = YES
 
 XXHASH_TARGETS = xxhsum
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
