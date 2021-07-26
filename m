Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BF3C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 02:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B1360FED
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 02:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B1360FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B595360A7F;
	Tue, 27 Jul 2021 02:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBHED0bnE3_i; Tue, 27 Jul 2021 02:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A589607C6;
	Tue, 27 Jul 2021 02:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0838C1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 02:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8EF607C6
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 02:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eriG-sZhjKpr for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 02:23:38 +0000 (UTC)
X-Greylist: delayed 08:11:09 by SQLgrey-1.8.0
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A090D607B9
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 02:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXQj/uIzvJ1FlRSmxz06ckFl/6ejBK80/Kbbe+zblo4=; b=ND7/PMBl3ja9UbcRQGv50CLICe
 zNebtEz+DBfe7ZGkLm8zXbooOEHVhxHRvgaV/yhlUlsacZUteiveI/3ERQaTY2xzmEkFaqv2H5ldd
 nqskLh9wn55aShvO5qRAJVlrsQ4/f/e8O4tyKk4gVpc5jz+xBsLF2jJ507Wb1UJMdTcudEatmgct8
 Nist6sFZpfg6Fvp/yNPAlMck6tZuSFjb9ba7MZ4RxdqXnP6Y8pyt/1U+5pW3nX/VMth+tNrNao2ss
 eqbxn/D0BxO3AiWiYGaNQUainEQUQJ4+COBuVMyz/MyEm8Bx6yNOD5i3b175qfTxUKXhBbREjZv4Q
 TW+sQTiA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:36554 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m855T-0001DT-OZ; Mon, 26 Jul 2021 14:12:27 -0400
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210725215704.1262234-1-fontaine.fabrice@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <d3e2a219-de15-7eb0-8138-a92961bd8961@lechnology.com>
Date: Mon, 26 Jul 2021 13:12:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725215704.1262234-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] package/brickd: bump to version 1.2.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 7/25/21 4:57 PM, Fabrice Fontaine wrote:
> This bump will fix a build failure raised since bump of vala to version
> 0.52.4 in commit a6855bb94a815de820374d5ee95d6a4a0af66b3d
> 
> https://github.com/ev3dev/brickd/releases/tag/v1.2.2
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c162e518ad614a4c21346a3ad44e2f5c6622c889
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/brickd/brickd.hash | 2 +-
>   package/brickd/brickd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
> index e9be1b10b0..be9ad9ed90 100644
> --- a/package/brickd/brickd.hash
> +++ b/package/brickd/brickd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed hash
> -sha256  205f581103512599cb10992275da8c7207ed732e1a686600877c51b7a742de73  brickd-ev3dev-stretch_1.2.1-br1.tar.gz
> +sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br1.tar.gz
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
> diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
> index 7fe28daf78..f42b3c9956 100644
> --- a/package/brickd/brickd.mk
> +++ b/package/brickd/brickd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BRICKD_VERSION = ev3dev-stretch/1.2.1
> +BRICKD_VERSION = v1.2.2
>   BRICKD_SITE = https://github.com/ev3dev/brickd
>   BRICKD_SITE_METHOD = git
>   BRICKD_GIT_SUBMODULES = YES
> 

FYI, I already submitted the same patch, so ...

Signed-off-by: David Lechner <david@lechnology.com>


_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
