Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85531C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E64A240187;
	Mon, 17 Oct 2022 20:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64A240187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgG1UAIwvwIt; Mon, 17 Oct 2022 20:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E48DB400DD;
	Mon, 17 Oct 2022 20:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E48DB400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084DF1BF313
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D94608F5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D94608F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbBVD57z2ZuH for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:55:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E1F6080A
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36E1F6080A
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:55:46 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kX9FoQdrYSfRFkX9Fo4SU1; Mon, 17 Oct 2022 22:55:45 +0200
Message-ID: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
Date: Mon, 17 Oct 2022 22:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfNWSQN1Oss0dThGAhtpMl3cThfjz36oO4Tt2Nv6rNYIvljW0lru6bTpvXO04vrtSzi4thj/nI7G3HhbRwm0tsCEmYw5dOhrJoD5D/SmTrgkCxqXfinvl
 NyOgiz87YZKLTj4lyEEGLgc3MVpDOpiTtgA++jUciv1qg6Sz78xz8paTbETlEJGXfV4iPSnG2WFY6giGbB+xnQelCaIXRVlK3kJoMJgsZtP6trKCzYjHjlPq
 XJGSbTeUYQxbHi24N+gdqcnf8j++kQ+HcCOjEP8GokA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666040145; bh=qlGiiuAQyj+0nqqr1CrL6TwA+ijy/DYAS8E8gWTQ6Ao=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ci3eS30Pi8wYRklyRH0ECrLSH5ROAj32yn6kAsnIPoOZWiwHyrilvG7rQMYAOUj7x
 NZ7E5bLL6MbBddUkAcO8SDDxUvWiDl+Mlqf5n8WVAGl+GBAr3SQS35c/lgYwDp7THa
 Fz+G6fpd2mciISS83u3t8oseLnk98amUdO8xtnx8/i7ZPwTAgfOQGP4RkmCOxo1y+q
 0qtZK/p73PSF9zSAiUvsdeoJEqQ+Vg2EUMWAsNrKpdyRCLEzULdK9tKp64GXGVKsa7
 i+6I4TVxjBV/H+u2UsIDmiUmMqzZbqBmS7S+5ClzhzAoKYAkGmVLbeRIXIFHRxqsR3
 NiNJC4GvhZdiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ci3eS30P
Subject: Re: [Buildroot] [PATCH 1/2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon,

I've checked better the commits and this version fixes build failure 
with Linux 6.0.0+ but it introduces a runtime bug by removing code for
Linux versions < 6.0.0. So I need to send another patch with a previous
commit SHA1 and create and send upstream a patch to fix the bug.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 17/10/22 22:18, Giulio Benetti wrote:
> Fixes:
> http://autobuild.buildroot.org/results/550/550640296a92826f6f04d2344adde75c3025ea35/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8188eu/rtl8188eu.hash | 2 +-
>   package/rtl8188eu/rtl8188eu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
> index 9c7f2de4b6..1cad263ee3 100644
> --- a/package/rtl8188eu/rtl8188eu.hash
> +++ b/package/rtl8188eu/rtl8188eu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
> +sha256  2f333604b39745a003b4a3c87bda3adcc0efd68100dff4aa3b54ae7992fc0143  rtl8188eu-77c1b083c5eb8336a2381aee20add496d1c96b51.tar.gz
>   sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index ebce4617ac..460bcba460 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
> +RTL8188EU_VERSION = 77c1b083c5eb8336a2381aee20add496d1c96b51
>   RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>   RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>   RTL8188EU_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
