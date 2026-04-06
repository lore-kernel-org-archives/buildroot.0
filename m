Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EAFF46C71
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631DA806A8;
	Mon,  6 Apr 2026 18:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guyrKGOCWKxL; Mon,  6 Apr 2026 18:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB5080687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775500813;
	bh=MpbLtvZGkwIeZf7FEM9t2OqKXbp++WSesQH7Vpjk3JM=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WxrlxwXqcALF2Oj2hfaS3GYkYUU4bFoIk6NbdN1DQGleaWLpwoJY6nwAc1Zv8aUDH
	 p//q05WWSH8Pui68vaL/FGoemrCgTWuo/b4ah3l5svzQ11DfA0I9tVix3RZLWFimyy
	 kMEVAmWWlv7h57mtcwyi7U/r66jEYStLPD76g8xImYIIdNzmIxnNiPADKRVQFIQpMS
	 Rei0dDZ7ogdMeYTOh58Pq6aR/wbYysoo1V+eDfclHRVrcGhgv6sCeN3eB0TbgjxYrN
	 RnUOCfPPeyvSHLKNoTcJqGUih5Lmk+mnxC3z9c0UKUZTekKrQo/h9vHLQKzQJFoNIh
	 JngeseJBdACXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB5080687;
	Mon,  6 Apr 2026 18:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB2E92EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A11194058D
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXSBbJe1G669 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80D4940432
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80D4940432
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80D4940432
 for <buildroot@uclibc.org>; Mon,  6 Apr 2026 18:40:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1w9orn-0000Ff-JU
 for buildroot@uclibc.org; Mon, 06 Apr 2026 20:40:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 06 Apr 2026 20:39:49 +0200
Message-ID: <pan$7060f$23e99787$e312250a$d96db09d@ID-313208.user.individual.net>
References: <20260403191212.41297-1-bernd@kuhls.net>
 <9bd76f389facb56a8418edbee7d9fe8f__43245.0398498744$1775462663$gmane$org@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: bump version to 8.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

Am Mon, 06 Apr 2026 10:03:55 +0200 schrieb Julien Olivain via buildroot:

> I did not checked when those CVEs were introduced or if they are
> all applicable, but this should be mentioned in the commit log.
> It is likely this bump should be marked as a "security" one.

done:
https://patchwork.ozlabs.org/project/buildroot/patch/
20260406181810.1853090-1-bernd@kuhls.net/

> I believe your first motivation was to get rid of pcre (v1)
> dependency

Yes, sent the next batch of patches:
https://patchwork.ozlabs.org/project/buildroot/list/?series=498885

For Kodi and Freeswitch I am testing backported patches and will send them 
later.

Afaics the only package where I could not find pcre2 support is the 2.x 
branch of snort. Debian for example removed snort2 in 2024:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1079286

Since we have snort3 we should also remove snort 2.x.

@Sergio: You are the maintainer of the buildroot package. What do you 
think?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
