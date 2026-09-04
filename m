Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F17C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C908B40B9A;
	Fri,  4 Sep 2026 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c65h1dbOSSVk; Fri,  4 Sep 2026 20:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D28240B90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788554445;
	b=lrmqvFoM4fMoqs6TECnWf8mLmdBm5sQVZJeqGXYhgD8LVM+qKntxWdBjBc/qfowjqEn6
	 byaQs1U/D39hBFovOPYQ+0wF+VRMqz5VNPuSpLERhfhVQY2saopQS3cnjslWMVFC0VCOx
	 hEJ72rYMZ5daRS52WBcpCOUKPULADouc3WiUaUsixtnBlcLy5tA5J+iY2bOHhjLphZRWU
	 Bfm3M/omKZSCGIs6vGzSL/YYH7Z+LxOoHPBQI04iZh3yJE88iC/vn6gEQ55ZgHzzaQSPn
	 s4FQIe2GQaUH1iqVDtm6OO9XLNO8WG7ijM7Ab66XpubtT0H87E9e1XVAAcKsXes+HjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788554445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=CAombx8l+3Nh7+8bn5TOPAsQF5fz2GWg8gc8jqDA8dg=;
	b=ImE9NO3KgSNaacJ4baww+plfdgFBSI30kocMSi2LwAup+Br6BKaGTeGkP4mvXK1Kqybm
	 46R9HMoTTFl3baisnoG5UfuRoTiZp+AkNKCgUngi0ixJjJ3nIPveRiapcpEDU32G6/F4Q
	 5hUZLKnjWtZVqlqTTI3oORW9ggwsxWuznAPGIkc1FYz+QXkcYTe0ggKoijMSEZKdyYGV7
	 dvLhhufSLO8SJ08fyn3iIquOPfzS30oxzHkNl3uNG9GEBIakzXoaSHXhTSq+xVASwdBjX
	 9c2GVFVThb/k2GGruZc1f8zZIIZEU7EfxAJ5YfJogzBpCTYyjea0sWDbujC0/GiN++A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788554445;
	bh=CAombx8l+3Nh7+8bn5TOPAsQF5fz2GWg8gc8jqDA8dg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Vrz+ctIjjA1RhubwiW3FN8xdHMgJCB+LdLo8VY6FrV/o/5GvSBKPhXqgVYnDTFQh5
	 pvmIMOjNsPVmQtLULLw3iR21caxmYa1jX+Jy1Lt38CQ0Y22fAITWkrkBrZEknIy0sr
	 NBJFjsb9xVkUJGK8zyXCpHWBDghO0kXWjHpsr01PgaH80o66c/82X4/MwXMd3a+FJc
	 2JbAZjeYTGcpwUFPcKoGfxo36HW4eGZ2qLMlizHekzsFZnLc9ifbyLcaWhYi2T159x
	 +PUF0TCXRMnAlM4BuYUhrOETzkc0EVlPN73YpSjMejJlEkQCngP8mwsTEh3iyH7ZSl
	 1wKj6lTWMOaPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D28240B90;
	Fri,  4 Sep 2026 20:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4104010E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27A1860B8A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swmH2Mp9Jfbw for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 20:40:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AAFA060B89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788554443;
 b=ixQ1l3glOfLtXO3w+NEjMTVPb57ptz5ZXKn6rPt5W5nn/915HSEqbmWaGAG2RtjUQa83
 FywAV+rhHvHsLIxaZlJ0fwyYHIfn1EK1efdzqT0jsL8Ph6Tbc3A20A0rhNJTHhBXAnVDk
 9bRx/hIV4k+8F+YoRPSvXhwMRV24K1BuTCRRUee8Ak53rGJpFkoI0EGbd6U2ooj2C7+0C
 OB8Iq0q5yZWUMdRh6p2Q2krcTl75gbeYx8lxh79uQL42ziH/jCmuZjKNh25/Z6VfhVoRI
 POEM4P8j4H/dk74v0qSkxOG7lbTvY3Ypm6WOG6fK0hQTTSWHNR3CRwmX5GJ+Xlw2v7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788554443;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=SUWZyMJsvAwiutux7KIYbGJddVTto8C7ADjEi6NFg4Y=;
 b=mE5M8MUqLQchCoBTnx8GMdYzhoN9SuHZdzOmH3/R4MFfdYCiCNbBlRg001GS58FOtwTo
 hgLkHn+iTvpnAq8+Vls94RQDP+14+yaieDxUpN6KBGYtQFZC0WU6k38TMzqgsdmPwiwmP
 gzhyUCC+7W1YNoH027PRXI+J+enI3iPd7S9LFTqxzWKrH3tYkpeA6ieWCm/8RdctLIC9J
 ciKuNoMckJec/PTCESZ3HIRPMKBqbXBPhbv+ksmEyoims5ulMyVuNmxytlbNDG4UYNSVM
 Re2EBj1Gytx/50gCgfqypXY9fUyhfqHWIAkfnrhm6IS3vxbxwc7Xkc6YgTyU1Cs8DuQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=iTkKfbIv; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAFA060B89
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:40:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpnm-1wV9mn0Bpq-00jNCu; Fri, 04
 Sep 2026 22:40:39 +0200
Message-ID: <158cdc1a-acaa-4292-b959-dfb561f47aa2@gmx.de>
Date: Fri, 4 Sep 2026 22:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Martin Bachmann <martin.bachmann@designwerk.com>,
 buildroot <buildroot@buildroot.org>
References: <ZR0P278MB0869330F8A433371A1F8CB008B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ZR0P278MB0869330F8A433371A1F8CB008B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
X-Provags-ID: V03:K1:PFSd4n55d/nv8O73kjUZh3F2ZJIEH1erWou+0Ozocusw0ioERfJ
 Xn4DYCDg3ExZy6XGwDKyYZhmHjrrxn/uBLNGCpEA5buJxOwvX5XGGvCraajgBLneR8Fo9RO
 s87PQKiGyeT75nShrJgLvbPuo+X3/51BuFx8xxSwfeofY0EVNZNWNzCyCeMe7nXuHMH0oqc
 AEfVV7wUzIhIQfyy2YclA==
UI-OutboundReport: notjunk:1;M01:P0:6vOBxgQ+Q/c=;6KbZbV6hfqvubWODES5wWto78Gc
 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
 W09LjSCxxqhfgwlG5MXmdfXKuzsC3A094Nw==
Subject: Re: [Buildroot] [PATCH 1/3] package/dejavu: add missing license
 information
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 06.03.26 um 15:03 schrieb Martin Bachmann:
> DEJAVU_LICENSE is primarily BitstreamVera. The license file also specifies that DejaVu-specific changes and certain math extensions are in the Public Domain. This matches the licensing logic used by OpenEmbedded/Yocto.
> 
> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>

Applied to master after fixing line wrapping, thank you.

> ---
>   package/dejavu/dejavu.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
> index 9b57f0992e..bcb8675442 100644
> --- a/package/dejavu/dejavu.mk
> +++ b/package/dejavu/dejavu.mk
> @@ -7,6 +7,7 @@
>   DEJAVU_VERSION = 2.37
>   DEJAVU_SITE = https://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
>   DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
> +DEJAVU_LICENSE = Bitstream-Vera
>   DEJAVU_LICENSE_FILES = LICENSE
>   
>   DEJAVU_FONTS_INSTALL =
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
