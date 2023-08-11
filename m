Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA90C001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED87541E80;
	Fri, 11 Aug 2023 22:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED87541E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPYDJmZuuOzu; Fri, 11 Aug 2023 22:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E579441E81;
	Fri, 11 Aug 2023 22:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E579441E81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5F11BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3CA98402B
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3CA98402B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vUUBO_yiHfG for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:25:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A523A83FFF
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A523A83FFF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 588931BF20A;
 Fri, 11 Aug 2023 22:25:04 +0000 (UTC)
Date: Sat, 12 Aug 2023 00:25:03 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230812002503.33f6d5c3@windsurf>
In-Reply-To: <cc38f5ec-c613-2323-e288-7fc1d0b186b6@mind.be>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
 <cc38f5ec-c613-2323-e288-7fc1d0b186b6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691792705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s7Qirom7ztnPp4mWZRm5pQuErKRpy013V5KWtEJLQ0Q=;
 b=ps/HuuqKkrq3inwSZU16t54xGAf6sYm6XqkQpzc4XypedTLdJMrzwzAW7/zdT3wouXvK0t
 yZv0S4pcNYyCcHFf9iqkRTbYFiaAoSOsrwY3PA/GXXkHMOMxQmFHb9kMG3vce5u8RihzGJ
 qkwnM/FAP+8gGwcWuph/nBglMCE/VlJEznzDoDEyw3wy6jQK5bTMaSA2W+lG/EiWmw/U/5
 +palQ52bLywuKTwFLYq/jLTU/6CmUH9BLdDyoaBIy3O6nVhzMvU86mCczp4r3Ce7tTjKp8
 ikt2/REonVWvxjHLYP6O6V3dMv3yUdgfIPLNJWzBjLVYkK+IYU6bthjrENxweQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ps/HuuqK
Subject: Re: [Buildroot] ARC support in Buildroot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 11 Aug 2023 22:00:48 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > So, in theory it should be OK to remove "arc-xxxx.yy" toolchains from Buildroot.
> > But since we were a bit late with ARCv3 changes for GCC 13, those will only
> > land in GCC 14 which is going to happen sometime in 2024, I guess.  
> 
>   I think (Thomas correct me if I'm wrong) that we would actually prefer that 
> ARC just uses the normal toolchain, and that when ARCv3 is introduced in 
> Buildroot, the "special toolchain" will depend on 
> BR2_arc_v3_or_whatever_it_will_be_called rather than BR2_arc.

[...]

>   Using the upstream toolchain components is preferred because that way the user 
> has the version choice, rather than being forced to use the ARC-specific version 
> of that moment. Also, when someone updates to a new GCC version, it immediately 
> becomes available for ARC as well (instead of having to wait 3 years for the 
> ARC-specific version to be updated...).

This is a very good point indeed.

Alexey: when do you expect to submit ARCv3 support in Buildroot?
Depending on when it comes we might decide to either drop or keep the
ARC-specific toolchain components, and if need be re-introduce them for
ARCv3.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
