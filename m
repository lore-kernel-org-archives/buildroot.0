Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487DBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E013B610F5;
	Wed,  6 Apr 2022 16:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyKKfWQl3qpt; Wed,  6 Apr 2022 16:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DADE60EDD;
	Wed,  6 Apr 2022 16:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B02871BF593
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACDFB40AE2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3K1lqhOgOI4 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 16:34:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A549740141
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:34:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so2042780wme.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 09:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQeAtvjkfFMm6PhJ1+uHuB36PgK9vKzLYvSLD26VVoc=;
 b=niTxyXpj749IDRHIUyU23gYlThgibzTKSKeg1C3tbrVHXSGitd0Jh2Qxe83vogOERA
 GLXLv/+uxXm45EamTXspjJre8pS/bDWzjyfO/uTTVqXGbTO91GR3KBEU3g48O58En6h0
 gl/AhscSATWTIn1g3kVkQR9d5ZQdbYOX6Z9in3/KGsdDCR5Cp4hvsdn2YOjRtgPnrdIS
 Cq8SiUSS0zeY2OhIpPlGcti0oaA8bstCRkFtZvnQDQwY10Cs0W4koJ4ANzHOkMIzK/QN
 vqb/b3jmHmOsoZKkVoJV0XbjVpwUeEJa/7FshZ+PafRjUhnJ8RL39LS6muMleIgASPbb
 ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQeAtvjkfFMm6PhJ1+uHuB36PgK9vKzLYvSLD26VVoc=;
 b=rgA0pUxYCmY5m6GDiRXwB/wSPoAdfyfZtiYJZaUN30xiAxEpJLhGXkXJG2pvNskurF
 VgDO8jH849KV84Kt3aLq2Hm2cVL4ngO1ugx0AqpFyjaNuvxuzt9lkyAc3TIO9fYc34gB
 tollecYvhjiF+Zu2Y+9IoSmRL2LkvxiUN++6EKYn8yITswc4fjAWkGYcYefcESlwMzsu
 FLshY8eznO9SFlK8MgQoJz/WsUevi0+SsONTgeg0M0KSNETL/t677BS4hV85GU4SbU+S
 MKyaPwGT+r7/EChj3g24FTd7ZW1AjocSkliyaaTgi/rCbUi7bSt3GPxJdayNVCc2iefb
 4tGA==
X-Gm-Message-State: AOAM53046s67OIlWkEsF2r5hxVAFopag+NltNfzd+WZ0ULbhVwH3nITO
 mee2T3j9msUBANXxQyHSjzY/Q1/IE4o=
X-Google-Smtp-Source: ABdhPJwKYZ9P6F67dDGTWJu7NaVj/aM1C/bC7mb8bFxeaGi208FzRJEe82b3J5pcz6SS6qdCQbrz+g==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr8476036wmi.91.1649262883688; 
 Wed, 06 Apr 2022 09:34:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d6c6c000000b00203ec2b1255sm19023707wrz.60.2022.04.06.09.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 09:34:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 18:33:00 +0200
Message-Id: <20220406163300.4006892-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/polkit: fix build without C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since switch to meson-package in
commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb and
https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/polkit/0003-fix-build-without-C.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/polkit/0003-fix-build-without-C.patch

diff --git a/package/polkit/0003-fix-build-without-C.patch b/package/polkit/0003-fix-build-without-C.patch
new file mode 100644
index 0000000000..8e16de256c
--- /dev/null
+++ b/package/polkit/0003-fix-build-without-C.patch
@@ -0,0 +1,50 @@
+From abbc04f6f3acfc2dfa34b1c07decaa658786e142 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 Apr 2022 18:33:08 +0200
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++ raised since
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:
+
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
+
+Indeed, C++ is only required with mozjs engine
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/polkit/polkit/-/commit/abbc04f6f3acfc2dfa34b1c07decaa658786e142]
+---
+ meson.build                   | 2 +-
+ src/polkitbackend/meson.build | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c6765fd..da60930 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project(
+-  'polkit', ['c', 'cpp'],
++  'polkit', ['c'],
+   version: '0.120',
+   license: 'LGPL2+',
+   default_options: [
+diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.build
+index 266f280..7c5d443 100644
+--- a/src/polkitbackend/meson.build
++++ b/src/polkitbackend/meson.build
+@@ -38,6 +38,7 @@ if js_engine == 'duktape'
+   deps += libm_dep
+   deps += thread_dep
+ elif js_engine == 'mozjs'
++  add_languages('cpp')
+   sources += files('polkitbackendjsauthority.cpp')
+ endif
+ 
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
