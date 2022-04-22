Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF739C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD50882CD4;
	Fri, 22 Apr 2022 16:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vr_uyitf5qhT; Fri, 22 Apr 2022 16:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47B782796;
	Fri, 22 Apr 2022 16:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 508B51BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00C08826FB
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPjgl4Yp583I for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A82F825E8
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e2so5492320wrh.7
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKxtPSJCC9Evcm93vF6kUDMGTGZZut3ZxrkS/BxRQHk=;
 b=YwD5axiyiEtHRmAfaYMMzCtaw8JUSMmAtTqbxuRh0Hftscmcp5BFJxiqNlK0x6Yr3b
 Ydfsgk8i/++DOsmb27urVyBJsFHo2peBfNX+Gu67RnxpfN0yjTmfMfMdy7X+mqK4Jw9T
 mFzRwAoMXFDP/yZ6TDIg+XTmRd1N2JqjgbVC1ZUyF8z+lv5b1wtW8aKHPE+Ja+PrpYlm
 VdesMo6CJiKySadz8Jrca44dB77yzNQBnq58bNVmKqURHv2aNJxRChViiU/rOVLBt3lw
 YRrA2SCnEHvOaDXM0dJKHWdRzQTY+gxsf+24T/ZLQqU67QaygZ/umHTyyq5P+jIHirPO
 y4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKxtPSJCC9Evcm93vF6kUDMGTGZZut3ZxrkS/BxRQHk=;
 b=jndNzv82fSGYBnHFbadls565NWfReNKXRmohBW2psb1o9SndSB+rSIVkSbbkqjBy8v
 WHnOOc7VaXbzcV2sCqkAU8Sc59QGJnsew/1NVjsVe73iPgXlHGDTJWHs4kuGOTbsBm9b
 x3EBUFJRI8QfgFob11j0eFOOo57HZggIzCOFgurDY0kEUUmJ6Ady4L/z+FZpgfPtAVCl
 O2iOpbKo9D2LRgVHHq8dHAFPP3KGbLkk4IdS3U097rHykpzyja0lqsNW97BhpnCXA4H7
 B5GBV7R5lCIAkcIl6pLvqwEa24MK78TaNv0sGUKnDVERWAqUjz7UexvT7vQ9PJu/7sXR
 ReKQ==
X-Gm-Message-State: AOAM5314qpgfgAvc0r6UZdEh5tIQN40td2AUAj9jjEqFxKi/SSN6ufOK
 dweNp9OeodLmFydM5SvWck/mKM7aynE=
X-Google-Smtp-Source: ABdhPJzIpfP2U0Z80TKdiYZZDMTi37xuWDNsV4JfopGajMWuMXbV3Fx2acR5kPJGMqzArvpVxN+yLw==
X-Received: by 2002:adf:dd4f:0:b0:20a:ce22:909 with SMTP id
 u15-20020adfdd4f000000b0020ace220909mr1380018wrm.374.1650644138280; 
 Fri, 22 Apr 2022 09:15:38 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:14 +0200
Message-Id: <20220422161514.3449177-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] package/perl-package-stash: bump to version
 0.40
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-package-stash/Config.in               | 4 ++--
 package/perl-package-stash/perl-package-stash.hash | 6 +++---
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 6b7ca2478..05506c242 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_PERL_PACKAGE_STASH
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
-	  routines for manipulating stashes.
+	  Routines for manipulating stashes.
 
-	  http://metacpan.org/release/Package-Stash
+	  https://github.com/moose/Package-Stash
diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index 0bbac515e..85d8e1bde 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  287d80c9115c9230912aca684f8ca92e  Package-Stash-0.39.tar.gz
-sha256  9165f555112e080493ce0e9129de0886da30b2593fb353a2abd1c76b2d2621b5  Package-Stash-0.39.tar.gz
+md5  7a2922941cc2aad6a52642e4fb13d07b  Package-Stash-0.40.tar.gz
+sha256  5a9722c6d9cb29ee133e5f7b08a5362762a0b5633ff5170642a5b0686e95e066  Package-Stash-0.40.tar.gz
 
 # computed by scancpan
-sha256  810b319a6f4a53c9cbbef513da17b2f0c872accd149bb889f153f4b78cf8cbb8  LICENSE
+sha256  5f82745d355b43f451c557642618cbd903251192b89f31ca53eaab90c35aeb7c  LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index bc116abca..dd93314d8 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.39
+PERL_PACKAGE_STASH_VERSION = 0.40
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
