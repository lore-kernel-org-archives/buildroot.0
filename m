Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96193C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E8780B75;
	Tue,  4 Jan 2022 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Covt3Y42DWm9; Tue,  4 Jan 2022 20:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B0781D4F;
	Tue,  4 Jan 2022 20:51:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4691BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A99681D35
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yksHSiBY-TkQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:51:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA0FD81D34
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:51:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso431455wmc.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7AtoLNgm+EF+Ry62vDz+5Q/s0jhFlWHZZz1ZhkdcUE=;
 b=ZMRVoHBAANHDzP1pMp7hrhawarX+mMjbp/jqBwElBT8aQPhqsDALf+QSgOtDiBNgOR
 5hS5uhnz+1KVacMBcpRiMVjweNU+mb116I7wp+jzuppiej3BLyvNIMTFXkB5niInx9jl
 KLam9btNpi5WenrIX9YSaBWXYT2MfbpTleOZ3inDGP+q8+zzUxTnIHAxVK5B9LOGwgAq
 xdGQ4v35lc1osgbm2+mYUQCiGknOnngu8OxcJ0o7ZkO8kAUtWPg5xY7hq89+ykh5RZig
 JGSF5VIupiiPelab6m5Sxj44cmxF54B2VpyanDL5jVl+nSxkVhXc/053DgyuRJpCapy8
 Sn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7AtoLNgm+EF+Ry62vDz+5Q/s0jhFlWHZZz1ZhkdcUE=;
 b=X1JLDE9DdgvMp95FFEHonyieNtR4nE3jBJ0GN/8u+p0jNwCizGGKgHyj9sc6CUioei
 ACD7r9gDHQZ55RRVtLZfG58qyJ+MDyvu/YXMrwDYkNlELh0Uy4zo8APhTBklQGH7TfQ+
 IMN6S0IUJT8M3IWt61MWmVcY7Vxgw38TTZwdYUsmxtuQPNsT6V47ed7FBg4CByIwr5KN
 4OpyudgGRNcjtdam0GSZmLx057RlgROPaVUZnj010+D7xPb5ySWdy3kLMpwYpU8jPDvJ
 7+JVs+ceEy0Rq9gie+PNlyvRvjvxGK1EHupRuuU1bEWjS4OSDI1HDfMBDgdKyHi27Lgs
 h8Lw==
X-Gm-Message-State: AOAM530w+7XfhF6N+MjDzU2B6g9HcjV820sjgCrXZvMTyk2CseKyuIjC
 hH3dLMjI3urTKBsyA3dE7VrXibTVbpk=
X-Google-Smtp-Source: ABdhPJyfHs+tboazuP/l6YghacULWT6bwoym7d73Ds7ELnochKf+0UbU/T79u7Gq9RyzsCwXq614CA==
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr107470wmj.166.1641329467655; 
 Tue, 04 Jan 2022 12:51:07 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p13sm33427386wrs.54.2022.01.04.12.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:51:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:50:08 +0100
Message-Id: <20220104205008.3631801-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104205008.3631801-1-fontaine.fabrice@gmail.com>
References: <20220104205008.3631801-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/collectd: add virt support
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
 Asaf Kahlon <asafka7@gmail.com>, Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 18 ++++++++++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5e5dff6fe1..697dc51f7e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -591,6 +591,24 @@ config BR2_PACKAGE_COLLECTD_USERS
 	help
 	  Counts the number of users currently logged in.
 
+config BR2_PACKAGE_COLLECTD_VIRT
+	bool "virt"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS # libvirt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libvirt
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64 # libvirt
+	depends on BR2_PACKAGE_HAS_UDEV # libvirt
+	depends on BR2_USE_WCHAR # libvirt
+	select BR2_PACKAGE_LIBVIRT
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Gather statistics about virtualized guests on a system.
+
+comment "virt needs udev /dev management, a toolchain w/ wchar, kernel headers >= 3.12 (4.11 for AArch64)"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_USE_WCHAR || \
+		!(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 && \
+			(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 || !BR2_aarch64))
+
 config BR2_PACKAGE_COLLECTD_VMEM
 	bool "vmem"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9d6f630fe3..5751757040 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -22,7 +22,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
-	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
+	tokyotyrant turbostat uuid varnish vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
 
 COLLECTD_CONF_ENV += LIBS="-lm"
@@ -149,6 +149,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_UPTIME),--enable-uptime,--disable-uptime) \
 	$(if $(BR2_PACKAGE_COLLECTD_USERS),--enable-users,--disable-users) \
 	$(if $(BR2_PACKAGE_COLLECTD_VALUE),--enable-match_value,--disable-match_value) \
+	$(if $(BR2_PACKAGE_COLLECTD_VIRT),--enable-virt,--disable-virt) \
 	$(if $(BR2_PACKAGE_COLLECTD_VMEM),--enable-vmem,--disable-vmem) \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
@@ -197,6 +198,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
+	$(if $(BR2_PACKAGE_COLLECTD_VIRT),libvirt libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),libmicrohttpd protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
