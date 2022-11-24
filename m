Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902ABC43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B01607F0;
	Thu, 24 Nov 2022 21:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14B01607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUYtTH-Oi7hO; Thu, 24 Nov 2022 21:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC9560B3B;
	Thu, 24 Nov 2022 21:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC9560B3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0211BF29D
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9438381250
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9438381250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyaKXaxbteDZ for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:03:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8321381025
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8321381025
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:03:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 95D0F7802FE;
 Thu, 24 Nov 2022 22:03:28 +0100 (CET)
Received: from [37.171.166.93]
	by webmail.free.fr
MIME-Version: 1.0
Date: Thu, 24 Nov 2022 22:03:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221123153710.71a2056b@windsurf>
References: <20221122215557.789750-1-ju.o@free.fr>
 <20221122215912.824599-1-ju.o@free.fr> <20221123153710.71a2056b@windsurf>
Message-ID: <b400af36b443666a96c66df555135675@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669323808;
 bh=keaQRe8Fp7qtM91WEmL1kJwze5anFL+8j640QwyFCA4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SyfyF7zPCnDtbCBiVq1k/XcO/9eQNF+UfreeENawBlFc6+oIzewnSehy3G3xKX7fR
 b4EvcxK7h4TFJ8HYoNDbrPniPStLITRoCH6CiRTGxRjL6lFqkFFM40qafPkpnS5gci
 LMtPKM+suV81EjDaR040IhkB9r6EmkTiEYpNqja+NRAU46/j4qZYONFGymW5mZYREE
 u0VzsHoSFs51S7GQ85zrJM3GBlyOE+EvvM1ihF/jCVO23Q2mnW+ZPeDPdDX2tDOG6n
 E1oOKMITBA/HLn7eYSWVjQ0CLJMry2NdILxeEZK1moGxVUjtDX0fghx738O5E3vPDf
 ktRshSuc59nXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SyfyF7zP
Subject: Re: [Buildroot] [PATCH next 2/2] package/libjxl: new package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 23/11/2022 15:37, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Tue, 22 Nov 2022 22:59:12 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
>> new file mode 100644
>> index 0000000000..456305083c
>> --- /dev/null
>> +++ b/package/libjxl/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_LIBJXL
>> +	bool "libjxl"
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
>> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
>> +	depends on BR2_INSTALL_LIBSTDCPP # highway
>> +	depends on BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_BROTLI
>> +	select BR2_PACKAGE_HIGHWAY
>> +	select BR2_PACKAGE_LCMS2
>> +	help
>> +	  libjxl is the reference implementation of JPEG XL (encoder
>> +	  and decoder).
>> +
>> +	  https://github.com/libjxl/libjxl
> 
> Missing:
> 
> comment "libjxl needs a toolchain with C++, gcc >= 7"
> 	depends on ...

Thanks!  I'll add it and send an updated version of the patch.

>> +LIBJXL_DEPENDENCIES = \
>> +	brotli \
>> +	lcms2 \
>> +	highway
>> +
>> +LIBJXL_CONF_OPTS = \
>> +	-DJPEGXL_BUNDLE_LIBPNG=OFF \
> 
> So which libpng gets used? None?

libpng is in fact an optional dependency. This means if libpng is
enabled in Buildroot, it will be used. Otherwise, if not present,
no version will be used. It is indeed missing here and need to be
added only if BR2_PACKAGE_LIBPNG=y. I'll add it in the
updated version of the patch.

> Thanks!
> 
> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
