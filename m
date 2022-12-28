Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E0FC4167B
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F242B81584;
	Wed, 28 Dec 2022 18:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F242B81584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kYGruMOPNcP; Wed, 28 Dec 2022 18:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4E181570;
	Wed, 28 Dec 2022 18:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4E181570
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEA301BF40A
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D383A81570
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D383A81570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4-uxXal12oH for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:08:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9313F8151E
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9313F8151E
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:08:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AarApQebuU5qIAarApeLhP; Wed, 28 Dec 2022 19:08:48 +0100
Message-ID: <d023f401-5c01-8b66-2327-72b3d4cf4c1f@benettiengineering.com>
Date: Wed, 28 Dec 2022 19:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221228171745.3383403-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221228171745.3383403-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfM22j90/SFT2kZ8P5+ln7AWdSfsU29irOkvtD5w5MPQrnP9rLIf+UVg2zQNDIKDTWzyd1HICb+SBhcN1sBmGkGomcJRjmk2ifMnRD1f8drMcI7S+lcB/
 47i0GkFGAfWHZs/wXZAxwNhFCleworUM4aDk1wYN+4uDVfw9QfRnFPjuahP/RqT1fytiwr8F8Kz3AQ5eB+psLvxK7U/Ly1y3kaF0LAQuRM3Dnh3MsTSh6dHy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672250928; bh=u1v/l4EtB8AqMJYuoMBGhvI/qwm3gSPQHics1YMOhio=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=grCPiyCC7TK+pRy527qpS3QVztV4HpDaVLa4hf/sYS+fgnJdBj2G+Qc+V1lfVkHQS
 dbeJ3tIPcWMMHVlUtKZVLbnNCAnoX2fl0TNbeKunaYbckWluGKT5/tbikJuxWN97CB
 8IQLWbGZ1W07RsSrZQoUkPR0U5fjuw/2tp6sSMgCHuu5w4bm+zgxBHEUrkAyXb+Lb8
 EuXvuXnZkRQrAVC4pR3SRAdmvQsLoxzonjY3ErgxQFftDwrMv2uN/r9wkZIPOTZ+kV
 McWQaVni6ILQ01yWrPpicrCV7ITtLJoidmWtiBWu6oegyvgkKFCKH+9zlCX6TKGMPc
 K1qqS8J1rBW8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=grCPiyCC
Subject: Re: [Buildroot] [PATCH] package/rtl8723b: fix build faillure with
 Linux 6.1
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

These local patches have already been merged, so please drop this patch.
Sorry for the noise.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 28/12/22 18:17, Giulio Benetti wrote:
> Add 2 local patches pending upstream[1] to fix build failure with Linux 6.1
> 
> [1]: https://github.com/lwfinger/rtl8723bu/pull/194
> 
> Fixes:
> http://autobuild.buildroot.net/results/cc84b5f62ca59572f0f52086f157acc0409c03f5/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...vice.c-fix-missing-prandom_u32-with-.patch | 34 +++++++++
>   ...80211.c-fix-build-failure-on-Linux-6.patch | 74 +++++++++++++++++++
>   2 files changed, 108 insertions(+)
>   create mode 100644 package/rtl8723bu/0002-os_dep-osdep_service.c-fix-missing-prandom_u32-with-.patch
>   create mode 100644 package/rtl8723bu/0003-os_dep-ioctl_cfg80211.c-fix-build-failure-on-Linux-6.patch
> 
> diff --git a/package/rtl8723bu/0002-os_dep-osdep_service.c-fix-missing-prandom_u32-with-.patch b/package/rtl8723bu/0002-os_dep-osdep_service.c-fix-missing-prandom_u32-with-.patch
> new file mode 100644
> index 0000000000..6198500f02
> --- /dev/null
> +++ b/package/rtl8723bu/0002-os_dep-osdep_service.c-fix-missing-prandom_u32-with-.patch
> @@ -0,0 +1,34 @@
> +From 509f24ce9fb24a9647b4295c9e9eb35efa8baa23 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 28 Dec 2022 17:49:29 +0100
> +Subject: [PATCH] os_dep/osdep_service.c: fix missing prandom_u32() with Linux
> + >= 6.1.0
> +
> +prandom_u32() previously was only calling get_random_u32() so it's been
> +dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
> +version >= 6.1.0.
> +
> +[Upstream status: https://github.com/lwfinger/rtl8723bu/pull/194]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + os_dep/osdep_service.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/os_dep/osdep_service.c b/os_dep/osdep_service.c
> +index 545d00d..87266e0 100644
> +--- a/os_dep/osdep_service.c
> ++++ b/os_dep/osdep_service.c
> +@@ -1016,7 +1016,9 @@ u64 rtw_division64(u64 x, u64 y)
> +
> + inline u32 rtw_random32(void)
> + {
> +-	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,8,0))
> ++	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0))
> ++	return get_random_u32();
> ++	#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3,8,0))
> + 	return prandom_u32();
> + 	#elif (LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,18))
> + 	u32 random_int;
> +--
> +2.34.1
> +
> diff --git a/package/rtl8723bu/0003-os_dep-ioctl_cfg80211.c-fix-build-failure-on-Linux-6.patch b/package/rtl8723bu/0003-os_dep-ioctl_cfg80211.c-fix-build-failure-on-Linux-6.patch
> new file mode 100644
> index 0000000000..7926d305b3
> --- /dev/null
> +++ b/package/rtl8723bu/0003-os_dep-ioctl_cfg80211.c-fix-build-failure-on-Linux-6.patch
> @@ -0,0 +1,74 @@
> +From 5b7ddfe0eab3a29847a8eb5e9563ef6059d744a5 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 28 Dec 2022 18:05:34 +0100
> +Subject: [PATCH] os_dep/ioctl_cfg80211.c: fix build failure on Linux >= 6.1
> + because of cfg80211 api change
> +
> +Starting from Linux 6.1 some 80211 api requires 'int link_id' argument, so
> +let's add it according to Linux version used.
> +
> +[Upstream status: https://github.com/lwfinger/rtl8723bu/pull/194]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + os_dep/ioctl_cfg80211.c | 24 +++++++++++++++++-------
> + 1 file changed, 17 insertions(+), 7 deletions(-)
> +
> +diff --git a/os_dep/ioctl_cfg80211.c b/os_dep/ioctl_cfg80211.c
> +index 0e38a66..4c9c954 100644
> +--- a/os_dep/ioctl_cfg80211.c
> ++++ b/os_dep/ioctl_cfg80211.c
> +@@ -1429,7 +1429,9 @@ exit:
> + }
> +
> + static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0)) || defined(COMPAT_KERNEL_RELEASE)
> ++				int link_id, u8 key_index, bool pairwise, const u8 *mac_addr,
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> + 				u8 key_index, bool pairwise, const u8 *mac_addr,
> + #else	// (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37))
> + 				u8 key_index, const u8 *mac_addr,
> +@@ -1566,7 +1568,9 @@ addkey_end:
> + }
> +
> + static int cfg80211_rtw_get_key(struct wiphy *wiphy, struct net_device *ndev,
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0)) || defined(COMPAT_KERNEL_RELEASE)
> ++				int link_id, u8 key_index, bool pairwise, const u8 *mac_addr,
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> + 				u8 key_index, bool pairwise, const u8 *mac_addr,
> + #else	// (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37))
> + 				u8 key_index, const u8 *mac_addr,
> +@@ -1580,7 +1584,9 @@ static int cfg80211_rtw_get_key(struct wiphy *wiphy, struct net_device *ndev,
> + }
> +
> + static int cfg80211_rtw_del_key(struct wiphy *wiphy, struct net_device *ndev,
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0)) || defined(COMPAT_KERNEL_RELEASE)
> ++				int link_id, u8 key_index, bool pairwise, const u8 *mac_addr)
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37)) || defined(COMPAT_KERNEL_RELEASE)
> + 				u8 key_index, bool pairwise, const u8 *mac_addr)
> + #else	// (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,37))
> + 				u8 key_index, const u8 *mac_addr)
> +@@ -1601,10 +1607,14 @@ static int cfg80211_rtw_del_key(struct wiphy *wiphy, struct net_device *ndev,
> + }
> +
> + static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
> +-	struct net_device *ndev, u8 key_index
> +-	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)) || defined(COMPAT_KERNEL_RELEASE)
> +-	, bool unicast, bool multicast
> +-	#endif
> ++					struct net_device *ndev,
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,1,0)) || defined(COMPAT_KERNEL_RELEASE)
> ++					int link_id,
> ++#endif
> ++					u8 key_index,
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,38)) || defined(COMPAT_KERNEL_RELEASE)
> ++					bool unicast, bool multicast
> ++#endif
> + 	)
> + {
> + 	_adapter *padapter = (_adapter *)rtw_netdev_priv(ndev);
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
