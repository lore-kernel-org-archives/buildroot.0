Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60CC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5511140436;
	Sun, 28 May 2023 10:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5511140436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xrxFbxchn4H; Sun, 28 May 2023 10:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C99240186;
	Sun, 28 May 2023 10:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C99240186
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF281BF2B0
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 10:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F87E41DD3
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 10:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F87E41DD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ky5JVfBAJ1X for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 10:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3A3841DD1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3A3841DD1
 for <buildroot@buildroot.org>; Sun, 28 May 2023 10:12:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30ae7cc0e86so349918f8f.1
 for <buildroot@buildroot.org>; Sun, 28 May 2023 03:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685268766; x=1687860766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MeGWJLvxAbg5YAX/38NL6zINyEOEw7ZLHzjCqJOUEE0=;
 b=SrwvFIQ827PmBgr/Ge3cQ8i8MoZi8HVtxofjLNhu/JfV0S66ayTrzb3kdwIJp82pBG
 7zOl1TolbZO3zaYQ4IXatnnScse3m997GZPdAcMtPLrIcN9A7LxLuDpEEsR7hjzZpboI
 316B6MDnauMcI1Kd25o0z4+Sn5GM1Xh6vcCOveq7tLJpArVLNq7dynmGG5bm7+l4dEzj
 hZxdQOAU7fm1Hhpt2IsiSPQ3djHxc9+D2aj0jqAwhwqL1OlLN6ZlUwbS2Sq91hrz2+1m
 zf5PXPNJIC36cyKobERcCfpyaSnu+1KXQ+ih8o366sEvMENp6LIht5W/9PT4kOKcXvzi
 wnPQ==
X-Gm-Message-State: AC+VfDw4O7x1W99s4mSPzkB185tNjggA9gs7XHCgOXRSmF+dJixoijm4
 kTyR7VXRo9wApJhkhfcOsz2MxnTn7hI=
X-Google-Smtp-Source: ACHHUZ5VDbDlxMPWrlKOxKr5a/L//MVSsvfmgFvJmpfoTX89s0yIrbSPzlhZHumnu6QdVuxmz3Za+g==
X-Received: by 2002:adf:dbc7:0:b0:309:398e:de7d with SMTP id
 e7-20020adfdbc7000000b00309398ede7dmr6544753wrj.62.1685268766396; 
 Sun, 28 May 2023 03:12:46 -0700 (PDT)
Received: from atlas.home
 (2a01cb05945b7e0087f8ae3666c23a18.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b0030903d44dbcsm10305241wrq.33.2023.05.28.03.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 03:12:45 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 12:12:40 +0200
Message-Id: <20230528101241.67276-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685268766; x=1687860766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MeGWJLvxAbg5YAX/38NL6zINyEOEw7ZLHzjCqJOUEE0=;
 b=FeZceQ32f7eFxllWXooRnyVPh2q2rEWI5zVTS7QV1U1VNc1l69sfxqHSmzHS7lXSKE
 lkCo4xhgR84Kl+NxnHk5PpZ4aMlx0RpmhZQ1aG6K5vIK6spcXkmlc0Onj82Az1PQCH+r
 zG5YuVxGcV7fsSDuTP8IF6ApxnXwAeWG6Vv0grBnlMKpE3R7IUWkA4P40AzdY5xLwD/k
 +K5JLeh8uSsLcmOuBXUunM1BNqJ+DuOEmooz/fqrv7xefZNoGEFTbltTKSlOC8zdLCGw
 zv6i3/eb17gjgqhcjL95urdG3bnnDPypfwllI5Z7JJUnkgSP94YlU0epEBYcujbXwegY
 7L4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FeZceQ32
Subject: [Buildroot] [PATCH 1/2] package/perl-clone: new package
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

perl-clone is a new mandatory dependency of perl-http-message v6.44
that is already available in Buildroot since commit [1].

[1] 79e8aad721099eb05e60b449432136691275022f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                  |  1 +
 package/perl-clone/Config.in       | 10 ++++++++++
 package/perl-clone/perl-clone.hash |  6 ++++++
 package/perl-clone/perl-clone.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/perl-clone/Config.in
 create mode 100644 package/perl-clone/perl-clone.hash
 create mode 100644 package/perl-clone/perl-clone.mk

diff --git a/package/Config.in b/package/Config.in
index 420ebaa370..0cf2f3998c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -796,6 +796,7 @@ menu "Perl libraries/modules"
 	source "package/perl-class-method-modifiers/Config.in"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
+	source "package/perl-clone/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-cookie-baker/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
diff --git a/package/perl-clone/Config.in b/package/perl-clone/Config.in
new file mode 100644
index 0000000000..78f13dfe6b
--- /dev/null
+++ b/package/perl-clone/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_CLONE
+	bool "perl-clone"
+	depends on !BR2_STATIC_LIBS
+	help
+	  recursively copy Perl datatypes.
+
+	  https://metacpan.org/release/Clone
+
+comment "perl-clone needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
new file mode 100644
index 0000000000..7b69b97d06
--- /dev/null
+++ b/package/perl-clone/perl-clone.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cafa8984a2c2e005e54b27dd1e3f0afe  Clone-0.46.tar.gz
+sha256  aadeed5e4c8bd6bbdf68c0dd0066cb513e16ab9e5b4382dc4a0aafd55890697b  Clone-0.46.tar.gz
+
+# computed by scancpan
+sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
new file mode 100644
index 0000000000..9e04329eab
--- /dev/null
+++ b/package/perl-clone/perl-clone.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-clone
+#
+################################################################################
+
+PERL_CLONE_VERSION = 0.46
+PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
+PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_CLONE_LICENSE = Artistic or GPL-1.0+
+PERL_CLONE_LICENSE_FILES = README.md
+PERL_CLONE_DISTNAME = Clone
+
+$(eval $(perl-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
