Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 16:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE15D41846;
	Tue, 29 Mar 2022 16:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ms3dbS4xmX8t; Tue, 29 Mar 2022 16:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8059B4183E;
	Tue, 29 Mar 2022 16:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 021331BF30E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F03864183E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 16:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWn0Ch1nFOnl for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 16:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02A764021B
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 16:40:42 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id y16so4671329ilc.7
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G03jJmNl6ZFuJ92+LxvDSws6ELG8aIhmY4SnS3SJVps=;
 b=lZE3QHtY9+HxwIxiEALp4HR2qk6lH/OP531Xs1V/axkSUZ1F2H2AFXEUEyXVBoPLEh
 pdH5LGrLMj8vMv7K6yOUM4M/YeunYQ+BMAATY4J6STiHTCLxoC589un1VQoRvio2ptGj
 tKgo27Ox13x23hlZGeumaXS4jwy4lcqnEVeJRaToc/bUtyJSOiSMbvKyXoce0LsSnHRK
 1EJIZuVdZ6qSfC7i+zCw48X0igXxvbvKq7eVhR5mQbjMqajtH5DjqFBvYvDi5hWKuFYg
 UhWpiciTD1W0LkrawvY2su9hOCREktXH34u5D5LQ9AbsYWEWubgWbzwkREAz6ysKhKFF
 f1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G03jJmNl6ZFuJ92+LxvDSws6ELG8aIhmY4SnS3SJVps=;
 b=t3goY5QnqrT6o2T5rnn85Hsw46TyVIthXAz0ebRQCAc4OMF+o0Rz1mcio6KlS6DXa0
 cB1pW+lZeB+opxpGAFooPzkhn/r1LiykKJa8c3XANUgpRh74SPh3tgd1MF1uZs3v6GCS
 ywGUesedKhZMfYX3ROBt8uhNRS8eOSV24mORZ8Wt0ZrdsEUKick/8cIF2HmdxMJyO1qS
 YX0MXyzaxoTCbR16rDuU+xL0DIhbn0T5804v630Mosz6IC6BChizROr9lJSnnbUnhMRa
 wnM2/Mj3PJedYNRiF/RgIpxJUzgOO7SMYWb+ImW6bLzHdZKxO2aGIPfYifndkj5J5XJK
 BN9Q==
X-Gm-Message-State: AOAM533JuodyafI6SVSqhvZAnUEUQG/qw93A+c42AAZRU9+ldK7Fl+M2
 IP9QGXO9AOykfs6a96+qQROyO0Ev5wV+lg==
X-Google-Smtp-Source: ABdhPJyOmV+xAa5RdYObnFXq2QKqtACEKAlzbXSmPOXtXM4r2c/fkO6k5BTF52PmG8g5C10Y0y2Egw==
X-Received: by 2002:a92:d9c7:0:b0:2c8:7bf5:b85e with SMTP id
 n7-20020a92d9c7000000b002c87bf5b85emr8710029ilq.275.1648572041705; 
 Tue, 29 Mar 2022 09:40:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 u11-20020a056e02080b00b002c87d5830cbsm7759940ilm.40.2022.03.29.09.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:40:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 10:40:36 -0600
Message-Id: <20220329164036.4045575-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cog: fix software rendering
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to backport a patch to fix software rendering with cog.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...K_VERSION-macro-name-and-fdo-buffer-.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch

diff --git a/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch b/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch
new file mode 100644
index 0000000000..fec21c225c
--- /dev/null
+++ b/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch
@@ -0,0 +1,42 @@
+From 717fadb2f16fcb28b3b72dc6d796c8ce9ae14afc Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 26 Mar 2022 13:30:47 -0600
+Subject: [PATCH] Fix WPE_FDO_CHECK_VERSION macro name and fdo buffer release
+ function name.
+
+(cherry picked from commit d2720103ff8a5c3c5c056487586ed0b5acdc2b91)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+717fadb2f16fcb28b3b72dc6d796c8ce9ae14afc]
+---
+ platform/wayland/cog-platform-wl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/platform/wayland/cog-platform-wl.c b/platform/wayland/cog-platform-wl.c
+index 0ff9e6f..46c5185 100644
+--- a/platform/wayland/cog-platform-wl.c
++++ b/platform/wayland/cog-platform-wl.c
+@@ -63,7 +63,7 @@
+ 
+ #define DEFAULT_ZOOM_STEP 0.1f
+ 
+-#if defined(WPE_WL_CHECK_VERSION)
++#if defined(WPE_FDO_CHECK_VERSION)
+ #    define HAVE_SHM_EXPORTED_BUFFER WPE_FDO_CHECK_VERSION(1, 9, 0)
+ #    define HAVE_FULLSCREEN_HANDLING WPE_FDO_CHECK_VERSION(1, 11, 1)
+ #else
+@@ -1705,8 +1705,8 @@ static void
+ shm_buffer_destroy(struct shm_buffer *buffer)
+ {
+     if (buffer->exported_buffer) {
+-        wpe_view_backend_exportable_wl_egl_dispatch_release_shm_exported_buffer(wpe_host_data.exportable,
+-                                                                                buffer->exported_buffer);
++        wpe_view_backend_exportable_fdo_egl_dispatch_release_shm_exported_buffer(wpe_host_data.exportable,
++                                                                                 buffer->exported_buffer);
+     }
+ 
+     wl_buffer_destroy(buffer->buffer);
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
