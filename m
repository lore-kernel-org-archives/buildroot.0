Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00082606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LMkkjCdo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0459607D6;
	Mon,  9 Nov 2026 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmG57uI6n3G2; Mon,  9 Nov 2026 20:52:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F37DD6077E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794257576;
	b=ib0sfUfVrpaSTYtXkcXXVNYb72XdDcewiF2NOHywu+hjlu6UzmdAmorG28INJnDCZKRP
	 ktn+7Bh2C0B3hXrIDNVj8DJaWlipiB4sOYkPvVbME4YKtruLyeuYCPAFoFobdy1kwji7Z
	 fq8TKCJ2W3oWnR+hTRb15QOCtUDJV1Y9E9sHuapWlOw4QfgDs7CFSQtvaLR0gltyolda2
	 quZJedGvFMSsQBR4Dop923FMaK+aDbr3z9Xu+KGdARXAUPVPDaopf9t9Ol66IKNd3Rp8O
	 lAzEEa4Aw9F4SmRmFsiad+iFIv1SsbHyFdS3w63AC7NlnLR7RXvqtrJXs0fOjJ/V5CQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794257576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 Cc:References:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/4LeEZfSjoBFodfmffAmxpIWtnpSYE1Y+am+icPC9xE=;
	b=CUWrBaUjylcF9afuyDeUXPoQgpRkSYTDDWlO9uzF9HJw0OZG8ktnfpdkLFPp/NqNtODB
	 SYX7CNeQQ3tnvC14PGsG1LCxA0z2RU5jVXN6+sh5jvalOdBpUb8wJyj5FohI4tLMXtK+C
	 KjjyfOqIq+cJAT/rgV43CAfrcnMdMRzAW+/9Vh/beZ4jPKFmj7h25CFWu/wUHhnPQfK+k
	 XsG2ER3rwM69g5+bMjJFrizqDo8NHBMhuMMru0T2lVwsXYvnI7EoPtC5oSuxx/2U5An86
	 piLxC0MXDNGd42GJfMXnGgVJ4lNkgJ6PKRXgIgslR1b/6B/mGkD8h6+QUblaOyENMGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794257576;
	bh=/4LeEZfSjoBFodfmffAmxpIWtnpSYE1Y+am+icPC9xE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LMkkjCdoahTxPd6tVE4tjZeN0c2mNRh/C2SHaHDOhVWUSBoTS3ejCxxHgpV0Nj7cN
	 +jXaF9cBNzWexCbf1ivkXXa8kpllSNYjcCgwSB02pNpX+vcaMzEjlX5ulIEEspwp2K
	 /RSYdTlulRoS3yGi0SJvP6YL4u5nmRzU9tfDIdiBUmdyUdQFz1b5k/tY843Cb6XHon
	 mozphlfGjCP3maP8TfTHsQeRknm9FnimmjKNl4QS44XkXvcFXoBNHuVsWiWW+lhtnv
	 ODKY6fmHinl/UGAZNg1RxdgFl3c8EtmZ7pMN0/jcoMMSQdAfCe+Hv9x+EolACvLFqa
	 Yp8Oy6PvvwYGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F37DD6077E;
	Mon,  9 Nov 2026 20:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C56335
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE6B406FE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrfNUYfhdvuY for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 20:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD4DD406FC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=dinguyen@kernel.org; receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4DD406FC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:52:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7142560F4E;
 Mon,  9 Nov 2026 20:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0D01F0089F;
 Mon,  9 Nov 2026 20:52:50 +0000 (UTC)
Message-ID: <b66d9576-ffa7-4ae1-829b-dd3a5637350d@kernel.org>
Date: Mon, 9 Nov 2026 14:52:50 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
References: <20261028184257.635621-1-dinguyen@kernel.org>
 <da925ae9b0bd1ec41451bd9a38684b1f@free.fr>
In-Reply-To: <da925ae9b0bd1ec41451bd9a38684b1f@free.fr>
Subject: Re: [Buildroot] [PATCH RESEND] config: add socfpga_agilex5_defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dinh Nguyen via buildroot <buildroot@buildroot.org>
Reply-To: Dinh Nguyen <dinguyen@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julien,

On 10/29/26 16:30, Julien Olivain wrote:
> Hi Dinh,
> 
> Thanks for the patch. I have few comments.
> 
> Since this defconfig uses "vendor" uboot, TF-A and kernel, I suggest
> to rename it to socfpga_agilex5_vendor_defconfig, to follow the "new"
> convention described in:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Also, to follow the convention in Buildroot, could you change the
> commit title to:
> 
> configs/socfpga_agilex5_vendor: new defconfig
> 
> On 28/10/2026 19:42, Dinh Nguyen via buildroot wrote:
>> Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
>> from the QPDS 26.1.1 GSRD sources.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---

[snip]

>> +BR2_PACKAGE_HOST_MTOOLS=y
>> -- 
>> 2.42.0.411.g813d9a9188
> 
> Could you send a v2 addressing those comments, please?
> 
> After those changes, please also make sure the
> the defconfig is regenerated with "make savedefconfig"
> and "utils/docker-run make check-package" does not report
> errors. Thanks.
> 

Thank you for the review. I have addressed your comments and sent out a v2.

Thanks,
Dinh

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
