Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEEBE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD21608A3;
	Thu,  2 Jan 2025 19:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sZGB2MEMRXH; Thu,  2 Jan 2025 19:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69C860899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C69C860899;
	Thu,  2 Jan 2025 19:11:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA3FF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 19:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C011809F5
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 19:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnJq19cH39_7 for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 19:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47C3080890
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C3080890
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47C3080890
 for <buildroot@busybox.net>; Thu,  2 Jan 2025 19:11:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 887FA13F879;
 Thu,  2 Jan 2025 20:11:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58290])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 20:11:29 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 20:11:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net, Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20250102105002.31920-1-mf@go-sys.de>
References: <20250102105002.31920-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <cd662721676d7460fdd0a0878ee029ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735845092;
 bh=TxCQ6YO8kt7ZObxnbzPyttU+RdyYGUFF98XmJsFFnIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NASUzYENADkNh6AipEQziXIz8A3AWtlTC8jKO1bd8eLLY3zzwteYjV/A+ZwUALk5+
 eL9vU6KORqaRofCwpltiZceNnsekrRkHrAJEcfxZ/tFk3XSk2e1ziquDF7s79NTKxU
 AFxZw7W0gAj3NsO6O/0aNsmRkUU8kcG2bESTCg4my8Q8QGrfNIE0UQRTmaCMeq1T7u
 vdGVfyvHSEvYuiQ86rHuqgYFRILwr9UYmNaGvV+h3bp8F3fbSmHZ1Dyg+JM0gw903/
 2SMzzjP2P3hBGkSmhtjTepQlbTCh2odgglvl2IkkdD53ya9qrfif+BSAc9JSoUOUsP
 a2IlHumG9/Aaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NASUzYEN
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.2
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

Hi Michael,

On 02/01/2025 11:50, Michael Fischer wrote:
> patch 0002: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

I applied to master, thanks.

For info, I added a link to the release note.

> ---
>  .../0002-check-for-defined-FE_UNDERFLOW.patch | 32 -------------------
>  package/gnuplot/gnuplot.hash                  |  8 ++---
>  package/gnuplot/gnuplot.mk                    |  2 +-
>  3 files changed, 5 insertions(+), 37 deletions(-)
>  delete mode 100644 
> package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch

[...]

> diff --git a/package/gnuplot/gnuplot.hash 
> b/package/gnuplot/gnuplot.hash
> index 4072338885..8b59bf6a07 100644
> --- a/package/gnuplot/gnuplot.hash
> +++ b/package/gnuplot/gnuplot.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.1/
> -md5  744fde2362fb20db6cfc58de73f96e9c  gnuplot-6.0.1.tar.gz
> -sha1  ce1aaeff632c78cba2b3ca8142cf130bfd411478  gnuplot-6.0.1.tar.gz
> +# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.2/
> +md5  ea0931758fc180e3b1950931b9869921  gnuplot-6.0.2.tar.gz
> +sha1  be803916e4ea32720b4a646f2ffc98d6ad3a0dc2  gnuplot-6.0.2.tar.gz
>  # Locally computed
> -sha256  
> e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a  
> gnuplot-6.0.1.tar.gz
> +sha256  
> f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738  
> gnuplot-6.0.1.tar.gz

I also fixed the file name here to "gnuplot-6.0.2.tar.gz".

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
