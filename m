Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0BFC79F9E
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EA2404C4;
	Mon,  5 Jan 2026 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZjStF2biwgo; Mon,  5 Jan 2026 15:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4105F40524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767627092;
	bh=kqjBPfT9JOPGmLGzL5Esqu73BBU06IPeRGfvSpjWFWs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YGdoXqBWswTOD+B6Vgl7GSOm5rnRx6Ro1xmc4hFLGfy3ALycb0ReyOSGzS0C00UNq
	 XljjwVo0INQkOYu49WGs52LSVgaTTB7oiC8qGFJqB9UN1I913JmJVnDiIjRI0jdfyl
	 x7aNygUHvV97R4oaUc2KL4T6HUqaxcgI3jbyuN2mfx3GFfVew7PCsRuIzWarBnYFGI
	 zTe3yYeRI3tbHXc/PyCPt1/CFyv+jq9avJB6yyi3ujQXNwd1aOPuQ6hxXdHZUllDUv
	 dyFHdVvXeQUcp0ZQWm6zMq1MMM4x11ow7rG022uiJt4uGpOraWWaLBSVF+nSUdV5cu
	 WVI8CYMU1LY2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4105F40524;
	Mon,  5 Jan 2026 15:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4993D249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4740A40524
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOhfq0g0tl9j for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 15:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EB7A404C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB7A404C4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EB7A404C4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:31:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99CCDB97A601; Mon,  5 Jan 2026 16:31:25 +0100 (CET)
Message-ID: <e78873e8-61d2-4273-a55b-7f4e65b38258@rnout.be>
Date: Mon, 5 Jan 2026 16:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>
References: <20260105132326.4867-1-heiko.thiery@gmail.com>
 <20260105144206.6305e4e4@windsurf>
 <CAEyMn7bBCT4qMbJbMPkPHVuvC7rGM-LcQsNaL8=rMw1790mp-A@mail.gmail.com>
 <20260105145611.7a99251d@windsurf>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260105145611.7a99251d@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767627087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=d39POFnYIWc0099sfK8bAqxil+Wm+ZwjAQDGNKfk+Xs=;
 b=BmiVPFYotoPwCMP7Vziqeb+IwaXNlmnssm14p263BLARwADHAy3N1ujyV3oP96mNaCgrRB
 GYCbTMr15dmKpubmd3r5tnx76WgDX8MBPMEYm+qV3sr2qpjK6J/W+YlRGIY6y04Nvb1EX8
 BiVJRf5RSeFagCWGk/iGxiflwYxpvVBM0C+5d5WIjuW0uixxQEB3MiU5gVv/eJVbmEFZem
 7OMXT1Z4JCc0uLK0Z0z7XlAPIM3MAELOXAZIcLhHgQWgVaQ3xA8HlmV+te9DaY9ea6D944
 OWsy5wRGgeJSP6PCVUAhviAfeJYRoNCinjzv6VD4PZw1Hk4iCSOoiNQJw9QNig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=BmiVPFYo
Subject: Re: [Buildroot] [PATCH v2] package/uboot-tools: use U-Boot host
 tool printinitialenv to extract environment
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/01/2026 14:56, Thomas Petazzoni wrote:
> On Mon, 5 Jan 2026 14:50:44 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
>>> I'm not sure why we're using $(UBOOT_SRCDIR) in all of this instead of
>>> $(@D), but that's a comment unrelated to your change.
>>
>> At least for the first case we need to use the file coming from the
>> built U-Boot and not from the used sources from u-boot-tools package
>> (an older U-Boot version). How it is for the "old" path I do not know
>> if we could use here the script from the u-boot-tools package version
>> or if it is also related to the U-Boot sources related to the
>> environment.
> 
> Aaah, yes, indeed.
> 
> Isn't it a bit crappy that the uboot-tools package does that? This
> logic is in uboot-tools, but it uses nothing from uboot-tools, only
> stuff from the uboot package. But oh well, we're not going to
> revolutionize this now :)

  The file that comes out of it is used in HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE. 
Of course, we could generate that file in uboot.mk and then use it in 
uboot-tools.mk, but then uboot.mk has to "know" that it needs to create this file...

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
