Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74BBE6E809
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 11:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9766241138;
	Tue,  3 Feb 2026 11:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1v_CI93gIfJ; Tue,  3 Feb 2026 11:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A731B40BA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770116868;
	bh=1Sdxvx/O8pmxvM9kLupt28CKD+rxKW3tL7qgx3ta0jU=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ieah1o/y8nvoKDpkIOwB8S8QX4AoVnnFEaL0Hz0F7OCpXwQLHJzPBUNnL5DbONYLa
	 1rJ13brFf8yUjC2KC7dWewryVHLH0Do8HYl1f/2QPXQqgCUmDS4ebTwXggs8+FigRb
	 2hSHa6XjDJlYn07k4RQUDFYu2aAeCDQp293yRvv1BY1K4boKR4nBAJP99AWq0g9/o8
	 stVe8UwcuIRXU4XeIwVcAXEETtVAZ7j1Fm5Mx63xag01SGhqS+waIesa+nM6t3InRt
	 C+aDngnjKpoAhN2ehk8nyNnnfvQg94BsAbLog6SarqFMAmQ0rbhE51oO+REgXqPOj9
	 sUWmrSBYy1xEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A731B40BA3;
	Tue,  3 Feb 2026 11:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD966F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B924405B9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFc7f2eqUL9b for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 11:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3EC84042D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EC84042D
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3EC84042D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:07:45 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id nEFyvZy7PP2aDnEFzv2EWQ; Tue, 03 Feb 2026 12:07:43 +0100
Message-ID: <d9205709-68c8-49a4-a4b9-98b19d62616b@benettiengineering.com>
Date: Tue, 3 Feb 2026 12:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20260104172232.3437646-1-giulio.benetti@benettiengineering.com>
 <aYHQjwF-IrYqiszL@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <aYHQjwF-IrYqiszL@windsurf>
X-CMAE-Envelope: MS4xfOfzUMZgOmdpRKqSU4jCdrEhvE18/26lvJSIUri1CUp0Dbjb16RMBo7oCanqhIrrSNEhYYVW6QvDUrSEaQyI2DvWDy/Ypu3z0RzcB97o/9JAZ3Rq5YB4
 QF1RILbhykxgK6WsfyAErKal9elVtQsYc+xK5Azq5ohuwIouLv0JEcYEOUZ2nLDm2d5+OH2oX4pA9/q75uz7Xb9t28Araky4UF2QQbDN62h7WDQIxyTAmd6V
 Ca++x2EM53M3go+8qlGTo2r+8YdweENFb/GWr+6QLRk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770116863; bh=G0ZE5DfCHGJsJaUXzirkcXos+s+cVSfYylpaQrkg48g=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PhEEpZ49hSSJdJpDeY06x6MoAbSgQAOfjHTLGjD4t7zieP4RH9zA3Z1vujIsyJbmv
 6UbWBh9dBdCfk4wg4lBrRELz7zt6fQEOcEu3XHFvw30x9JhmeZt2jERXS742fS7YPD
 dV7kNS0qRyOX5pJ+eQskhtX9G0Aa1IBs8DHneROc8l15vHXub58QVXyX9KcAsozKFP
 0bdLHAOXfhBsp2H+oR0Uv2h9kmP5YuVjECL72jD/0e9RDJ2zod9GgSsGHjg9SACLnp
 Y7rLbi1GSZPjKjwz3pz9k3UPTokWNrKZpZGT53du/VfPe/vBD2geGDiGjCIax0V9nZ
 fOge9hkZ/7tpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PhEEpZ49
Subject: Re: [Buildroot] [PATCH] package/bind: security bump version to
 9.20.17
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

On 2/3/26 11:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, Jan 04, 2026 at 06:22:25PM +0100, Giulio Benetti wrote:
>> Release notes:
>> https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/notes.html
>>
>> Changelog:
>> https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/changelog.html
>>
>> No new CVEs fixed compared to version 9.18.41.
> 
> I'm confused: your title says it's a security bump, but your commit
> message says there are "no new CVEs fixed compared to version 9.18.41"
> (which is the version that we have in Buildroot right now).
> 
> So is this a security bump, or not?

I've re-checked and found out that in version 9.20.17 CVEs [1][2] are
fixed, while in version 9.18.41 not. So this is a Security Bump and
commit log must contain at the end:

'Fixes CVE-2025-40775 & CVE-2025-40777.'

I've compared these twos:
https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/changelog.html
https://ftp.isc.org/isc/bind9/9.18.41/doc/arm/html/changelog.html

Just sent a V2.

[1]: https://kb.isc.org/docs/cve-2025-40777
[2]: https://kb.isc.org/docs/cve-2025-40775

Giulio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
