Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D18C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67E5823EB;
	Mon, 14 Mar 2022 18:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itnS8JN9U1xk; Mon, 14 Mar 2022 18:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D92E181926;
	Mon, 14 Mar 2022 18:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37BB11BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2619681926
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfRKqgf_u-nD for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:16:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE8BD818B5
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:16:36 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id l18so12044002ioj.2
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 11:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTu2ByzhZHwfrbP1xzoJoDBVFhUdcFU1sK5AVmszWQg=;
 b=TRTaJed0DTwQDKn+BbJ6xCoyrISHYyRHBR1Y9kwvlfCvPlzfQxkgLqZWglmPGMaYV3
 aTtb+Qk15s9wvPChh0TUYwn/uOyhvaBKWYHKzzjFQFtxTYiTLcaSRFWlJrllik443A0/
 fzkErdmq/hx11fBNbZgcl9P7kVNAZN30LAcNgeJ1jhjG3tALVmqIH9R2VflMRK/WZXLU
 wp46+UovjR+ENTD5zrJ9zkl9s+TcsYs85gkso75f4IYdhCqir4DoPe/sqou3aLbd8LUr
 H2/EktjjMD+bbnXaumG1kY83sSDngkyaxbWSNUuk8EerMV8mgyXr3YgGji/+b8dWP4PX
 S+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTu2ByzhZHwfrbP1xzoJoDBVFhUdcFU1sK5AVmszWQg=;
 b=6AYqlTiMrXJpckdKufyAzzwgsqbImv9/O5N2OxvtG1ehdxFNDsbi/5a5ssrLeUg1js
 fmRaGEu1O15ZtgHI0Iul9P8o+Ha0fLlAEU3LpFLzs8fcSv2A6KXIzBg2QC2qZvHZAe+L
 LAXSCND4J9TChGMNxlMLwJIGwt4HZfou1h6irmMAhu+Zy6H+Qi3jxfcOxKLG5sGKS4mn
 +0PrDxpx4nJuQe4YhWeqLmafwTsMTSeQ8wtEgGZzPkNzNzGz0bUa+5697j0Cb/xZy4bu
 mVTXWi9WoGdiwfVKwok33Hfh9kyM+QCTZpFu1Z6MGZcKqx5+wEpQQD6marumV6wA04aS
 VrZw==
X-Gm-Message-State: AOAM530T0nc7qwTpz87uCtpDjeHR0yefLyna949pqG9oKorxdW2PKezj
 5bYt2gxkR3KPmPqMtj7bNf914y1ynJA=
X-Google-Smtp-Source: ABdhPJwr52zYvRDlhG3XIyml5UWEQB2Rz/D4rGtEj9vtVcLGLbUUqXTG8JycmGJwo+cOBl5KydnDTQ==
X-Received: by 2002:a05:6638:1384:b0:317:aee7:a1f6 with SMTP id
 w4-20020a056638138400b00317aee7a1f6mr22131347jad.160.1647281795792; 
 Mon, 14 Mar 2022 11:16:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 h28-20020a056e021d9c00b002c64c557eaasm9491039ila.12.2022.03.14.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 11:16:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 12:16:34 -0600
Message-Id: <20220314181634.2155997-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: bump to version
 0.14.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...d-check-user-xenv.sh-for-systemd-se.patch} |  0
 ...treamer-check-1.0-unless-tests-are-e.patch | 33 ----------------
 ...on-python-module-for-python-install.patch} |  0
 ...tive-symlink-for-gstd-gst-client-exe.patch | 38 -------------------
 package/gstreamer1/gstd/gstd.hash             |  2 +-
 package/gstreamer1/gstd/gstd.mk               |  2 +-
 6 files changed, 2 insertions(+), 73 deletions(-)
 rename package/gstreamer1/gstd/{0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch => 0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch} (100%)
 delete mode 100644 package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
 rename package/gstreamer1/gstd/{0005-Use-native-meson-python-module-for-python-install.patch => 0003-Use-native-meson-python-module-for-python-install.patch} (100%)
 delete mode 100644 package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch

diff --git a/package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
similarity index 100%
rename from package/gstreamer1/gstd/0004-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
rename to package/gstreamer1/gstd/0002-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch
diff --git a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch b/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
deleted file mode 100644
index 495fbfc3fa..0000000000
--- a/package/gstreamer1/gstd/0002-Don-t-require-gstreamer-check-1.0-unless-tests-are-e.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 586bb97459e72da30bd9991c228b6b8e9251c68b Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 14 Sep 2021 01:49:49 -0600
-Subject: [PATCH] Don't require gstreamer-check-1.0 unless tests are enabled.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/RidgeRun/gstd-1.x/pull/248]
----
- meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1d9ce9d..76990a0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -22,10 +22,12 @@ gio_unix_dep  = dependency('gio-unix-2.0',       version : '>=2.44.1')
- json_glib_dep = dependency('json-glib-1.0',      version : '>=0.16.2')
- libd_dep      = dependency('libdaemon',          version : '>=0.14')
- jansson_dep   = dependency('jansson',            version : '>=2.7')
--gst_check_dep = dependency('gstreamer-check-1.0',version : '>=1.0.5')
- thread_dep    = dependency('threads')
- libsoup_dep = dependency('libsoup-2.4',		       version : '>=2.4')
- 
-+gst_check_required = get_option('enable-tests').enabled()
-+gst_check_dep = dependency('gstreamer-check-1.0', required : gst_check_required, version : '>=1.0.5')
-+
- systemd_required = get_option('enable-systemd').enabled()
- systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
- 
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch b/package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
similarity index 100%
rename from package/gstreamer1/gstd/0005-Use-native-meson-python-module-for-python-install.patch
rename to package/gstreamer1/gstd/0003-Use-native-meson-python-module-for-python-install.patch
diff --git a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch b/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
deleted file mode 100644
index 265ea8d8c3..0000000000
--- a/package/gstreamer1/gstd/0003-Use-relative-symlink-for-gstd-gst-client-exe.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a670beca8dcc76171dcfe3f10970d76c6f0439be Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 14 Sep 2021 02:49:10 -0600
-Subject: [PATCH] Use relative symlink for gstd/gst-client exe.
-
-This should fix the symlink path when cross compiling.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/RidgeRun/gstd-1.x/pull/249]
----
- gst_client/gst_client_symbolic_link.sh | 2 +-
- gstd/gstd_symbolic_link.sh             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst_client/gst_client_symbolic_link.sh b/gst_client/gst_client_symbolic_link.sh
-index d8d7617..b87dd12 100755
---- a/gst_client/gst_client_symbolic_link.sh
-+++ b/gst_client/gst_client_symbolic_link.sh
-@@ -4,4 +4,4 @@
- # $1: target
- # $2: link name
- rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
--ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
-+ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
-diff --git a/gstd/gstd_symbolic_link.sh b/gstd/gstd_symbolic_link.sh
-index d8d7617..b87dd12 100755
---- a/gstd/gstd_symbolic_link.sh
-+++ b/gstd/gstd_symbolic_link.sh
-@@ -4,4 +4,4 @@
- # $1: target
- # $2: link name
- rm -f ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
--ln -s ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
-+ln -s --relative ${DESTDIR}${MESON_INSTALL_PREFIX}/$1 ${DESTDIR}${MESON_INSTALL_PREFIX}/$2
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
index 6ec84bd58d..20c821a27f 100644
--- a/package/gstreamer1/gstd/gstd.hash
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  94c10c798d3618b63cc68cbe053fabd19335a57f982a47b3d66c27c37d325da3  gstd-0.13.0.tar.gz
+sha256  56afd58530b63d0d88dd818fd4e6c9230861819b3e131c6a87a46084c3f3fa96  gstd-0.14.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 959e277272..08a29f26ff 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTD_VERSION = 0.13.0
+GSTD_VERSION = 0.14.0
 GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
 GSTD_LICENSE_FILES = COPYING
 GSTD_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
