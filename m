Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BB6CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 17:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A56281254;
	Mon,  8 Apr 2024 17:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-6g03N3q7xr; Mon,  8 Apr 2024 17:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D3981365
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D3981365;
	Mon,  8 Apr 2024 17:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74BB11BF2BD
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6238340C3F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cO7M7wgtpxVI for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 17:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A95540C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A95540C1C
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A95540C1C
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 17:47:35 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tt57rWBieoq80tt5grrYbq; Mon, 08 Apr 2024 19:47:32 +0200
Message-ID: <6f489911-35ac-48ec-91c4-d982692a7477@benettiengineering.com>
Date: Mon, 8 Apr 2024 17:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240408171050.54781-1-giulio.benetti@benettiengineering.com>
Content-Language: it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240408171050.54781-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfOtyz/gej2wscAts3SKz/1XCen33VQfKFQNww/KaHAmLwNrXSi7+XnyXWcY7If0tDoBBHVCcD1/VZjB/UTNfyYc1OzNJYKi3g+Y0QZCXTgXoTVzLQSHR
 mTwOrAtwzzmXF3fegb26zVHSZDXpL3DJu4pdVuXqKKFnuVsnBmT1NaEHF2aQUX2JIBIhftnQZQnCGFrhy6XQ4FzrXCOk5l3F8NHAhevZ4ihUszEC4xeqpRXf
 LPh/w4zKbt6k2xsWOqUlAA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712598452; bh=jeEcdr3VtJLaogC2E0+Dfs897/o+s3EATf7UrzW+Ftg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FvYmyzxlhTsWbLQrF7Zkvaaa1IePY5GzZVBv44fByK81bmXVmfrBbOhxdrW5HgefH
 UtHnrlYrN3CWdVMhPBEYI34Ur1fg6ugMn40K8Ux45mbSoo8yq+ZPFMwRrarA3DxS4j
 4P2C4ebVdp+RPfyOIvc1ZZq2B9gP2b5pYlk0qzuZksM5BcC9HY9rdfwCHuNtd7OPpE
 chL+GRO2rJEz2Z9oH7rBnQkz/ebq08XH9s0L0AvBlBVfx7r7Vwnv7SoqToP5ZYad95
 PYV1pSXWkFVe92RcfXKxB3gevFCdgCkbm2b53IlPW5eUy08svkT9JPyC945D7rtR1x
 brQKJlFQ6ByBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FvYmyzxl
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2024-04-08 branch v5.2.6
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
Cc: Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Il 08/04/2024 19:10, Giulio Benetti ha scritto:
> This version allows to build up to Linux version 6.9
> 

Fixes:
http://autobuild.buildroot.net/results/3b451b427a8dbe39ed275f91e38e76c2cae9a43a

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8821au/rtl8821au.hash | 2 +-
>   package/rtl8821au/rtl8821au.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
> index b19cb93bf6..56e5609ebd 100644
> --- a/package/rtl8821au/rtl8821au.hash
> +++ b/package/rtl8821au/rtl8821au.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  9dfb2b12c52fe759e4978cbd7a0fb90f0605ae9146a6d0186f2869bbfb6d13fd  rtl8821au-0cab870ff635ba038705ab29363b0cbbedd5c258.tar.gz
> +sha256  fde8ca9735a6c9c4c907fb6f565185a59b04bcfa78feb2309941cc09d49c4ac7  rtl8821au-8ea0ed9da764448c7310a27744ab5814289f35a8.tar.gz
>   sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
> index 6bb77de81f..9a92696437 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8821AU_VERSION = 0cab870ff635ba038705ab29363b0cbbedd5c258
> +RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
>   RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
>   RTL8821AU_LICENSE = GPL-2.0
>   RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
