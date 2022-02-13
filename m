Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346F0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 01:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C180403A7;
	Sun, 13 Feb 2022 01:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pUTVwE43WNl; Sun, 13 Feb 2022 01:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B6F4035D;
	Sun, 13 Feb 2022 01:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD681BF5A0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 01:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC4960AD8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 01:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRLxvCfpMAlA for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 01:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A50F460AD1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 01:40:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id y84so16102465iof.0
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 17:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHrUgI+IKk+5hyAUGleuAY76UiHh+clOKIJE6KC3VDo=;
 b=DZ6Glp5T0lt+RvbQ6Fifmmp44zJsfP6AfklOpzzVE753sp32jTgDgbnkukizNl81P+
 UhQAcfRHZKKbfA/V87QudjL8O/2igC8UyDLem3nXv8wF6EeJI5fwJCOrtSLmj4bOuZPj
 xTp+VJpinAOo8v0ohGURDqGCzxsJauHLA0AzjI8AOvi9PjBemylQ+PR7B90oIh0Li3i8
 8LoLIyxVHO1NsrbL8s/9ZMjk2F5muZCF97bUQ8i/y1p+b0qVq2AOW4ASCLdoXA8LRwg+
 a91ogtCreeQQl1H+ujBpvDYMc5Az9CoDbKzPYVPG+w2KeNH8hBFDrP05GQOZjSo21qcj
 TNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHrUgI+IKk+5hyAUGleuAY76UiHh+clOKIJE6KC3VDo=;
 b=yCP88mFFmmwy3GWRkWiCI9B4CYzmFbsRdkOt7eZwzv3hFQXlJo5V8YfPnCaofNn04y
 hDEtTLTptoe1dhkSMhxoxmjN+YbdsmvWDI+4mA19IwctyZ09Gg4yCdwYceps4RviS4Qd
 utcTfZCe3hMT6xzTTA78Zs/4IHqXFEjZP9V7nQAhQwE0ZGtnU5ELOOA2tEWdLYSG4v/6
 DuCvlnWWeO5nxwCDRSbLdXObJwoVU+Ei5FcvkdY0xqo8sCPEWVpt6JeHlj5jpXFsL6uk
 brZy4AQO2g10EF0/wm9nQdxBrYl5Rheb6mnU54U9yk3cAZyepoLBcsJgMWgHQTQ4i1NA
 nMHA==
X-Gm-Message-State: AOAM533jaesz51MbuQLnXykTc3phVPQQ8WRGEJGDNlLrJIJn3Tse3CeG
 3KXGItEVI3py9Rl9kChOcbNwK7zPLXR5Ig==
X-Google-Smtp-Source: ABdhPJyfap1LjCIhQwJB+yjUKs1HRol7u3l9iQGFT/GuDzmgn4pVTz4NNz3gZ0yavqas9W55SSj8HQ==
X-Received: by 2002:a05:6602:2c8a:: with SMTP id
 i10mr4142612iow.98.1644716426500; 
 Sat, 12 Feb 2022 17:40:26 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id f13sm16826540ion.18.2022.02.12.17.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 17:40:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 18:40:24 -0700
Message-Id: <20220213014024.1868278-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add optional lv2 support
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

Pipewire supports lv2 via the lilv dependency.
https://github.com/PipeWire/pipewire/blob/0.3.45/meson.build#L451

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index fc521c86ac..2a38db9977 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -29,8 +29,7 @@ PIPEWIRE_CONF_OPTS += \
 	-Dvideotestsrc=enabled \
 	-Dvolume=enabled \
 	-Dsession-managers=[] \
-	-Dlibcanberra=disabled \
-	-Dlv2=disabled
+	-Dlibcanberra=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -129,6 +128,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LILV),y)
+PIPEWIRE_CONF_OPTS += -Dlv2=enabled
+PIPEWIRE_DEPENDENCIES += lilv
+else
+PIPEWIRE_CONF_OPTS += -Dlv2=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 PIPEWIRE_CONF_OPTS += -Dx11=enabled
 PIPEWIRE_DEPENDENCIES += xlib_libX11
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
