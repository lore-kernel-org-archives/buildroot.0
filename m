Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D1EC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 13:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2226F405EE;
	Thu, 11 Apr 2024 13:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBRkcrSZBxfk; Thu, 11 Apr 2024 13:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18B3A41959
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18B3A41959;
	Thu, 11 Apr 2024 13:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86B581BF3DB
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80F6581354
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNq67_LIZ4hb for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 13:48:27 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B10381399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B10381399
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B10381399
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 13:48:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD314E000A;
 Thu, 11 Apr 2024 13:48:24 +0000 (UTC)
Message-ID: <4ce12a2a-17e5-483a-abdf-5d5cec085875@yoseli.org>
Date: Thu, 11 Apr 2024 15:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
 <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
 <20240410231711.084c9d7e@windsurf>
 <9b5aee40-4cdb-480c-bd9f-d1bcbe5c57a9@yoseli.org>
Content-Language: en-US
In-Reply-To: <9b5aee40-4cdb-480c-bd9f-d1bcbe5c57a9@yoseli.org>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712843305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/4fJ1oRFonhjAqX4xxAayJZLXF2b4qiguCKTfhKhUk=;
 b=e8/Jvp/L1OQdv9zovjoBI9mby2+sKSNDOeQZR0Bq5i7wN6E7tqDVsJipWbuzadnudSDYFS
 yDGXXBQKac5U/5xAi0iLa1sxNE6EF5D7dRjaRGGdll58EvlrglddimnCjkDK2pndpflvJ/
 u+9kQpWbQoL5zBga8Z71YGyIESBX1Ni8Aa2+yJ46vzcL4wVCDXV98ETwPTD2cUwCsHB3lJ
 JHfvTMKU6MGlVo5Wk1lwzhnRyrcRjF5+0FMbgH+sA8urKWxgkQUYoKtCubw1qiM3eYRUuX
 FAxgOSLZkKeJNK8TCBONcXn0XVBIGy93VPwardN9JpI1XBP6UaFoLNix+KI37A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=e8/Jvp/L
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 11/04/2024 07:59, Jean-Michel Hautbois wrote:
> On 10/04/2024 23:17, Thomas Petazzoni via buildroot wrote:
>> On Wed, 10 Apr 2024 23:08:14 +0200
>> Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:
>>
>>>> What happens when you don't specify -march? Do you know which of isaa,
>>>> isaaplus, isab and isac the MCF5441x corresponds to?
>>>
>>> I did not check what happens, but based on the following file it is 
>>> isac:
>>> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/m68k/m68k-devices.def#L168
>>
>> And if you specify -mcpu instead, does it work? What doesn't work if
>> you omit -march?
> 
> If I change the line to pass isac, host-gcc-final doest not build at all:
> <snip>
> checking if mkdir takes one argument... no
> Invalid --with-arch=isac
> make[3]: *** [Makefile:4553: configure-gcc] Error 1
> make[2]: *** [Makefile:1029: all] Error 2
> make[1]: *** [package/pkg-generic.mk:283: 
> /home/jm/Projects/wabtec/buildroot/output/build/host-gcc-final-12.3.0/.stamp_built] Error 2
> 
> As I am not as experimented as you with toolchains, I would certainly 
> appreciate some guidance to debug if needed.
> 
> I can tell for sure that with "cf" and the 54455 family specified, it 
> builds my applications ;-).

Small update:
I have to add the following patch in package/gcc/12.3.0 to make it use 
the march="isac".

diff --git a/gcc/config.gcc b/gcc/config.gcc
index 5c378c698ff..a6fe9c2ad53 100644
--- a/gcc/config.gcc
+++ b/gcc/config.gcc
@@ -4522,7 +4522,7 @@ case "${target}" in
         fido-*-* | m68k*-*-*)
                 supported_defaults="arch cpu"
                 case "$with_arch" in
-               "" | "m68k"| "cf")
+               "" | "m68k"| "cf" | "isac")
                         m68k_arch_family="$with_arch"
                         ;;
                 *)

JM

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
