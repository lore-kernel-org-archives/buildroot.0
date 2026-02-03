Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C14EE6E80C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 11:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C1D83529;
	Tue,  3 Feb 2026 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jF_m2MRrDIXi; Tue,  3 Feb 2026 11:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E489D83C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770116960;
	bh=cdxhN1MEZbsm9s+oXuRYc6mg9z1aHZDowMYh43xxU3U=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqJDsEGJLAI9cofJeBSypkaMcGOUXvnf2lLkA+2gCIw/e+oqykX4kD01ZH/1L6STV
	 jlD7NB6tcZl2WDRuBGo9Gv5T/QHQs1eCdfdw2/IXMRgSDxZFap6qpSb0Ls6ymSBTja
	 oiaZZHIlqAG+hKcHQTAH2AR7yryieBvcMYGA7trefkmrFs4oi9M2F4/604w4JNNDfh
	 cbAVCgPjGLTAABZx82Zt1SiGnBtbRMXFXEQn7nhstGNS5ifpI+HqSUVVSF8DvW9pfS
	 pEaCP6ELt18jSCO38F5e+e1nfAJ3lsSCYdNwx9ZKIreD7QDk2rYN4l3ENKoj+pObYG
	 nsgQoCQzH/zVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E489D83C47;
	Tue,  3 Feb 2026 11:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C86B0F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D1C40C70
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5-XewsHh3jb for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 11:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E50EF405B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50EF405B9
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E50EF405B9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:09:15 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id nEHRvZzcdP2aDnEHRv2FhW; Tue, 03 Feb 2026 12:09:13 +0100
Message-ID: <06124f2c-2b89-4d0a-9e5e-6596ac5e123c@benettiengineering.com>
Date: Tue, 3 Feb 2026 12:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20251227132148.704963-1-giulio.benetti@benettiengineering.com>
 <87zf5qmc8d.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87zf5qmc8d.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfGO26zL4NYi+YK2F5/tjYU8dOfwOziDgPaN2figdgUb7h5k/lnkxYDdXD7edjos3AOJgqFUarmy0/yi3VYo8XQt9TX+CQuof9o2f8b82a2UYlCyLVrAt
 6DBA/wxYi1MBHN3Sz0sHB/69Yu/pI4irtr3PdZweKaayEhMMy6lLTkJXhfWvTocUw4hHG86Bun33Y8/q+lzVM8wNqQOs2GvxpguGxhXo8AqWClnWcLAn0ma6
 Xw5RSE+Y/rD7/GIY/6a8aA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770116953; bh=KbREELagK7HXN+CnyHsyxhGxAVr1NxYzxx316mbYU3k=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gU1l/rgcolLq2g9Ypae2mBvcxge+ZVhkLO16E6bEpP/hTV84gJvRWh0bmFCJnKJCn
 vJHfnKkvcREEoesq89T9l5BVb9ob0bkA0mmc3rBTQha/z+ADWaVcfG3y9Iozm30sK5
 OJswwfmIUieObyUkWtNsbKOUntQHa+ObeNyfrqAw27jEUe5iPsDRC+K0ULSdY2P2wz
 N8d0DTb1+1Jn7Tk9wdWFejjgZReemkNrQKxGGVys4QJqVhR/ecy/ZttmpTaDIiM1j7
 O9tmy+ydldEnysaZSCfSu44W1oSDnkZ+Iuck3oeosRcKv4YYTxr6M38YYjcAMrN4Fb
 g13aOluksT7/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gU1l/rgc
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 2/3/26 10:02, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > For change log, see:
>   > https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=a768fcc0aafbe50a37d2d06bba23eb6671d3a9b3
> 
>   > NOTE: Tag v0.5.13.1 has not been emitted.
> 
> Could you report that upstream please?

I've sent an e-mail to their ML:
https://lore.kernel.org/dash/7c705a63-90a7-4437-8c75-24a117e66b1c@benettiengineering.com/T/#u

>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > ---
>   >  package/dash/dash.hash | 6 +++---
>   >  package/dash/dash.mk   | 2 +-
>   >  2 files changed, 4 insertions(+), 4 deletions(-)
> 
>   > diff --git a/package/dash/dash.hash b/package/dash/dash.hash
>   > index 4697d958a3..df0f6044bf 100644
>   > --- a/package/dash/dash.hash
>   > +++ b/package/dash/dash.hash
>   > @@ -1,7 +1,7 @@
>   > -# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
>   > +# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
>   >  # After checking pgp signature
>   >  # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
>   > -sha512  428de1f65ab77d5fee88bbf4ba8642d77abfda223a4ede423d09db9faa4f0347199b3be841d63b93a7ed68f714ef54ff41b2dc936e4b7ebb19b74499ed4e6a01  dash-0.5.13.tar.gz
>   > +sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d 260512 dash-0.5.13.1.tar.gz
> 
> That clearly does not work.

A bad copy and paste, thanks for fixing it.

-- 
Giulio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
