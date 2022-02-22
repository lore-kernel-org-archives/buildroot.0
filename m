Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D0AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B8C60F10;
	Tue, 22 Feb 2022 20:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDDgKWRDzrIZ; Tue, 22 Feb 2022 20:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D2D60F04;
	Tue, 22 Feb 2022 20:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5D41BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07CF840192
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziRiDcBlzOiP for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE0AE400ED
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:37:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p4so2157189wmg.1
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLyfPxow4uiRr0OWM4M1Ke5YwgF7/ipB81qXcTzINSY=;
 b=USqttSAZ+K+dvq+WR0sIllAxO6svqUXBA4i8ekXWED591Yw6Mf58+aORe8WCo0WJoD
 SW5fj7kelgnF3w+qGGYCA2uKLWXZYItjJx++1frgNbFCoX26nLg1uCmvU4qLwP018Ef1
 IHKYCwlflGAlT6IINyyxTZcUnldBXXRoBUFT9UrhiahAjUGOcarNT2NsV6AoxlrN0Ezf
 YWnCHu8kCOSe2XjeQHV9oRwnikhY8zUjhRuVyWFJ08mpngnveKXX8MtrviEQDb8B5BFq
 8G3MLPIklPPPaa/ImuYT56p1lhDAY9208eSi778P3IJJc1OQFZ0CUA9ugm2NzgEghavj
 QeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLyfPxow4uiRr0OWM4M1Ke5YwgF7/ipB81qXcTzINSY=;
 b=PH2XBRfEXNdFSySwFzUN3sGxObDX2Y9O10CQWBLFvl7NjnP/Dq3NX5a466ike+8FtX
 vWyFOLTIoquJmCAu41LwyRzeBVwQis8McF1FFafU828o7Pr4QHTAfN8J01tY4exfz6DZ
 a17lR3KfL9Br0CYpPhl0s43i/V3GL9q1pyBPgD9A+YB4w/ZaeoCjcS60L376s4hInSqu
 CUPf9oK2/HXYbCGXV91hrGpR1QndmSh8WFn3N8wy8444EDlOqwr6Yd5rqZIPqGHfeLwF
 sQNrJaT0bYNtLA9MwtQ95xEq2gRdbCU4RdJY4y5PVUvLTGCrJybrnQpPzoh1J5LgfoQe
 ShWQ==
X-Gm-Message-State: AOAM532dcZuVBytjxIhN7bPp2x4wRBbeKJRe2sQ8lzmQvcAIqW5gPDvb
 WqAYld+R99P3VcXyuGmp/R2gFYrbSow=
X-Google-Smtp-Source: ABdhPJwKfkWFDu4zyA1xR8KNp7lfF/5PH5PJC2gT1QSPsHR0Zh8h8dGYF3c1L3Spgm2Vp7fct8+Jtg==
X-Received: by 2002:a05:600c:1e8a:b0:37f:deb2:6aec with SMTP id
 be10-20020a05600c1e8a00b0037fdeb26aecmr4808423wmb.86.1645562273691; 
 Tue, 22 Feb 2022 12:37:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b0037bc64fbd17sm3252385wms.11.2022.02.22.12.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:37:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 21:37:46 +0100
Message-Id: <20220222203746.3139075-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sord: fix build without threads
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since the
addition of the package in commit
0d4c8ce8a2f26989e0e2d95b977d60e450c090a9:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread

Fixes:
 - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-wscript-add-no-threads-option.patch  | 59 +++++++++++++++++++
 package/sord/sord.mk                          |  4 ++
 2 files changed, 63 insertions(+)
 create mode 100644 package/sord/0001-wscript-add-no-threads-option.patch

diff --git a/package/sord/0001-wscript-add-no-threads-option.patch b/package/sord/0001-wscript-add-no-threads-option.patch
new file mode 100644
index 0000000000..750ea8f4ad
--- /dev/null
+++ b/package/sord/0001-wscript-add-no-threads-option.patch
@@ -0,0 +1,59 @@
+From 82ab045a45c06187dca5e9d2a9a4003fcfbfa830 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 22 Feb 2022 21:22:31 +0100
+Subject: [PATCH] wscript: add -no-threads option
+
+Add -no-threads options to avoid the following build failure on embedded
+toolchains without threads support:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
+
+Fixes:
+ - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/drobilla/sord/pull/3]
+---
+ wscript | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index fd8578e..d71d78c 100644
+--- a/wscript
++++ b/wscript
+@@ -35,6 +35,7 @@ def options(ctx):
+         {'no-utils':     'do not build command line utilities',
+          'static':       'build static library',
+          'no-shared':    'do not build shared library',
++         'no-threads':   'disable threads',
+          'static-progs': 'build programs as static binaries'})
+ 
+     opt.add_option('--dump', type='string', default='', dest='dump',
+@@ -55,6 +56,7 @@ def configure(conf):
+ 
+     conf.env.BUILD_UTILS  = not Options.options.no_utils
+     conf.env.BUILD_SHARED = not Options.options.no_shared
++    conf.env.ENABLE_THREADS = not Options.options.no_threads
+     conf.env.STATIC_PROGS = Options.options.static_progs
+     conf.env.BUILD_STATIC = (Options.options.static or
+                              Options.options.static_progs)
+@@ -124,7 +126,7 @@ def configure(conf):
+     conf.check_pkg('serd-0 >= 0.30.0', uselib_store='SERD')
+     conf.check_pkg('libpcre', uselib_store='PCRE', mandatory=False)
+ 
+-    if conf.env.HAVE_PCRE:
++    if conf.env.HAVE_PCRE and conf.env.ENABLE_THREADS:
+         if conf.check(cflags=['-pthread'], mandatory=False):
+             conf.env.PTHREAD_CFLAGS    = ['-pthread']
+             if conf.env.CC_NAME != 'clang':
+@@ -160,6 +162,7 @@ def configure(conf):
+         conf,
+         {'Static library': bool(conf.env.BUILD_STATIC),
+          'Shared library': bool(conf.env.BUILD_SHARED),
++         'Threads':        bool(conf.env.ENABLE_THREADS),
+          'Utilities':      bool(conf.env.BUILD_UTILS),
+          'Unit tests':     bool(conf.env.BUILD_TESTS),
+          'Debug dumping':  dump})
+-- 
+2.34.1
+
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index f805805e9d..c06ef9c55c 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -22,4 +22,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 SORD_CONF_OPTS += --static --no-shared --static-progs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+SORD_CONF_OPTS += --no-threads
+endif
+
 $(eval $(waf-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
