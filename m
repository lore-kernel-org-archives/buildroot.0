Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD11C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC2E660A68;
	Sun, 30 Jul 2023 10:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2E660A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bMBd94AshXd; Sun, 30 Jul 2023 10:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57DE607E3;
	Sun, 30 Jul 2023 10:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57DE607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB5171BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDC2409A7
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDC2409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6LkQzcfHTwl for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:56:47 +0000 (UTC)
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFD8F40926
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD8F40926
Received: from [192.168.50.162] ([146.241.4.160])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Q46MqKvdT3oC2Q46Nq0P5W; Sun, 30 Jul 2023 12:56:43 +0200
Message-ID: <6c02501e-2414-4611-97cb-1460352f55a7@benettiengineering.com>
Date: Sun, 30 Jul 2023 12:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-2-bernd@kuhls.net> <20230730122650.5592af4b@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230730122650.5592af4b@windsurf>
X-CMAE-Envelope: MS4xfH25uv9DMaWVoNxKvL9WSFm6zIyjvyyssIJuI9y1duK+2WDjUC2CtHDl3mCSSkGCpRccxLI9izs5Cbtxfvvk9OJc4KnWw9KWFq9q7k2B/hmXP1iQVeJ9
 PE9BO4LZvwYr2IEMoD9t/m91Gh+l2rzsgdBRDCyM+/jpmwlVEl1CXI82dFXdxOOrSmbbHYSAZ2+YEIlvPJvUiTMZmezXyPsozACSbQ7vt2YX0GMxdLBV/ruP
 ns4DgtLNDXxAcKR2Y+rcjRQo4S84BWgaokINTUGDp03eKwXDyldAqsIUr3ZzgIcQasj2f6CIPlcqTIn/nkuGV71HHFUv0gxW+KvpZjvoDTiDeFBHTMFOl6XD
 51H28RgV8ZxJX2qwuqjADPH68GH4dpHjLlOu27aBq2dVDYK8SkA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690714603; bh=4kzR9/X3Ns7rG3dsb4jGXiVkoqeIu2frFKSsSV8HvaU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=S0mAB8qRBLCgHSKzCdEfhwPWY+xtSoEgE2z6Xur3D0uUJqfgPJVFUivxOxnvilI6t
 h2n49IoiDh3fgChTxnBfZYTY3I1Lyu4VmPz7CmoJl96ZTe16aCrrdPYkJAiVv8VK2x
 a6OBXUzh1aoxGr7QbYwBm29SI/Elmr4BXDUZZ5w9C9VIPzSZuYGo+1uM6m2AXS8vcF
 psRI3ufYc1lxq5UmrcJAIpePURy4tAJTJIYPC3eQ2mswZ5Gdvb/Uq3u/jYxwYGMxfF
 ZjNZCDlJ7hEfP//NnAazJH3veV7rk+L2wYBVoXmsKKHhQNwV6QMpgrP29AuXYGVngL
 AQpDCBHH4I3rA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S0mAB8qR
Subject: Re: [Buildroot] [PATCH 2/7] package/libheif: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

On 30/07/23 12:26, Thomas Petazzoni via buildroot wrote:
> Hello Bernd,
> 
> I've applied, but I have some comments below. Giuliu, there is also a
> question for you.
> 
> On Sat,  8 Jul 2023 22:04:42 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
>> diff --git a/package/libheif/Config.in b/package/libheif/Config.in
>> new file mode 100644
>> index 0000000000..9ce507fd24
>> --- /dev/null
>> +++ b/package/libheif/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_LIBHEIF
>> +	bool "libheif"
>> +	# avoid build error
>> +	# Internal error in emit_expr_encoded at dw2gencfi.c:215
>> +	depends on !BR2_m68k_cf
> 
> Giulio, do we have a BR2_TOOLCHAIN_HAS_..._BUG for this? Are other
> packages affected by this? I see quite a few BR2_m68k_cf conditionals
> sprinkled all over the places in Buildroot.

there is a possible toolchain gcc bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

but they point this to be a binutils bug, so I'm going to open a bug
in Sourceware. I can't find it already, so yes, it must be open.
We then need to add a BR2_TOOLCHAIN_HAS_BINUTILS_BUG_ and then I can
check against it with the workaround(-fno-dwarf2-cfi-asm) and see if
someone will fix it in binutils and backport patches.
BUT I see only now that for BR2_m68k_cf C/CXXFLAGS have by default
-fno-dwarf2-cfi-asm enabled and if that doesn't make the trick I need
to find another work-around, or maybe it's completely another bug at
this point. Soon I'll be on holidays and I will have more time so
I will look into it.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
