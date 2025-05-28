Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD35C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF10140851;
	Wed, 28 May 2025 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuTxO3LycRql; Wed, 28 May 2025 20:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD7B40857
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD7B40857;
	Wed, 28 May 2025 20:56:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D15B91
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC1881D02
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTthY2w7yZ3a for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9781981A16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9781981A16
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9781981A16
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:56:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 43F1F2003D3;
 Wed, 28 May 2025 22:56:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 22:56:54 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 22:56:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
References: <0cc8c132abc7f2117de95906fc1ae4729100c564.1748355369.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7c0c1993b8789a5c5e2af275c8dc9882@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748465815;
 bh=hqAkdUPJ5TgEiOseDog5oS1hboyHFBFTbP8V/0oda8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C9iggcW8a1idOZeRrQ2aMtARlsVfzPUARCivFPcRlw0NTsweRN1EqFqy6LtmByBrw
 0lJIqBsIO+pqyKiVQ9jgAoxZsFB2K4HkHBiTxobir7UZQKL+A88m26XlMxsO4U+5ae
 nGn12c2O/PIQ9BrnUt+kMN3tyqZpeLI6+NY7nAy++Yq6y1+g3VivtXXHY+X9OxtDj0
 foxDaPNUvnO8uxzCFhWMtcQTe/CBrbyixqHyigw1uWkmW0ORZ3ZN9enGAl4sP5ADRg
 JBRP3C1LF35H9th0eBOzace3wUeIb85dyfaupzNFkdWh91HdqTJMKjJCibAgsYqaR9
 N4j19sjJvdc5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C9iggcW8
Subject: Re: [Buildroot] [PATCH] package/gpsd: bump to 3.26.1
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

Hi Yann,

Thanks for the patch!

On 27/05/2025 16:16, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Support for RTCM104v2 and v3, as well as for ublox, are now
> unconditionally built, so drop our corresponding options. No
> needfor legacy options: users that had those enabled will
> still get them.
> 
> Support for Oceanserver has been dropped upstream, so drop our
> option and add legacy handlimg to infrom users they should
> complain upstream if they needed it (very unlikely).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

[...]

> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 8f87766dcc..1b20210c49 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GPSD_VERSION = 3.25
> +GPSD_VERSION = 3.26.1

This new version fails in the gpsd runtime test. There is
apparently a change of behavior in "gpsfake" in UDP mode, which works
for the first client connection, but fails for subsequent calls.

I bisected this behavior change to upstream commit:
https://gitlab.com/gpsd/gpsd/-/commit/5c080c35fc3d981172a5e4af34d0d92854a5433a

The issue can be observed, outside Buildroot, with commands
such as:

     git clone https://gitlab.com/gpsd/gpsd.git
     cd gpsd
     git checkout -b test 5c080c3
     scons
     GPSD_HOME="$PWD/gpsd-3.25.1~dev" gpsd-3.25.1~dev/gpsfake \
         --udp --slow --quiet test/daemon/ais-nmea.log &
     gpsd-3.25.1~dev/gpsctl  # first invocation works
     gpsd-3.25.1~dev/gpsctl  # other invocations fails

Do you think this behavior change is an upstream bug?

If yes, it would be nice to fix this upstream. Otherwise, we should
slightly modify the runtime test (like removing the gpsctl invocation,
if gpsfake udp does not support more that one client connection).

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
