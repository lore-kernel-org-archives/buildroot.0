Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A4AC25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7689F401B2;
	Mon, 15 Aug 2022 20:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7689F401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CBMojg_D1aA; Mon, 15 Aug 2022 20:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9226D40286;
	Mon, 15 Aug 2022 20:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9226D40286
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E299C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD9760B97
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD9760B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bw2LmolEZw_F for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA76960A9E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA76960A9E
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:06:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 0E12D60129;
 Mon, 15 Aug 2022 22:06:55 +0200 (CEST)
Received: from [37.172.236.45]
	by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 15 Aug 2022 22:06:55 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220814202300.GM2854108@scaer>
References: <20220813093627.369221-1-ju.o@free.fr>
 <20220813125424.6caa746b@windsurf>
 <e0634cb156656205a84bc7ecce8a9412@free.fr> <20220814202300.GM2854108@scaer>
Message-ID: <4030b275fb04cbdc96c325c62d49a11e@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660594015;
 bh=maKz6GLbK387qAm890vQITKNXGHSnAC9+dxNVVAdcAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YrSReZh+f5Hu5MSAPF8OHQOGeGTBIRWstdwy9awRwgpeX7Eme30eKtbjzMIalG1Cw
 RV7bHQpqq5pjCQ1jvGWab+zwCtV4dEnjaH49C9lm7Gzul50s22ikNi0Fw/Y3wPVWil
 SZd8rXCQKJLDehhjY38x+CChsDcasDbeCcCaEVos5Rdk/Tmja1Wy7TQPtFRDTfSyL1
 MqMMgB683GrjTclcqUo4ji8b02xlwFfiBPXzkb3Zxn0yJwuVnQ50MunPKZIRQC8vY5
 E/6W0qqtXYrUelCBc97NW57LzhaBReoS3SEPR1riDYTKdXY2uuUaY/WuHF/otUyx/D
 cP97CIJaMFpBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YrSReZh+
Subject: Re: [Buildroot] [PATCH next 1/1] package/linux-backports: bump
 version to 5.15.58
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Thomas, All,

On 14/08/2022 22:23, Yann E. MORIN wrote:
> Thomas, Julien, All,
> 
> On 2022-08-13 22:01 +0200, Julien Olivain spake thusly:
[...]
>> - Trying to compile kernel v3.10.108 in qemu_aarch64_virt_defconfig
>>   did not worked out-of-the-box for me (on Buildroot tag
>>   2022.08-rc1, in utils/docker-run). Build fails with:
>> 
>>     dtc-lexer.lex.c: In function 'yylex':
>>     dtc-lexer.l:46:18: error: 'yylloc' undeclared (first use in this
>> function); did you mean 'yyalloc'?
> 
> Gah. This is 9b41b54be077 (linux: fix build with host-gcc 10+)...
> 
> That's because in 3.10, the dtc sub-dir still had the pre-generated
> lexer and parser. And with 9b41b54be077, we remove all lines that
> instanciate yylloc as a YYLTYPE:
> 
>     grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
>     |xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
> 
> So, this will remove it in bot the actual source and the pre-generated 
> C
> files.
> 
> So, yeah, we might even be able to build a 3.10 kernel with 
> contemporary
> Buildroot versions anyway...
> 
> We could fix that by passing REGENERATE_PARSERS=1 in 
> LINUX_MAKE_FLAGS...
> Julien, could you test that, please?

I quickly tried adding REGENERATE_PARSERS=1 in LINUX_MAKE_FLAGS.
It's still failing with:

     dtc-lexer.lex.c: In function 'yylex':
     dtc-lexer.l:46:18: error: 'yylloc' undeclared (first use in this 
function); did you mean 'yyalloc'?
     [...]
     dtc-parser.y: In function 'print_error':
     dtc-parser.y:478:17: error: 'yylloc' undeclared (first use in this 
function); did you mean 'yyalloc'?
     dtc-parser.y:478:17: note: each undeclared identifier is reported 
only once for each function it appears in

I'll investigate later.

In order to test that thoroughly, what is the oldest kernel we would 
like to compile
out-of-the-box in Buildroot?  v3.0?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
