Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E4E8305C;
	Sat, 23 Apr 2022 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msUMB0eh29Xj; Sat, 23 Apr 2022 20:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2318301F;
	Sat, 23 Apr 2022 20:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697EE1BF59E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578E940235
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 20:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OE-n07HascxH for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 20:56:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F15740004
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 20:56:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w4so15587302wrg.12
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/MR6Wxtsvl2+0qUkH0anksvmwpIL8kTfMGgLKllUGQ=;
 b=UixsAfmCyZc+BquM/awR6mUEZFdVuRWT5XYtkXjFKmK4Jr60F6yh2b7O6+1TRe6IdH
 Lcngc7rMtCOMmPjLFdbDN/KJH75E5TnppVCdvHl1czwnmmZll4tahmM86pQjacdWfHKG
 vtJQ3OUmeEAjNRgiORM843gqKvA0hhfCTN3IQ8QgtybEQZDFomXerqgnJe3+R5Kr2lBf
 4Bb3u+edxAJKFNeVK6mycdTEsgsbfi6jWbOyi3ZveCFAWpy9KmiJb8r+VEKjKgA9cRxj
 6DoXoAS5YlyrwfUAyyTi8ETlsTtRZgd8A5cMo132tZVZUcn0zKR0YrzxkVHMKxrkYvKH
 hWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B/MR6Wxtsvl2+0qUkH0anksvmwpIL8kTfMGgLKllUGQ=;
 b=2Q++fvm+H4Hr+/f1uzIYNeeTrPL+xapVWODLQATEzc1dCoc3ZNhJk3ke94Qu/fZwYN
 yGZwo7Yi/Xwd3TAbGOw9GcOjJCd7EqVeKnOi8IL3dQY19iXDfWioKd+yskYNUW54PoKC
 VSXUn2qXx9H+dzk16LVeTMTLl/aZQ6VUB8WFz4nAeCfvrOyjhNfyyow6l0KgpNEOYCL7
 brC6MmcurXYvitlWlImjLCJ92tnC2heujxSEqjnuWZu6+OdNLCV9qLNaFLaUjegylqIw
 18/quDJFc056VGR5qQUTz8ToVKtCjQmJghuUCkzZfctkscKDg2HELt2Mkexhw9FNoC/O
 R9Mw==
X-Gm-Message-State: AOAM530oIBhtn/q5ahesYdxdjSNw4UkNCIDyRSnqVDUaxbK7i0HQWeW+
 00dPc8ADQozZSbw3+UujWwB1s24qkRE=
X-Google-Smtp-Source: ABdhPJwgs3xVd/6cm3QDorJt6YswPovfI8r/Y0KnglCl8MG7nwNiOI3St1h46zXeaHet438jO2I5zA==
X-Received: by 2002:adf:fc47:0:b0:20a:d494:3ee5 with SMTP id
 e7-20020adffc47000000b0020ad4943ee5mr2714670wrs.696.1650747370064; 
 Sat, 23 Apr 2022 13:56:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00393e810038esm528784wmq.34.2022.04.23.13.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 13:56:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 22:54:13 +0200
Message-Id: <20220423205413.4083987-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/argp-standalone: fix NLS build
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.4.1 in
commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
https://github.com/ericonr/argp-standalone/commit/e5fe9ad9e83e6765cf8fa787f903d4c6792338b5:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libargp.a(argp-parse.o): in function `argp_version_parser':
/home/buildroot/autobuild/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/adb9c4b747352497adbc9df866709b17fe0f9755

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/argp-standalone/argp-standalone.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 80ca04046d..269239fa5b 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -12,9 +12,11 @@ ARGP_STANDALONE_LICENSE = LGPL-2.1+
 ARGP_STANDALONE_LICENSE_FILES = README.md
 # From git
 ARGP_STANDALONE_AUTORECONF = YES
+ARGP_STANDALONE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ARGP_STANDALONE_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
+	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
