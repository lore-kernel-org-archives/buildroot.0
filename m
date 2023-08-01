Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2DC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A8C41802;
	Tue,  1 Aug 2023 19:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A8C41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdAwTrcmeO_E; Tue,  1 Aug 2023 19:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6577E401D3;
	Tue,  1 Aug 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6577E401D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 726901BF86B
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 19:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E6F58146A
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6F58146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHGKK9oqru2i for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 19:44:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29AD480E5C
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29AD480E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 096691BF206;
 Tue,  1 Aug 2023 19:44:34 +0000 (UTC)
Date: Tue, 1 Aug 2023 21:44:33 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230801214433.64c77f3a@windsurf>
In-Reply-To: <d2033d92-cb45-ccbf-b3f8-05e0fdbda360@gmx.at>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <d2033d92-cb45-ccbf-b3f8-05e0fdbda360@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690919080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjbQWWqctMediAI+tEXoN1pfwPKHpdMvUcCJ8Awzd+U=;
 b=h/VY0IMqud+K/DIpqJY9sJb5ps69WCtjw3wn5/Y2KUkAa6JX9EnFOOt9rb7AaPM/TAEC0+
 xueDVAnd4PsUunCiY5yfBGNHaDrr72/lwOYOrl4jy7whmUnLsO2MzsLP9vFCUdlkxg1jl7
 McTMbrSK3ToI9VUrIzcj305Dr7MLZGRpsOXvSoqU2SpdDsxtq8n54/JL7B/MUdbtwhBqG7
 LNH7xEY2nPYso23UVBDIRWiVBq0gdlq66DE8xMX5ghxq16PbLMChiMGrPXLS1Qtag/1DKG
 SZaVc6VeKzVs2KscDdwx4czV8oxhNJQhr1pJGUFIBm1gsxsxUDL3L1atsrr8KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h/VY0IMq
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Tue, 1 Aug 2023 16:44:12 +0200
Daniel Lang <dalang@gmx.at> wrote:

> I disabled all parts that would request information online during execution
> to get a more predictable timing information.

Sure.

> To be honest I didn't check if the CPE feed is deprecated as well.
> But looking at the feed's website (https://nvd.nist.gov/products/cpe) it
> seems like it will be retired as well in favor of running delta updates
> via an API (https://nvd.nist.gov/developers/products).
> 
> The "problem" is that NVD currently tracks 1M CPEs and the API returns
> 10k at a time.

Gah. I'm not sure this API thing is really a win compared to the good
old way of providing a database dump (JSON blob or anything similar).

> Saving them one by one into a file won't make much sense.
> Another idea is to put them in an array and save it as a big json file.
> When updating one has to make sure that entries are unique.

How do you know which ones to retrieve? You can request them by
timestamp or something, to ensure your local copy has all entries,
without having to redownload them all?

> I will send a separate patch once I have that part updated as well.

Awesome, thanks a lot for working on this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
