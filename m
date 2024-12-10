Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80307E7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DC680E2F;
	Tue, 10 Dec 2024 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4K1hTfzsyEP; Tue, 10 Dec 2024 21:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A3680D70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A3680D70;
	Tue, 10 Dec 2024 21:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7F46F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D5DA80D70
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJx0G9rHBuXu for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 21:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F84E80D2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F84E80D2F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F84E80D2F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 57BDA5FFAF;
 Tue, 10 Dec 2024 22:50:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51564])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Dec 2024 22:50:26 +0100
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 22:50:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241202230529.228304-2-giulio.benetti@benettiengineering.com>
References: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
 <20241202230529.228304-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <22cbebdbf87f5213daeef26356763ba5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733867427;
 bh=ZOZq5kQ1Gluthbh1P+79HC969VY+qMnTCdOvt3FY2Fg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=crwnjziXnT+12aH+uv4/UdYe4PVhtOyyYEuWqKw/j8bv6cz/rlHwJgsj64I3/6Z7L
 hjRWcy2zZjBqyDqo5INJH1PoYhsZXX38Wu4V+pGQLMc4c7sG5eH/I0yDRM3f80TWJ/
 ksvq9qNln5PtVGO3pJLy/EP1AM4lyqsv/GEUaZN40O8IAh3RgcKSwfpbhzeDUs3dtO
 oYyFAgA/+22K6l/WaY6ixYrhPinGp6pER4xwKhTuEkXnFHdcEYOjlKuJdJ66KVQDlc
 /dotRcYJAFIhc8APYXk3KYxRPJC7/hm77QG+8G5DFNDKyINuK534466G137YqLVZ0L
 oDIAY3KMBxITg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=crwnjziX
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to version 2024.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 03/12/2024 00:05, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

> ---
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swupdate/swupdate.hash 
> b/package/swupdate/swupdate.hash
> index ac28acb1f4..847c5a1098 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> 2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2  
> swupdate-2024.05.2.tar.gz
> +sha256  
> 528c61769456d7740a9ba1d045f25f7587203e2a2e71a9a67998f0e13e2db149  
> swupdate-2024.12.tar.gz
>  sha256  
> 4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  
> LICENSES/BSD-1-Clause.txt
>  sha256  
> e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  
> LICENSES/BSD-3-Clause.txt
>  sha256  
> 0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  
> LICENSES/CC0-1.0.txt
> diff --git a/package/swupdate/swupdate.mk 
> b/package/swupdate/swupdate.mk
> index 75e4af5db4..fe6ef2dd6d 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SWUPDATE_VERSION = 2024.05.2
> +SWUPDATE_VERSION = 2024.12
>  SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, 
> BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>  SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
