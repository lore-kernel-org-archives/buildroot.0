Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE803CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B057812AC;
	Sat,  3 Oct 2026 12:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po-Uge5nITau; Sat,  3 Oct 2026 12:36:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A08D681248
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030965;
	b=AD2DC3NA5ct/lgYDluJuZGK3mQJP5DU41VXdu3YowavVD+3y9K7jcKwid/T5a1qp4mHh
	 1Z1s+voLipFJfHvUji97QK5yENp4qVuFix7IIc4vOzkbQG3xjyraSDZOeurjY5ktVBS1y
	 x+vMM0Cz/fu2DDOdlaJuO00AMKx9ULIOJiN+wKNA5nIE1ZRWyvCYDcVVf4dtSYJV6Ib1q
	 ZQJ4o2C8eUgOV30sEk957TMwElnDi+hKFVtKQfF7chTB4tWuSHAjOM4KyTJziQGALFnhs
	 0fHW18q1ye5yXdrTqR6oq9XFq1WuCV/4XF6MEUznN1faVMOczf0ZFf/gq1pz7cStoQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UfaTnWTZx4ItlWTiiGjQkpanG7lQOko5ctfnkd/xfI0=;
	b=HnHKO5g0dcFrcIkk7eMbAeML576RwpAwu0iucuISL3fhWcR4uEN6GyjuTr+CnCol3SlR
	 vZVGFac/iUvQu43aYhCT+Jp5wG6sF3Kna+Tk1VsglJ5VlTwy7mWeSn86P0ZlCySb7edkj
	 OITLueg1RFj75C9nYwVstP7Ytf2Y/lAqzn0cfwkeJ5gDUVhXV6xlmQs2cDO6yvTFYms6c
	 +CVKotvS1DsfIOuvMhbc0FrFCG+dtwFJM/BhHMFonfU7ZyWfbY0bNKlYUwdFhwgkMsZO3
	 kQXHa0ucyvAOJpGJH8ZikZHPQjLm0azev8fcpTQ/5n1enBb9etKpBTrTZvb1Y2Ln/wQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030965;
	bh=UfaTnWTZx4ItlWTiiGjQkpanG7lQOko5ctfnkd/xfI0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sDgAaIWtPdVYTfZBSpBhEqrjhWgLnbyYDFtUKEz3v+sZwCqIsbao8ePzTPSOx0dyL
	 kRqlg94Q7crc+giGTzIdCnhdkaTe4PP+WhQHA4KpN77qygWnnKTP16rG81ZeVa3h6V
	 cmftLDC3KvMMUQyts5sDKs68MVsB181HleNtmcU4rmq+vEwblZE6g27GLXjkL/o54r
	 TreQ086Eof7vbdzNlWgNHhK6a2aYzyEyCRJVViEDeSmfVmWG+fsEN46KK+JX/GKVMh
	 6ntKh7R17KQvRKzGfVJrTwLisoMLKbKgnYmM03xlr3D14oH6sjNch18LxCvzIDZFMo
	 V9eFFGL3GSZ1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08D681248;
	Sat,  3 Oct 2026 12:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC282E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5191681248
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 484vy5cqZFfU for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7136080F7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030963;
 b=WvFD8QpQsboZQmJKpvmn6MV1xwzQyBeBp0pVVIGZZk0ma+3u9kT3UznSksjLnkAkt/80
 kudxcpUGKPXDXBN07w3IDrmjT+VzlPCnAhbQCwCp6epOqpcj6fU+Fh/LrNJdsjyvgDbnt
 4gf1b2xNX1KkdePS/gZLkhsIAvz7he3ZEs5E0UYzC9VH2ptjA0TDLI2FyUM4ttfvAMsTY
 p0D894EknVMiGPCUh1Z956qFc1OBlByo8yv7yL7peNWSvov3ccfs7wTbcS7bYXtXbwRVB
 RzLgdSpPFv48lwW9tdITYmlTyGtnZoG4SdrZKoCcR+rnpwHxcT1YViSDOsy+Zw4qTwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030963;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iIO7CyiTrZacJjk2asPBk6KW9sKcb5Ut7MdSYi3bOmQ=;
 b=R7OjXzg0NlPSlX6cnwqhn5yFRZz8/A1Okq2X34qDD2vg8UtMfrHV30r6/ugUMX+qrVOE
 xjrGzI1Ead7NqwLFrfiF3NOzcjtXVHwZLUDGVPXt/zFcTAx7d/PUZm8/WdFzKNuslBhn5
 joDAZDYm3/awKhIjMo6bfr5tMJd0WXJALTl8ESHxAIZCTEzQivscBn4FpErAjPV8PRVwg
 1RSXhZznBWsBybjLYFWf8lqplPnajtx3F38xq8RHeV9g6mDO3SfglLs2DFInSHgqiCLvO
 aNTTePF8Z0Tb8ibCh0YkyCxCb05If00C3tF2zdPA6i9mGbmLcdt9g2Gnm5NvgsoliSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AMsl23UP; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7136080F7A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9EEAA4E41129
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 699346074E;
 Sat,  3 Oct 2026 12:36:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 091AD103283A3; 
 Sat,  3 Oct 2026 14:35:59 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
Message-ID: <asD2qyrdXQfWi3bU@windsurf>
References: <20261003084453.545653-13-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-13-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 9.17.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 02:43:58AM -0600, James Hilliard wrote:
> Update license hash due to whitespace cleanup:
> https://github.com/ipython/ipython/commit/97d75a9a25acabdd463e279fcc0d32fd8711e311
> 
> Add the python-psutil runtime dependency.
> 
> Drop the no longer required python-decorator runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
