Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E9FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160C040908;
	Thu, 30 Dec 2021 16:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64hvzTr7F10t; Thu, 30 Dec 2021 16:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855C0408F2;
	Thu, 30 Dec 2021 16:54:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 047291BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF78940104
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrlsy2uizcj7 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADC68400FB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:54:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o30so13446370wms.4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 08:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mBu4iDrhyuyGczEcIy2jO50Y0DJsAddcp4pVX9U1UWc=;
 b=S1LXEdJSHfWkoBB2lSg77CnQRAA/hZOsPjVi+9lDKmSV+Z2damVS7sfMImXbTXT2aM
 fD7oXUWjbBkFlMnva9MSVQ6j46Xp1VEnyvEkzzvYOxFsd9YqnaSHuqp2kfzHgc8hraBA
 uhSNIMr+cC59/fkID/bFhcS2lpi2Wnw9u4qP+DFCOdS9S82fdIKE7Ir+GO13Kz7AL3D0
 QC+ZsqVbHrGIvVSI+dAhh00DgnucW9tla//t34FHq2LdIWmgJu7B19X7XwrDwWiXZalA
 usD49/23MueaCps7j4cEUd0oMsB+SqULwV5MtzpKu7yBt2Hwct7zRL8KdH/OhmazjNkN
 qxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mBu4iDrhyuyGczEcIy2jO50Y0DJsAddcp4pVX9U1UWc=;
 b=vYaInLDKjHMXTbzemWyvC3PSqxuemv6cGrdmgHI8lAzkbI0yGooQqjDyE3J/1y32eX
 eXR4XlwqCB6juolH1tsgDYw6pa463HlXctIQpTS+iC2yxWC8Q75859BWsheN/3WispPM
 kkbtkoViOFIRD5ndxaSo+J0fMlykDh4WUQXKeCTGWpJVyXMaZY4T83d/qXpaXv7g3J1Q
 e+htC26z9BdfSr4ZcJvauqL6W1F4pZoBSFvXq0VKYNTHvgSaTuFKNtxjbF9VuAC3r0zV
 TQSiEvXDchao4baP6HCAigxBuHF1gcEnbfDpoOcwvBp4SSSIEp2KS6UZ3qDhNXC7fg4j
 O+4Q==
X-Gm-Message-State: AOAM531v94l+UJpw/NSRA3Gye9Fuap3MzYSBO1FmAqrVgEG3HpVTvUm3
 88eXXERokPkrbhKFEvJXTZtKFV+nfR8=
X-Google-Smtp-Source: ABdhPJyc22q9Y+tuO4hQpYjwnBEqBXqy3zILVevYx9Ffu+6OZrVxFSoJaeleti/6xMHdAUAbjeTteA==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr26216490wmj.159.1640883294751; 
 Thu, 30 Dec 2021 08:54:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r11sm24584340wrw.5.2021.12.30.08.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 08:54:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 17:53:51 +0100
Message-Id: <20211230165351.2747283-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/neard: fix autoreconf
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.18 in
commit 81d14a86258592b66b3cb170cda554a1eabf2c3f:

aclocal: error: couldn't open directory 'm4': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/f8e26416e38c83e27e7945343f497a6c9310bfcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neard/neard.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 1ab3aa353e..51ba52fb90 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -15,6 +15,14 @@ NEARD_AUTORECONF = YES
 NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
+# Autoreconf is missing the m4/ directory, which might actually be missing
+# iff it was the first argument, but unfortunately we are overriding the
+# first include directory above. Thus we need that hook here.
+define NEARD_CREATE_M4
+	mkdir -p $(@D)/m4
+endef
+NEARD_POST_PATCH_HOOKS += NEARD_CREATE_M4
+
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
 NEARD_CONF_OPTS += --enable-tools
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
