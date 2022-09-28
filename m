Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CFDC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C55418E1;
	Wed, 28 Sep 2022 20:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C55418E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7NrdVly6Ph7; Wed, 28 Sep 2022 20:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885664192D;
	Wed, 28 Sep 2022 20:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885664192D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 767001BF2F8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BAD660E8F
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BAD660E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYL8flMZcyuj for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 20:45:32 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ADE860E72
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADE860E72
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 20:45:31 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ddp3ovrbI4eE5ddp4oUvg2; Wed, 28 Sep 2022 22:38:26 +0200
Message-ID: <0629c989-415c-2022-9dc6-8d4667d2861f@benettiengineering.com>
Date: Wed, 28 Sep 2022 22:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: buildroot@buildroot.org
References: <20220921205815.1082192-1-giulio.benetti@benettiengineering.com>
 <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJOPdxSd+2DfELdve/yr+yYlNbAx3mCfJcO9Hvxr4cw93MDXzQEQJnYyRGKcTcJYxo7+hS3KjJVOM4oucsIizvb7EuKhV51RSjQaGha7AdlXf0oV4BeF
 elcwFHhtrgJtoBj5P22fonEU6SuOZsMxmzoAuOM2gY/Bh2hHVvRiTIqqMBGdlv0CnBU3ZiL4/ouQ8Lg1N5W96B4C8WXSK9syy1Z+OdY2oWyWjpjwgrpdl2ti
 u5tV8EoZcs0ygudiPHvVmw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664397506; bh=BAesw5FJ2D1O1qHkUwTyID0xiAY3lfvbzqm0qNh3NRQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gdKhJdNl3CphzWT2cuxBwhEdHzIMntYicBF2n0EMgPukfmuGYbTeL/GLCHLMqCVrE
 5AvUf0E+6A2as7qTnTA9Js7yGZWDqJBciY0ZBREoNoxxTDLU28VLj+VcTHq2DU8VxX
 JtsDbmk2XGDmDyC9kobygbKJ05KgmXMw/ODvVWqkTMEhOqLxlz4i3b6XH8g/+cFfPR
 bf4DK+ggm4CmhodMiBfetp86CP2XDtz3fRSr/JjnkhzO07hiRYwIp7mvFqpK6HONZA
 FP8XBNwG0Q7TnR4QAaAkWM6c7y6GupSNsuRzXb4biFduDlZa3QU+D6SheJf24Eofac
 0s+Vpwna6E2cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gdKhJdNl
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8821au: move upstream and
 fix missing linux options
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Forgotten to add,

On 21/09/22 22:58, Giulio Benetti wrote:
> This package builds to fail with Linux > 5.15 and abperiasamy's
> rtl8812AU_8821AU_linux repository is not maintained since 2 years and
> there is not a fork where all pending patches have been upstreamed, so
> let's switch to lwfinger's rtl8812au repository that is well maintained
> with Linux up to version 5.18 supported. While switching let's drop all
> local patches. Also add me as maintainer for this package in DEVELOPERS
> file.

Fixes:
http://autobuild.buildroot.net/results/a3db3a6540b67a1f1fe31d61fe1d6824d43f59f0/

Can you please add it to commit log while committing?

Thank you
Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS                                    |   1 +
>   ...-fallthrough-comments-for-kernel-5.3.patch |  29 --
>   ...river-crashes-from-aircrack-ng-rtl88.patch | 169 ---------
>   ...f-for-extending-string-which-causes-.patch | 339 ------------------
>   ...ate-to-rtl_sha256_state-to-avoid-nam.patch |  79 ----
>   ..._mgmt_frame_register-on-kernel-5.8.0.patch |  47 ---
>   ...-file_operations-to-proc_ops-for-5.6.patch | 110 ------
>   package/rtl8821au/rtl8821au.hash              |   2 +-
>   package/rtl8821au/rtl8821au.mk                |  12 +-
>   9 files changed, 12 insertions(+), 776 deletions(-)
>   delete mode 100644 package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
>   delete mode 100644 package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
>   delete mode 100644 package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
>   delete mode 100644 package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
>   delete mode 100644 package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
>   delete mode 100644 package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3de63ea72f..0d67e8a643 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1154,6 +1154,7 @@ F:	package/rtl8189es/
>   F:	package/rtl8723bu/
>   F:	package/rtl8723ds/
>   F:	package/rtl8812au-aircrack-ng/
> +F:	package/rtl8821au/
>   F:	package/sunxi-mali-utgard/
>   F:	package/sunxi-mali-utgard-driver/
>   F:	package/sunxi-tools/
> diff --git a/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch b/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
> deleted file mode 100644
> index 00e801b6b1..0000000000
> --- a/package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 99f1e8bd7172ddf9613db3531a8b37921ed73351 Mon Sep 17 00:00:00 2001
> -From: Jesper Skov <jb1811@jyskebank.dk>
> -Date: Fri, 25 Oct 2019 10:05:41 +0200
> -Subject: [PATCH] Fix implicit fallthrough comments for kernel 5.3
> -
> -[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/e8a30a4c5a80efbbd5b1dbfe11b22916df4492f9.patch]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - core/rtw_mlme_ext.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/core/rtw_mlme_ext.c b/core/rtw_mlme_ext.c
> -index 24565ea..380f507 100644
> ---- a/core/rtw_mlme_ext.c
> -+++ b/core/rtw_mlme_ext.c
> -@@ -758,7 +758,9 @@ void mgt_dispatcher(_adapter *padapter, union recv_frame *precv_frame)
> - 		else
> - 			ptable->func = &OnAuthClient;
> - 	//pass through
> -+	//fallthrough
> - 	case WIFI_ASSOCREQ:
> -+	//fallthrough
> - 	case WIFI_REASSOCREQ:
> - 		_mgt_dispatcher(padapter, ptable, precv_frame);
> - #ifdef CONFIG_HOSTAPD_MLME
> ---
> -2.28.0
> -
> diff --git a/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch b/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
> deleted file mode 100644
> index 213ea806b0..0000000000
> --- a/package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -From cde2dbf6e94e00fcf198422b03de01d3090675d9 Mon Sep 17 00:00:00 2001
> -From: Jesper Skov <jb1811@jyskebank.dk>
> -Date: Fri, 25 Oct 2019 10:10:29 +0200
> -Subject: [PATCH] Fix kernel 5.3 driver crashes, from aircrack-ng/rtl8812au#421
> -
> -[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/822b485d36d6f72304a219c3be228f40968b542b.patch]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - os_dep/linux/rtw_cfgvendor.c | 45 ++++++++++++++++++++++++++++++++++++
> - 1 file changed, 45 insertions(+)
> -
> -diff --git a/os_dep/linux/rtw_cfgvendor.c b/os_dep/linux/rtw_cfgvendor.c
> -index e7ba90a..81fc8af 100644
> ---- a/os_dep/linux/rtw_cfgvendor.c
> -+++ b/os_dep/linux/rtw_cfgvendor.c
> -@@ -1173,6 +1173,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = BRCM_VENDOR_SCMD_PRIV_STR
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_priv_string_handler
> - 	},
> - #if defined(GSCAN_SUPPORT) && 0
> -@@ -1182,6 +1185,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_GET_CAPABILITIES
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_gscan_get_capabilities
> - 	},
> - 	{
> -@@ -1190,6 +1196,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_SET_CONFIG
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_set_scan_cfg
> - 	},
> - 	{
> -@@ -1198,6 +1207,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_SET_SCAN_CONFIG
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_set_batch_scan_cfg
> - 	},
> - 	{
> -@@ -1206,6 +1218,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_ENABLE_GSCAN
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_initiate_gscan
> - 	},
> - 	{
> -@@ -1214,6 +1229,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_ENABLE_FULL_SCAN_RESULTS
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_enable_full_scan_result
> - 	},
> - 	{
> -@@ -1222,6 +1240,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_SET_HOTLIST
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_hotlist_cfg
> - 	},
> - 	{
> -@@ -1230,6 +1251,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_SET_SIGNIFICANT_CHANGE_CONFIG
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_significant_change_cfg
> - 	},
> - 	{
> -@@ -1238,6 +1262,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_GET_SCAN_RESULTS
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_gscan_get_batch_results
> - 	},
> - 	{
> -@@ -1246,6 +1273,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = GSCAN_SUBCMD_GET_CHANNEL_LIST
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_gscan_get_channel_list
> - 	},
> - #endif /* GSCAN_SUPPORT */
> -@@ -1256,6 +1286,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = RTT_SUBCMD_SET_CONFIG
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_rtt_set_config
> - 	},
> - 	{
> -@@ -1264,6 +1297,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = RTT_SUBCMD_CANCEL_CONFIG
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_rtt_cancel_config
> - 	},
> - 	{
> -@@ -1272,6 +1308,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = RTT_SUBCMD_GETCAPABILITY
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = wl_cfgvendor_rtt_get_capability
> - 	},
> - #endif /* RTT_SUPPORT */
> -@@ -1281,6 +1320,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = ANDR_WIFI_SUBCMD_GET_FEATURE_SET
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = rtw_cfgvendor_get_feature_set
> - 	},
> - 	{
> -@@ -1289,6 +1331,9 @@ static const struct wiphy_vendor_command rtw_vendor_cmds [] = {
> - 			.subcmd = ANDR_WIFI_SUBCMD_GET_FEATURE_SET_MATRIX
> - 		},
> - 		.flags = WIPHY_VENDOR_CMD_NEED_WDEV | WIPHY_VENDOR_CMD_NEED_NETDEV,
> -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,3,0)
> -+		.policy = VENDOR_CMD_RAW_DATA,
> -+#endif
> - 		.doit = rtw_cfgvendor_get_feature_set_matrix
> - 	}
> - };
> ---
> -2.28.0
> -
> diff --git a/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch b/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> deleted file mode 100644
> index 2c4b595c37..0000000000
> --- a/package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
> +++ /dev/null
> @@ -1,339 +0,0 @@
> -From 5b6641978e8fa68bca05d224a61f8513b010eda8 Mon Sep 17 00:00:00 2001
> -From: Coleman <omegacoleman@gmail.com>
> -Date: Fri, 17 Jul 2020 08:53:00 +0800
> -Subject: [PATCH] Fix using sprintf for extending string, which causes
> - undefined behavior
> -
> -[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/be57045a0933d64e958878696883e9cf998e1bf3.patch]
> -Signed-off-by: Coleman <omegacoleman@gmail.com>
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - core/rtw_mp.c              |   2 +-
> - os_dep/linux/ioctl_linux.c | 108 ++++++++++++++++++-------------------
> - 2 files changed, 55 insertions(+), 55 deletions(-)
> -
> -diff --git a/core/rtw_mp.c b/core/rtw_mp.c
> -index c2e400d..989bb3e 100644
> ---- a/core/rtw_mp.c
> -+++ b/core/rtw_mp.c
> -@@ -1871,7 +1871,7 @@ u32 mp_query_psd(PADAPTER pAdapter, u8 *data)
> - 		} else {
> - 			psd_data = rtw_GetPSDData(pAdapter, i);
> - 		}
> --		sprintf(data, "%s%x ", data, psd_data);
> -+		sprintf(data + strlen(data), "%x ", psd_data);
> - 		i++;
> - 	}
> -
> -diff --git a/os_dep/linux/ioctl_linux.c b/os_dep/linux/ioctl_linux.c
> -index c74a153..9543fa3 100644
> ---- a/os_dep/linux/ioctl_linux.c
> -+++ b/os_dep/linux/ioctl_linux.c
> -@@ -9080,19 +9080,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i = 0; i < EFUSE_MAP_SIZE; i += 16) {
> - //			DBG_871X("0x%02x\t", i);
> --			sprintf(extra, "%s0x%02x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%02x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, PROMContent[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", PROMContent[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra, "%s\t", extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, PROMContent[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", PROMContent[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra,"%s\n",extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0], "realmap") == 0) {
> -@@ -9107,19 +9107,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i = 0; i < EFUSE_MAP_SIZE; i += 16) {
> - //			DBG_871X("0x%02x\t", i);
> --			sprintf(extra, "%s0x%02x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%02x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra, "%s\t", extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra,"%s\n",extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0], "rmap") == 0) {
> -@@ -9158,7 +9158,7 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		*extra = 0;
> - 		for (i=0; i<cnts; i++) {
> - //			DBG_871X("0x%02x ", data[i]);
> --			sprintf(extra, "%s0x%02X ", extra, data[i]);
> -+			sprintf(extra + strlen(extra), "0x%02X ", data[i]);
> - 		}
> - //		DBG_871X("}\n");
> - 	} else if (strcmp(tmp[0], "realraw") == 0) {
> -@@ -9174,17 +9174,17 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n0x00\t");
> - 		for (i=0; i< mapLen; i++) {
> - 			//			DBG_871X("%02X", rawdata[i]);
> --			sprintf(extra, "%s%02X", extra, rawdata[i]);
> -+			sprintf(extra + strlen(extra), "%02X", rawdata[i]);
> - 			if ((i & 0xF) == 0xF) {
> - 				//				DBG_871X("\n");
> --				sprintf(extra, "%s\n", extra);
> --				sprintf(extra, "%s0x%02x\t", extra, i+1);
> -+				sprintf(extra + strlen(extra), "\n");
> -+				sprintf(extra + strlen(extra), "0x%02x\t", i+1);
> - 			} else if ((i & 0x7) == 0x7) {
> - 				//				DBG_871X("\t");
> --				sprintf(extra, "%s \t", extra);
> -+				sprintf(extra + strlen(extra), " \t");
> - 			} else {
> - 				//				DBG_871X(" ");
> --				sprintf(extra, "%s ", extra);
> -+				sprintf(extra + strlen(extra), " ");
> - 			}
> - 		}
> - 		//		DBG_871X("}\n");
> -@@ -9269,10 +9269,10 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		*extra = 0;
> - 		for (i=0; i<cnts; i++) {
> - //			DBG_871X("%02X", data[i]);
> --			sprintf(extra, "%s%02X", extra, data[i]);
> -+			sprintf(extra + strlen(extra), "%02X", data[i]);
> - 			if (i != (cnts-1)) {
> - //				DBG_871X(":");
> --				sprintf(extra,"%s:",extra);
> -+				sprintf(extra + strlen(extra), ":");
> - 			}
> - 		}
> - //		DBG_871X("}\n");
> -@@ -9330,10 +9330,10 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		*extra = 0;
> - 		for (i=0; i<cnts; i++) {
> - //			DBG_871X("0x%02x", data[i]);
> --			sprintf(extra, "%s0x%02X", extra, data[i]);
> -+			sprintf(extra + strlen(extra), "0x%02X", data[i]);
> - 			if (i != (cnts-1)) {
> - //				DBG_871X(",");
> --				sprintf(extra,"%s,",extra);
> -+				sprintf(extra + strlen(extra), ",");
> - 			}
> - 		}
> - //		DBG_871X("}\n");
> -@@ -9355,19 +9355,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i=0; i<512; i+=16) { // set 512 because the iwpriv's extra size have limit 0x7FF
> - //			DBG_871X("0x%03x\t", i);
> --			sprintf(extra, "%s0x%03x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%03x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->BTEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra,"%s\t",extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->BTEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra, "%s\n", extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0],"btbmap") == 0) {
> -@@ -9384,19 +9384,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i=512; i<1024 ; i+=16) {
> - //			DBG_871X("0x%03x\t", i);
> --			sprintf(extra, "%s0x%03x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%03x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->BTEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra,"%s\t",extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", data[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->BTEfuseInitMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->BTEfuseInitMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra, "%s\n", extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0],"btrmap") == 0) {
> -@@ -9436,7 +9436,7 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - //		DBG_871X("%s: bt efuse data={", __FUNCTION__);
> - 		for (i=0; i<cnts; i++) {
> - //			DBG_871X("0x%02x ", data[i]);
> --			sprintf(extra, "%s 0x%02X ", extra, data[i]);
> -+			sprintf(extra + strlen(extra), " 0x%02X ", data[i]);
> - 		}
> - //		DBG_871X("}\n");
> - 		DBG_871X(FUNC_ADPT_FMT ": BT MAC=[%s]\n", FUNC_ADPT_ARG(padapter), extra);
> -@@ -9445,19 +9445,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i=0; i<512; i+=16) {
> - //			DBG_871X("0x%03x\t", i);
> --			sprintf(extra, "%s0x%03x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%03x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra, "%s\t", extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra, "%s\n", extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0],"btbfake") == 0) {
> -@@ -9465,19 +9465,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i=512; i<1024; i+=16) {
> - //			DBG_871X("0x%03x\t", i);
> --			sprintf(extra, "%s0x%03x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%03x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra, "%s\t", extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeBTEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra, "%s\n", extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> - 	} else if (strcmp(tmp[0],"wlrfkmap")== 0) {
> -@@ -9485,19 +9485,19 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		sprintf(extra, "\n");
> - 		for (i=0; i<EFUSE_MAP_SIZE; i+=16) {
> - //			DBG_871X("\t0x%02x\t", i);
> --			sprintf(extra, "%s0x%02x\t", extra, i);
> -+			sprintf(extra + strlen(extra), "0x%02x\t", i);
> - 			for (j=0; j<8; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s%02X ", extra, pEfuseHal->fakeEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), "%02X ", pEfuseHal->fakeEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\t");
> --			sprintf(extra, "%s\t", extra);
> -+			sprintf(extra + strlen(extra), "\t");
> - 			for (; j<16; j++) {
> - //				DBG_871X("%02X ", pEfuseHal->fakeEfuseModifiedMap[i+j]);
> --				sprintf(extra, "%s %02X", extra, pEfuseHal->fakeEfuseModifiedMap[i+j]);
> -+				sprintf(extra + strlen(extra), " %02X", pEfuseHal->fakeEfuseModifiedMap[i+j]);
> - 			}
> - //			DBG_871X("\n");
> --			sprintf(extra, "%s\n", extra);
> -+			sprintf(extra + strlen(extra), "\n");
> - 		}
> - //		DBG_871X("\n");
> -
> -@@ -9523,7 +9523,7 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		*extra = 0;
> - 		for (i=0; i<cnts; i++) {
> - 			DBG_871X("wlrfkrmap = 0x%02x \n", pEfuseHal->fakeEfuseModifiedMap[addr+i]);
> --			sprintf(extra, "%s0x%02X ", extra, pEfuseHal->fakeEfuseModifiedMap[addr+i]);
> -+			sprintf(extra + strlen(extra), "0x%02X ", pEfuseHal->fakeEfuseModifiedMap[addr+i]);
> - 		}
> - 	} else if (strcmp(tmp[0],"btrfkrmap")== 0) {
> - 		if ((tmp[1]==NULL) || (tmp[2]==NULL)) {
> -@@ -9547,7 +9547,7 @@ static int rtw_mp_efuse_get(struct net_device *dev,
> - 		*extra = 0;
> - 		for (i=0; i<cnts; i++) {
> - 			DBG_871X("wlrfkrmap = 0x%02x \n", pEfuseHal->fakeBTEfuseModifiedMap[addr+i]);
> --			sprintf(extra, "%s0x%02X ", extra, pEfuseHal->fakeBTEfuseModifiedMap[addr+i]);
> -+			sprintf(extra + strlen(extra), "0x%02X ", pEfuseHal->fakeBTEfuseModifiedMap[addr+i]);
> - 		}
> - 	} else {
> - 		sprintf(extra, "Command not found!");
> -@@ -10409,7 +10409,7 @@ static int rtw_mp_read_reg(struct net_device *dev,
> - 			pnext++;
> - 			if ( *pnext != '\0' ) {
> - 				strtout = simple_strtoul (pnext , &ptmp, 16);
> --				sprintf( extra, "%s %d" ,extra ,strtout );
> -+				sprintf(extra + strlen(extra), " %d"  ,strtout );
> - 			} else {
> - 				break;
> - 			}
> -@@ -10443,7 +10443,7 @@ static int rtw_mp_read_reg(struct net_device *dev,
> - 			pnext++;
> - 			if ( *pnext != '\0' ) {
> - 				strtout = simple_strtoul (pnext , &ptmp, 16);
> --				sprintf( extra, "%s %d" ,extra ,strtout );
> -+				sprintf(extra + strlen(extra), " %d"  ,strtout );
> - 			} else {
> - 				break;
> - 			}
> -@@ -10566,7 +10566,7 @@ static int rtw_mp_read_rf(struct net_device *dev,
> - 		pnext++;
> - 		if ( *pnext != '\0' ) {
> - 			strtou = simple_strtoul (pnext , &ptmp, 16);
> --			sprintf( extra, "%s %d" ,extra ,strtou );
> -+			sprintf(extra + strlen(extra), " %d"  ,strtou );
> - 		} else {
> - 			break;
> - 		}
> -@@ -12155,14 +12155,14 @@ todo:
> - 				goto exit;
> -
> - #ifdef CONFIG_RTL8723A
> --			sprintf(extra, "%s %d ", extra, (pMptCtx->mptOutBuf[i]& 0x3f));
> -+			sprintf(extra + strlen(extra), " %d ", (pMptCtx->mptOutBuf[i]& 0x3f));
> - #else
> --			sprintf(extra, "%s %d ", extra, (pMptCtx->mptOutBuf[i]& 0x1f));
> -+			sprintf(extra + strlen(extra), " %d ", (pMptCtx->mptOutBuf[i]& 0x1f));
> - #endif
> - 		}
> - 	} else {
> - 		for (i=4; i<pMptCtx->mptOutLen; i++) {
> --			sprintf(extra, "%s 0x%x ", extra, pMptCtx->mptOutBuf[i]);
> -+			sprintf(extra + strlen(extra), " 0x%x ", pMptCtx->mptOutBuf[i]);
> - 		}
> - 	}
> -
> ---
> -2.28.0
> -
> diff --git a/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch b/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
> deleted file mode 100644
> index 41cee2b247..0000000000
> --- a/package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 19aee91e45788d594615a9be58fa5d0879ec816a Mon Sep 17 00:00:00 2001
> -From: youcai <omegacoleman@gmail.com>
> -Date: Tue, 18 Aug 2020 00:43:16 +0800
> -Subject: [PATCH] rename sha256_state to rtl_sha256_state to avoid name
> - conflict with crypto
> -
> -[Upstream: https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/338/commits/af6f6c1578f16145478326a939bb7593bbcdb4e7.patch]
> -Signed-off-by: Coleman <omegacoleman@gmail.com>
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - core/rtw_security.c    | 10 +++++-----
> - include/rtw_security.h |  2 +-
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/core/rtw_security.c b/core/rtw_security.c
> -index d54e6af..de2d91f 100644
> ---- a/core/rtw_security.c
> -+++ b/core/rtw_security.c
> -@@ -2200,7 +2200,7 @@ BIP_exit:
> -
> - #ifndef PLATFORM_FREEBSD
> - /* compress 512-bits */
> --static int sha256_compress(struct sha256_state *md, unsigned char *buf)
> -+static int sha256_compress(struct rtl_sha256_state *md, unsigned char *buf)
> - {
> - 	u32 S[8], W[64], t0, t1;
> - 	u32 t;
> -@@ -2249,7 +2249,7 @@ static int sha256_compress(struct sha256_state *md, unsigned char *buf)
> - }
> -
> - /* Initialize the hash state */
> --static void sha256_init(struct sha256_state *md)
> -+static void sha256_init(struct rtl_sha256_state *md)
> - {
> - 	md->curlen = 0;
> - 	md->length = 0;
> -@@ -2270,7 +2270,7 @@ static void sha256_init(struct sha256_state *md)
> -    @param inlen  The length of the data (octets)
> -    @return CRYPT_OK if successful
> - */
> --static int sha256_process(struct sha256_state *md, unsigned char *in,
> -+static int sha256_process(struct rtl_sha256_state *md, unsigned char *in,
> -                           unsigned long inlen)
> - {
> - 	unsigned long n;
> -@@ -2311,7 +2311,7 @@ static int sha256_process(struct sha256_state *md, unsigned char *in,
> -    @param out [out] The destination of the hash (32 bytes)
> -    @return CRYPT_OK if successful
> - */
> --static int sha256_done(struct sha256_state *md, unsigned char *out)
> -+static int sha256_done(struct rtl_sha256_state *md, unsigned char *out)
> - {
> - 	int i;
> -
> -@@ -2363,7 +2363,7 @@ static int sha256_done(struct sha256_state *md, unsigned char *out)
> - static int sha256_vector(size_t num_elem, u8 *addr[], size_t *len,
> -                          u8 *mac)
> - {
> --	struct sha256_state ctx;
> -+	struct rtl_sha256_state ctx;
> - 	size_t i;
> -
> - 	sha256_init(&ctx);
> -diff --git a/include/rtw_security.h b/include/rtw_security.h
> -index d41014e..98feb69 100644
> ---- a/include/rtw_security.h
> -+++ b/include/rtw_security.h
> -@@ -233,7 +233,7 @@ struct security_priv {
> - #endif /* DBG_SW_SEC_CNT */
> - };
> -
> --struct sha256_state {
> -+struct rtl_sha256_state {
> - 	u64 length;
> - 	u32 state[8], curlen;
> - 	u8 buf[64];
> ---
> -2.28.0
> -
> diff --git a/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch b/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
> deleted file mode 100644
> index 6d09153b82..0000000000
> --- a/package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 9421b0763e5f20babb2c0fd437979a71fbac1739 Mon Sep 17 00:00:00 2001
> -From: Christian Stewart <christian@paral.in>
> -Date: Tue, 8 Sep 2020 22:46:45 -0700
> -Subject: [PATCH] disable rtw_mgmt_frame_register on kernel 5.8.0
> -
> -rtl8812au: fix build for kernel 5.8
> -
> -[Source: https://github.com/lwfinger/rtl8812au/commit/ec1591b90dd323185717fa42887f96444cca5921.patch]
> -Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - os_dep/linux/ioctl_cfg80211.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
> -index 019daf9..13238cb 100644
> ---- a/os_dep/linux/ioctl_cfg80211.c
> -+++ b/os_dep/linux/ioctl_cfg80211.c
> -@@ -5177,6 +5177,7 @@ exit:
> - 	return ret;
> - }
> -
> -+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
> - static void cfg80211_rtw_mgmt_frame_register(struct wiphy *wiphy,
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 6, 0))
> -         struct wireless_dev *wdev,
> -@@ -5205,6 +5206,7 @@ static void cfg80211_rtw_mgmt_frame_register(struct wiphy *wiphy,
> - exit:
> - 	return;
> - }
> -+#endif
> -
> - #if defined(CONFIG_TDLS) && (LINUX_VERSION_CODE >= KERNEL_VERSION(3,2,0))
> - static int cfg80211_rtw_tdls_mgmt(struct wiphy *wiphy,
> -@@ -6021,7 +6023,9 @@ static struct cfg80211_ops rtw_cfg80211_ops = {
> -
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> - 	.mgmt_tx = cfg80211_rtw_mgmt_tx,
> -+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
> - 	.mgmt_frame_register = cfg80211_rtw_mgmt_frame_register,
> -+#endif
> - #elif  (LINUX_VERSION_CODE>=KERNEL_VERSION(2,6,34) && LINUX_VERSION_CODE<=KERNEL_VERSION(2,6,35))
> - 	.action = cfg80211_rtw_mgmt_tx,
> - #endif
> ---
> -2.28.0
> -
> diff --git a/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch b/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
> deleted file mode 100644
> index 30595ec695..0000000000
> --- a/package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From e0ed05200e6e4b86e26e092dc1f16fc8fc1e2b67 Mon Sep 17 00:00:00 2001
> -From: Christian Stewart <christian@paral.in>
> -Date: Tue, 8 Sep 2020 23:08:39 -0700
> -Subject: [PATCH] rtw_proc: convert file_operations to proc_ops for 5.6.x
> - compat
> -
> -Signed-off-by: Christian Stewart <christian@paral.in>
> -[Fix < 5.6.x compile - missing semicolon]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - os_dep/linux/rtw_proc.c | 40 ++++++++++++++++++++++++++++++++++++++--
> - 1 file changed, 38 insertions(+), 2 deletions(-)
> -
> -diff --git a/os_dep/linux/rtw_proc.c b/os_dep/linux/rtw_proc.c
> -index 048080a..6295f66 100644
> ---- a/os_dep/linux/rtw_proc.c
> -+++ b/os_dep/linux/rtw_proc.c
> -@@ -65,9 +65,15 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
> - }
> -
> - inline struct proc_dir_entry *rtw_proc_create_entry(const char *name, struct proc_dir_entry *parent,
> --        const struct file_operations *fops, void * data)
> -+	#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
> -+	const struct file_operations *fops,
> -+	#else
> -+	const struct proc_ops *fops,
> -+	#endif
> -+	void * data
> -+	)
> - {
> --	struct proc_dir_entry *entry;
> -+        struct proc_dir_entry *entry;
> -
> - #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
> - 	entry = proc_create_data(name,  S_IFREG|S_IRUGO|S_IWUGO, parent, fops, data);
> -@@ -167,6 +173,7 @@ static ssize_t rtw_drv_proc_write(struct file *file, const char __user *buffer,
> - 	return -EROFS;
> - }
> -
> -+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
> - static const struct file_operations rtw_drv_proc_fops = {
> - 	.owner = THIS_MODULE,
> - 	.open = rtw_drv_proc_open,
> -@@ -175,6 +182,15 @@ static const struct file_operations rtw_drv_proc_fops = {
> - 	.release = single_release,
> - 	.write = rtw_drv_proc_write,
> - };
> -+#else
> -+static const struct proc_ops rtw_drv_proc_fops = {
> -+	.proc_open = rtw_drv_proc_open,
> -+	.proc_read = seq_read,
> -+	.proc_lseek = seq_lseek,
> -+	.proc_release = seq_release,
> -+	.proc_write = rtw_drv_proc_write,
> -+};
> -+#endif
> -
> - int rtw_drv_proc_init(void)
> - {
> -@@ -776,6 +792,7 @@ static ssize_t rtw_adapter_proc_write(struct file *file, const char __user *buff
> - 	return -EROFS;
> - }
> -
> -+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
> - static const struct file_operations rtw_adapter_proc_fops = {
> - 	.owner = THIS_MODULE,
> - 	.open = rtw_adapter_proc_open,
> -@@ -784,6 +801,15 @@ static const struct file_operations rtw_adapter_proc_fops = {
> - 	.release = single_release,
> - 	.write = rtw_adapter_proc_write,
> - };
> -+#else
> -+static const struct proc_ops rtw_adapter_proc_fops = {
> -+	.proc_open = rtw_adapter_proc_open,
> -+	.proc_read = seq_read,
> -+	.proc_lseek = seq_lseek,
> -+	.proc_release = single_release,
> -+	.proc_write = rtw_adapter_proc_write,
> -+};
> -+#endif
> -
> - int proc_get_odm_dbg_comp(struct seq_file *m, void *v)
> - {
> -@@ -1030,6 +1056,7 @@ static ssize_t rtw_odm_proc_write(struct file *file, const char __user *buffer,
> - 	return -EROFS;
> - }
> -
> -+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0))
> - static const struct file_operations rtw_odm_proc_fops = {
> - 	.owner = THIS_MODULE,
> - 	.open = rtw_odm_proc_open,
> -@@ -1038,6 +1065,15 @@ static const struct file_operations rtw_odm_proc_fops = {
> - 	.release = single_release,
> - 	.write = rtw_odm_proc_write,
> - };
> -+#else
> -+static const struct proc_ops rtw_odm_proc_fops = {
> -+	.proc_open = rtw_odm_proc_open,
> -+	.proc_read = seq_read,
> -+	.proc_lseek = seq_lseek,
> -+	.proc_release = single_release,
> -+	.proc_write = rtw_odm_proc_write,
> -+};
> -+#endif
> -
> - struct proc_dir_entry *rtw_odm_proc_init(struct net_device *dev)
> - {
> ---
> -2.29.0
> -
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index de84332f72..996a6c4c7a 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  9c8e127dcf2b4d87df546f7f51afdbca0a0561cdba9bcc2689722e1090c46204  rtl8821au-4235b0ec7d7220a6364586d8e25b1e8cb99c36f1.tar.gz
> +sha256  302f37098c3ae018eebf8ca80bcd2ec8ffc46755daed811278321d0914758f41  rtl8821au-e0b443940471c166a5cc6280d3608f95228e017f.tar.gz
>   sha256  6d66dec8f6c253a1af2ffd858167c722b1ce3218215446172c81355d0a49e7fc  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 5f4ba3eb76..65c0bc913d 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,11 +4,19 @@
>   #
>   ################################################################################
>   
> -RTL8821AU_VERSION = 4235b0ec7d7220a6364586d8e25b1e8cb99c36f1
> -RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
> +RTL8821AU_VERSION = e0b443940471c166a5cc6280d3608f95228e017f
> +RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
>   RTL8821AU_LICENSE = GPL-2.0
>   RTL8821AU_LICENSE_FILES = LICENSE
>   
> +define RTL8821AU_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
> +endef
> +
>   RTL8821AU_MODULE_MAKE_OPTS = \
>   	CONFIG_RTL8812AU_8821AU=m \
>   	KVER=$(LINUX_VERSION_PROBED) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

