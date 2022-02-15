Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF70EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 07:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CED882884;
	Tue, 15 Feb 2022 07:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcKKLV4RCsaY; Tue, 15 Feb 2022 07:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DBA82864;
	Tue, 15 Feb 2022 07:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E35001BF276
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17B782884
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GR008IWZODfZ for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 07:07:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C37A82862
 for <buildroot@busybox.net>; Tue, 15 Feb 2022 07:07:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso788363wmj.2
 for <buildroot@busybox.net>; Mon, 14 Feb 2022 23:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVSSeAFjtz+X36n/8jQ2cMS2R+z1o/lIPIF2eJuNMoc=;
 b=cA986Oo4DsDN+270dfu/y5fsYFVie8kBq+GnvwS0sDPQB54RIFkxh6ywgh/idZgb6s
 c5s+l1pVQBYyMiPi6S7udAFe/iKjsojWBSj5teilQZxMKdNqxndaTSSeOcPMU3mxv74E
 PAz12YbruwaNqI+ozHoTs4SVzza/WI1gDG9pEuk3eFLMrGjJywQ9ApOhEGNn+y5OMnfI
 58wp8ksoQf/XzGdjTrASkGbr620m3kH6clT2ihfiWM9RHSjShyda75S8CcHuFVY7/C45
 MtOm1wiawx+sMfNlbLbt8PMrs3vx6wndLmDV3Gr8LlOKmwwfwGXQMM1AoZPsuIg/7JGi
 avKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVSSeAFjtz+X36n/8jQ2cMS2R+z1o/lIPIF2eJuNMoc=;
 b=xo9ziAYDeirDifsmuEC57N03PMKz/et+NKmOBtmrB5BSy74VMUcgKzUEiB0WmWUwmO
 y2pkjjW5oSgfflQ2XlGMcRHfcL+mJEAgiq4yBsRCMAqUBxGfSRnkct5/d6CQLqVihK3p
 H/RshcI7Jajg3HaDRUoDplQuqVUupU4n77L5jO+JLFhyRXASS57Ts5N7v7tJwFtUNtsH
 MF32MzGf/17TH+ulM4gwst/9keuiwx00/h/CaESO3BH/9/6ubZm/GcX9l5SyY5U/pWY4
 lmrJdfZwF+nyqS5yuCThcK3MH8ubXNNKKR9jTbbBvPNKIV7Cmkm1yRfeih2mc65hbAEA
 B1qQ==
X-Gm-Message-State: AOAM532WsqXghaCII83bTkwWNVS9qRMWJf4FLePE2LBbuhQEwOdOCbnm
 bTFr704DShCn494OXsKUvfhmivKfJEk=
X-Google-Smtp-Source: ABdhPJzf2jHcAveh3Ng1cuCQEcIrk1IxvndUf825fSNsaZdytCQRLUkPXlCcX365eDEVy8EdsYp69A==
X-Received: by 2002:a7b:c004:: with SMTP id c4mr1835435wmb.82.1644908871589;
 Mon, 14 Feb 2022 23:07:51 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p8sm25458451wro.106.2022.02.14.23.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 23:07:50 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 15 Feb 2022 08:07:38 +0100
Message-Id: <20220215070739.2199760-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/perl-gd: bump to version 2.76
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

remove upstreamed patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...-fix-cross-compilation-with-gdlib.pc.patch | 34 -------------------
 package/perl-gd/perl-gd.hash                  |  4 +--
 package/perl-gd/perl-gd.mk                    |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch

diff --git a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch b/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
deleted file mode 100644
index af053c560..000000000
--- a/package/perl-gd/0001-Makefile.PL-fix-cross-compilation-with-gdlib.pc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 11dc017e902397c452331425eb6101b3315572fa Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Jan 2021 10:59:31 +0100
-Subject: [PATCH] Makefile.PL: fix cross-compilation with gdlib.pc
-
-Cross-compilation will fail if gdlib.pc does not contain any cflags.
-Indeed, if cflags is empty, Makefile.PL will use the default value for
-INC (i.e. -I/usr/include -I/usr/include/gd)
-
-It should be noted that gdlib-config has been dropped from gd since
-version 2.3.0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable]
----
- Makefile.PL | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.PL b/Makefile.PL
-index 25f2f93..7da3651 100644
---- a/Makefile.PL
-+++ b/Makefile.PL
-@@ -47,7 +47,7 @@ If you want to try to compile anyway, please rerun this script with the option -
- END
- }
- 
--@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
-+#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
- @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
- @LIBS    = qw(-lgd) unless @LIBS;
- 
--- 
-2.29.2
-
diff --git a/package/perl-gd/perl-gd.hash b/package/perl-gd/perl-gd.hash
index 780b1d1e2..97f1da821 100644
--- a/package/perl-gd/perl-gd.hash
+++ b/package/perl-gd/perl-gd.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c2bf1ca56d15e33d2432e4d8ba5aeadf  GD-2.73.tar.gz
-sha256  491c9e73238522e2987e66725a20935f4268a3864202ecbaf4659a1691ba322b  GD-2.73.tar.gz
+md5  fb4bacab10ed4f28d52c2aabdaf866bb  GD-2.76.tar.gz
+sha256  693d9e3d709e9188a682cb9090a77b70aac12a04e84128677577b94e4331775b  GD-2.76.tar.gz
 
 # computed by scancpan
 sha256  1e2250289d6df4ba1c24f7550982d7ffaff2c97cd02e847659406e1afd28e83f  LICENSE
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index b402dfff4..9787cc12f 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_GD_VERSION = 2.73
+PERL_GD_VERSION = 2.76
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
