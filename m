Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBE8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6173360B36;
	Fri,  7 Jan 2022 21:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yy9sNkloXuol; Fri,  7 Jan 2022 21:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AB060ADD;
	Fri,  7 Jan 2022 21:53:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDD51BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D48E60ADD
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qr7Maaz7nMSK for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F27160A99
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:53:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso5700128wmj.2
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UuplFxb9GAYLZCaJvn+/AkyPs5Kv3x0LF3OmH8oURPE=;
 b=RhSax3VnSQoyi/WV4dlL0ZNhDgsgoVMemhbeSwOLcbyhsM2iWsPwWolYzdqRblGCPG
 QoGIEcWPExM5xZojBDL+53GzAbhauZ4UEZR712Kvm57vK8/cpKs8umZ5LzyIbm/aZKB8
 kV5yfqbvXF68QnSQtXspEoqSYVcUAdynJxbNailzPVJyHVJMbbeYWeZZMyb+gHwJoDgY
 2ZsMsL26jI6XUSCAXhZb5mfrt8btw1gdrl6G2fF6IBR/2GeHRZoWX6r7WOvrT0wM0Wmm
 WhitcNyuobFzCzJCddztueK4QwoCec2sXWLeBO5c3rLr7SVpunTxf5sd1AHDjrzigDBH
 mC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UuplFxb9GAYLZCaJvn+/AkyPs5Kv3x0LF3OmH8oURPE=;
 b=s+0tHSqZ242H5ZAArFlrT18GGkMHGgqzxujmMd5+OreUoFDrbUGUg0NyWwfYliQZum
 Hv/CS22cRAR5EPE/9vYmVW9v/XCfzgMx/dCGcvncmSEkF54jkmkAtKXScdrK2mSCES+Q
 Sxx0oek1xO5crBf7mbYw86/oc1s2rioFkj2y+N8OUyAnJ36S+/fVKI2+n1YiMAl6uhma
 SB2dL9GnYVkUaYJXGCKS99enbSZldL0H336+gbuFGpyCRAE7ZaiDqmI5kXs900X/MAqz
 lutn3yKwwVKWGpmzn5luNWLxkJ2r3mQJYaQsbL7f/RCmS4w+3k+g0+H1aGf7duY6DBfd
 fgBQ==
X-Gm-Message-State: AOAM530lN03cPKw8EWU+D4RG+vbUXFks2CzDpogDMBy7Js5JxIZHkBXl
 tsQ4ZHTp3oxLvqsBWAesx8Inh590k4A=
X-Google-Smtp-Source: ABdhPJybXkp0eMfr6Z7SxDF8CG3onqUjq1dEZcFlZELtIL5x2C1FUpqiHKqMMFJRAJmCM+4LBYAcyA==
X-Received: by 2002:a1c:1b8f:: with SMTP id b137mr3709693wmb.115.1641592415693; 
 Fri, 07 Jan 2022 13:53:35 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id 1sm6321942wrb.13.2022.01.07.13.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:53:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 22:52:29 +0100
Message-Id: <20220107215230.1672766-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6,1/2] package/libpcap: add host variant
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-libpcap is needed to build host-zeek

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 1e02ec56e0..21422b2c0a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -11,6 +11,7 @@ LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
+HOST_LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
@@ -23,6 +24,13 @@ LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag \
 	--without-dpdk
 # Disable dbus to break recursive dependencies
 LIBPCAP_CONF_OPTS += --disable-dbus
+HOST_LIBPCAP_CONF_OPTS = \
+	--disable-bluetooth \
+	--disable-dbus \
+	--disable-yydebug \
+	--with-pcap=linux \
+	--without-dag \
+	--without-libnl
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -50,3 +58,4 @@ LIBPCAP_CFLAGS += -fPIC
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
