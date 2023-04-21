Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C4C7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 01:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18AC261136;
	Fri, 21 Apr 2023 01:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18AC261136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ri1rq5st3y76; Fri, 21 Apr 2023 01:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 311A461377;
	Fri, 21 Apr 2023 01:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311A461377
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEA41BF2B8
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 01:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F206661377
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 01:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F206661377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jASn74HNr3M for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 01:27:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F4261136
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04olkn20827.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::827])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7F4261136
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 01:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyRS9uIUxwSCM9kE+cUwBVKAnjtrv85l8UlSJ3i5yIB/Vsph2lzkKVdziQ1mX28fNlaiJ/ysYYeMh4VCf3u2/ihEOPzcQgzK+Ia9nVXnuXnvs7irvDhhcWK8lBXz9+B9aHIbfBUMxUmxj0zsNGHvD9iyQgSIRojdJr3gBv9q/LWitTy+vI1QdfdW16adYqI2fS81Lj4rYllUUIJo2rkiN+raOb3nwjzc689GdsLv45aMTOVLZZgXjjamDYqROFOfqemrLXnub75xm/DEs6DiStwoEpg4PI7bqeum/ePVpBWK5K4+3/WCtQoqsELzvMmT2hOMLW1uHh4QDJFpeB7weg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNm2ttmuPprhmNt8ctPToe4QcCdpuDJzHic7b3U9WqU=;
 b=XOLhaPY2oFKjYkMd8nZ8BHvWWyMSBdnHvv6ql7Mf6jPTDmhz6apPJZK5NsUwJJrwj9uF93IQV5T7FKH6I8laxcpTlZpXetDH8RPCd1PnNkJtjP8LM7XSC2bDiKViB7RsMBDjz3VzLFf9aPM3L28Jfe3hXpSzjPjzrDCzfallIIUeeaO/F+i0DnyWEYPPdlyKPZYIJofIKKB/uWAgXI7aQcF3RDk63w7GSD9ntIkyj2CAxBxpsN6bpNU4wPMHR78qGGLQDxT86KrODzjDRUjapSyo9Yq3cZ/ypU42+h6Hjvxg60Pe6n6vM6HsrCfpuYNybm+OCdc1+mr/5xGuUjhSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SJ1P221MB0871.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:45e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 01:27:51 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 01:27:51 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 21:27:23 -0400
Message-ID: <SN4P221MB0682ABC40517FCD64554389EA0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [JrQU9C8JUiiqWWBGMO8jiy98Uqwr5V8A]
X-ClientProxiedBy: YQBPR0101CA0225.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::6) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230421012723.2207-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SJ1P221MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: 305cfd88-fd7c-4a05-aafa-08db42079f46
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mut0ZTEc/+RhwzsFjQD3otIDfBl0E3epjudgPINDRi1iOfhAuXoxsDumipOIO5nrnJWH9UNzeyYks6dhLchQYTHJ3oDwj+e7wyJGDe0CelZqwVqZ8yAwEtMSkOS8KblYDuJVCti6kylYIzrE2CRQvuZ4JSvwa+VnBroSAntKfcmtJLAg5D+EYmBBLNIVkKOPjjedXPfWROEAyoWXlRn2ByKMo4LUKJ/GSg+WHz6izwm7dPLL5fDvKcxivM9J7Dy3g0cAvar7ZK2DMs8xemXAKVVwAumiHOS/ep2Zap0gGxwl74PzMbtAXjMWb7VyvRWnNIZsD+p6/U7zvnEyvgRuKHGgm9dEcuPEcopN1RI8HtVFGNf07MJs4YClCHv4rMSvPYO2Ter0OHxy3cvV5yIqKDweir2+GjUVQLh3rF8HMzPw8WBhKbAqogEOd3lLQmYBUsMhVuzOoLu4WPV9ZvQ6eVRpenkE4LInwDjTvagy7lU4xfDBHDcdU0ZD+LsJ2+wmMx9+W9/8YvUt03n6MVExC8F1CPfpXwFqH5+Yzq4lESp6U4KDfTLF728hPUw3IywpLMgAsM58gRa0erIFt6jrLhu4bERTbarVxu/lMfEHPdbcBIRMdQ5vUAsuFD+6NLQZE5jpQkkRKTiC/DrxA/F2nsIoS7G6VdeaXoSCkSnqS8ekpE/oO+fbGaJTWN1LLRkzsBFkh6eK3K77hUswS6huQPkKR0gkLR0ihSJLZub7hh1lA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kz5sqyIeuID17mDIs62S05GjzHHbSDSezePEiA+nz4h62Z2nXf7NX9WvWzb+3/jhrHBafTBJ3Wk6PqPEMUp10MDjCOZaQg6todMuhEl/ObxjkgzF6F+gRGo1jmEPD7pHwEPRF9R2hKVtYNIQwi7dOY7/tHN5APm6Wevt97LcPJUuWuvCACHOFRjS/RYFpT7x3E5RFkiKTPUiJJWE3iInNE53gdvZnjPST4hkDkUqYWJBUR662SJRKo3pt9Yn+Py5bRobWwmzxrHePU5uE8VA1J+EOxv7T8aTXDnGmspu3f9A7/fa1XK7Wx8izF+UDoA/FCRy5AIYEMGavG7hfh8yJXdHiQSXq7tlsHwNjEnkvpJ5Qe6Nk4xZ6wMh6tcpYtPvwGre3iMcxoaWD0fIYZrpZIVl9egWQK2VLh600WUuIpqPXLYi23As212pFzB2Ab7Qj1x5ktaQO0oY2H7ERn+wfvXB8voMavZ/rLJc54OZZuabGittpzo0gH8wihxK1OJxOFbOOYK01vpQJI8C/Bj9YQAicAFXz9+3hHehSoIoVrN8Oga07/sCULiGxyHI7HKysa6GgG6XPn+Xoi+raJe4lB884gzFmW3zenalH9NionRxc+cB/d38jFiozZWVDcErnDG31cv8wE2ZdNtdVWQTrQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nIhyUT7XMkod9HjEFHPBT+/c7BLvnR74blPwCpI84feAJT0XpxMCBPZp1o4x?=
 =?us-ascii?Q?5RPYiAffTyQi+IFG7QoE2hhh+kEo9zKXnygHxHJ94ewPNKNQ6zWf+xBZZZZr?=
 =?us-ascii?Q?O5yoCrnzg/yYqU040edTh1Y+fdlcrEzGoESOVK2MuByL4NGcmlcoYzxIMBoP?=
 =?us-ascii?Q?lAs9rcTAL/BD6sftghis7RLBly3UI+yvSLm8XrAvLj91iOBGzUO+TjTbCtaL?=
 =?us-ascii?Q?mCzi6CaZ5etDGvbOEmB5sOLezCTwdxlZ3vTPRQY4uOl9GLx6GiaVnl2DawSv?=
 =?us-ascii?Q?o5xmyrmsQuzwkYCUWZsqIBmhjCpjKcqmVNabgNMoq0LCCJ9/EfQUfbbHnGp2?=
 =?us-ascii?Q?bZwO8Fs5ZEhZZL/kJc/NSoMvf399ovHjBNoIyhRU/dL/bRnMfVX8gmPomvX9?=
 =?us-ascii?Q?3PZ7P8WniK6GSCoS9Yq3jI47EPm0RlLUt8cQ6n3i8dk2SUhPxl5Ft8Nukmtv?=
 =?us-ascii?Q?Rc9sQLuhyyJi+SpjgZRVFpkPAOTrxQHchamnef12D6SbHoBwNE0kn0540IzB?=
 =?us-ascii?Q?N7SDgqu68mylr7uWni5CcHG8Uz2IosDsb3P/sSixF6gKCfnLCeFLFpTLAvTE?=
 =?us-ascii?Q?5I/Bk6K+dSayEg3r6IrqhQpF0VH6LSy34GDufy+IjCzXeOLwL/dMTsQqDc6/?=
 =?us-ascii?Q?G9Zvuf8eFQ3mO9yKYx7TlLHwhYZauoa9xcj0hJLcgi8N/XgJVR7jA8Onw5KC?=
 =?us-ascii?Q?U5Z6/7Cr+tk9WoDlxymv2NEAaVKt04d9q4B3DArkjYcOPtbrA6CRuBEg72I+?=
 =?us-ascii?Q?jH9Ja83DwFJOk/xvhUaD9Ruwf5d42VS422Zv2YH1OWB2TyZQrc7mfff6slEA?=
 =?us-ascii?Q?Dkba5n5Ca43uA7xq+IUFMQjIOi4g9cKgQn9NdJqHo17OAU44c6pq4pqSawVL?=
 =?us-ascii?Q?ENMQGAprr9ll7AaUh0sxO8/PZglGVAaGkZeYv/bAQum8NtiPXDNPMF6nn/Wt?=
 =?us-ascii?Q?1OUBOv7wjuwJA+v5+WF5+L1e7iPzHVBQ3ybiIuk5o7fU3z1NnaE1o8xnXGjA?=
 =?us-ascii?Q?1x+XjdWzjoBF+Dm5tSCnHE8q1fS2h02OBvZH0KvAyaw3TzUDUtd9MkRTxqH5?=
 =?us-ascii?Q?CZF8l3IPAcQAXZ7mKrsKcY4b46B/J3puCvyRQT+AHQMuAGDbGlf0kfmBPeYj?=
 =?us-ascii?Q?EtYKMz/7V4xO8g640IL+mdSAyGWNrJOvrs49EqjzmdZoJpGAqXr5pcYs1/CJ?=
 =?us-ascii?Q?Lylo8+s06po3mCmRthV7wdzJ+pYXMEA4Yz2m3yMI1MrlBd2WRHFZxqLnZyg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 305cfd88-fd7c-4a05-aafa-08db42079f46
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 01:27:51.2507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1P221MB0871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNm2ttmuPprhmNt8ctPToe4QcCdpuDJzHic7b3U9WqU=;
 b=O3T3JyMgRcmk0HAt56yXnKD1lWGYAoZrUFu+Oo8+Aoz82p2qQfWFHZezVjebjCK78qYaBqm4JNiHlroU1rtSb3fnGFSRQV3tfy4AHtlUH4SHyvmskqFa+rdbdI2NVKG2S+DjRkJB9gjHXms3jd/cD/dPfaue7FhUN8GoEtCuxj64M9DN3IFcUY0dNjMeU9MG83l8kUuvwU6+lR8TMQ/Hj841Ig0cJP/jbO4r7D0P1VcfL10OcvjUvwdwFJrQcB1gNcxHmZO+5acCWoqvxokwXJqQY2D4HIzZ9vd6pBNzjumCXh6Q6gxN2pslqwe4T66J3mTVR/xhoA2HYhbYYBncGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=O3T3JyMg
Subject: [Buildroot] [PATCH] package/swaybg: new package
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provides the `swaybg` utility, which is commonly used with `swap` to
manage background images/color configuration for the compositor.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/Config.in          |  1 +
 package/swaybg/Config.in   | 13 +++++++++++++
 package/swaybg/swaybg.hash |  3 +++
 package/swaybg/swaybg.mk   | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/swaybg/Config.in
 create mode 100644 package/swaybg/swaybg.hash
 create mode 100644 package/swaybg/swaybg.mk

diff --git a/package/Config.in b/package/Config.in
index eaac32a01af363936edc8a0a8dd2450c458a38ae..d2b6422860a4da5a1d810aad26d2e10a10270275 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -329,6 +329,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
+	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
 
diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..63aa8cdb6a7f72c09644d47238d8705da19329d1
--- /dev/null
+++ b/package/swaybg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SWAYBG
+	bool "swaybg"
+	default y if BR2_PACKAGE_SWAY
+	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Wallpaper tool for Wayland compositors.
+
+	  https://github.com/swaywm/swaybg
diff --git a/package/swaybg/swaybg.hash b/package/swaybg/swaybg.hash
new file mode 100644
index 0000000000000000000000000000000000000000..62bf048d6125ebe7d6d936875bdd0083a105d60c
--- /dev/null
+++ b/package/swaybg/swaybg.hash
@@ -0,0 +1,3 @@
+# Locally computed, tarball verified with GPG signature
+sha256  c0205b34f1fad94553b6cb2c2b983cc33186018026058cad0b841a00bc3087e3  swaybg-1.2.0.tar.gz
+sha256  95224d118a325daf31828afcca98cd958d53f0a7cdd856b50b1be8ac44832faf  LICENSE
diff --git a/package/swaybg/swaybg.mk b/package/swaybg/swaybg.mk
new file mode 100644
index 0000000000000000000000000000000000000000..4cb738286fb9ec6651754c0a591f5c1cc60b705d
--- /dev/null
+++ b/package/swaybg/swaybg.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# swaybg
+#
+################################################################################
+
+SWAYBG_VERSION = 1.2.0
+SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
+SWAYBG_LICENSE = MIT
+SWAYBG_LICENSE_FILES = LICENSE
+
+SWAYBG_DEPENDENCIES = \
+	cairo \
+	wayland \
+	wayland-protocols
+
+SWAYBG_CONF_OPTS = \
+	-Dman-pages=disabled
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# swaybg does not build against uClibc, swaybg uses POSIX defines to indicate
+# support for `strdup`, which is not enough for uClibc to provide a declaration
+# of `strdup`. The implicit use of the function causes a build failure. To
+# avoid this, turn off the "warnings are errors" flag.
+SWAYBG_CONF_OPTS += -Dwerror=false
+endif
+
+ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=enabled
+SWAYBG_DEPENDENCIES += gdk-pixbuf
+else
+SWAYBG_CONF_OPTS += -Dgdk-pixbuf=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
