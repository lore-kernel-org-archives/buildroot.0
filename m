Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9775DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8396076C;
	Sat,  1 Jan 2022 14:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfqLe3D9Q4FV; Sat,  1 Jan 2022 14:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C078605EE;
	Sat,  1 Jan 2022 14:04:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E03B1BF39A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8723B605EE
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7nMaJBgz96Q for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B69F060596
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:04:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q16so60734983wrg.7
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMbLjkiOiGAIW/ak/uPwSnManzUTNxb6a9NGj7GaGA0=;
 b=pl/FhKOkFq2jwpo0ZYwJDoubeksujFi6sCO/LtDlhv5Z7C3prqu9OHw50J7oydQz1C
 G0oA/wtTQCEwCw7v/uTYF+/SNOItSLDEpFT+Gil+nwbwAahsnzX+YYHNz/xFun5ACc+w
 CLPcY2jMhsa0+NBj8TNUfP246gGNmbg5I/zPj97wvHaLsYlZNR6TQWtyTqocUS1A4jMm
 vgF4dsBZM9+P7v8fRdlJwnSRIVAkhRUIUpqJObXXZHGwQwAYMp57NzoVeKwXSAuOEtyD
 3wxjybhFMHO1IC/RQTHZ6rBrbXEx5DMxZ2YMMaB4p9zhpwHhY7uZns1DiUo1DfAdSD9n
 PEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FMbLjkiOiGAIW/ak/uPwSnManzUTNxb6a9NGj7GaGA0=;
 b=sJRBRsEMUhj9t5DuAKZLtqwRBLq+2PQGeUVSuMO+dQjFYbKFNJLKwAejzICkeHgIAm
 MKjgI82tV/qdJcbpkyo2hi1ounZx7svcvrWNvPhzkEJ3cIieN4a9/H99JpS/bZnLbGR3
 nxSriuCcqJRugA2Kw7YxWRSLYUUz0bV+QMAvZVuK8YrS18BFLL0DqhL/Fwb9/pbWcdOj
 9BbV9dBnTdW7yNmwNp7gyzoOQcsa03jUsRq2zTb10sGIDHvgOUE1TLNp4gmz5DbaEM07
 KI7YLTC2wJBkkCvbvNrLGlItgXok8zzrlukoK5Twu9dLDJHMIST/PLBkO9Xmkm0YRXpG
 6P8Q==
X-Gm-Message-State: AOAM532BPapuHK9+Db8LhVq26JOu+znbdsvjQ30zxMO5gCAOtReLettj
 XRVErql3sf4EF/ViuawYMoKhrlLPRys=
X-Google-Smtp-Source: ABdhPJwtEU3KMpnrZCWB6ZAxHBdydJBdzAlcepQTs8ym/SncwfP/Au+0qcVB2Ff93GkOLMiToAxzTg==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr32928473wrf.56.1641045853830; 
 Sat, 01 Jan 2022 06:04:13 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id h19sm28053146wmm.13.2022.01.01.06.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 06:04:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 15:03:24 +0100
Message-Id: <20220101140324.1001998-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/collectd: add ipmi support
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 11 +++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 05fb577345..5e5dff6fe1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -312,6 +312,17 @@ config BR2_PACKAGE_COLLECTD_IPC
 	  IPC counters: semaphores used, number of allocated segments
 	  in shared memory and more.
 
+config BR2_PACKAGE_COLLECTD_IPMI
+	bool "ipmi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_OPENIPMI
+	help
+	  Read hardware sensors from servers using the Intelligent
+	  Platform Management Interface (IPMI).
+
+comment "ipmi needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_COLLECTD_IPTABLES
 	bool "iptables"
 	select BR2_PACKAGE_IPTABLES
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d01058471d..9d6f630fe3 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_SELINUX_MODULES = apache collectd
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dpdkstat email \
-	gmond hddtemp intel_rdt ipmi java lpar \
+	gmond hddtemp intel_rdt java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -88,6 +88,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_INFINIBAND),--enable-infiniband,--disable-infiniband) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPMI),--enable-ipmi,--disable-ipmi) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPVS),--enable-ipvs,--disable-ipvs) \
 	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
@@ -174,6 +175,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPMI),openipmi) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),luainterpreter) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
