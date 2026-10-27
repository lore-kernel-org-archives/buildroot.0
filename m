Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F9606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CcD1BOww
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503DE60729;
	Tue, 27 Oct 2026 08:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 760jLmT21-m8; Tue, 27 Oct 2026 08:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 648E760712
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793088877;
	b=IkGe21XEE5zIUYnYpLg8iKSLu6ThVaxMwixDj0bnBTLzrLXkXj5NSzFH8ViiPT/JdArZ
	 ziEYZfgotInuh9ZW3PaX1GKDQNLCocDq7jVxsozn/JvySm5EUk3aujwjA/3fIeVXRY9e5
	 1QiZvVApecp8abe7JU+OsUfjQ97BfvHd88BRqE47El7Vsus9BXsQ+df2m6v9suD5DQMvZ
	 y7E06hBOZ05xVyXIRJjYbJhrClVknC0v8Uw2VZJs1VlvTOP6384SIGO0m6MdK7bQN9YGH
	 CxmpXH0Fm/izuDitZlyWqeWJYgg9inBnC3JTIChRQPIBbxGprPElpSeo3jnLYiKlkUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793088877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=zDHC1ZwMNezRp/C38wrybhN2iQHIM/ZbZNzhYQjU3vk=;
	b=qPPtPcqXNRIHRfCk3d4aPqB9Ay/QNOXIpxfF0mXYGayKrEUy6Dv64TvIXJhxDLQPmAha
	 QKHI2+z3jGdcharGO6ADOcBbaftQ0gq0AfxnCJVJ/og9Mr8T8BPhuFtpwC1hZlZltsc4p
	 uyrIdSpEOZEtfzd0jeTT2wZXVGfZE948ptlv5mFZQTFh0sLHdGujqZTIu4ztnXFgB/jFm
	 rOjriERaRB5w5ILpMXSmeQUe6c2t2JdRTpv5YoG5Vb9slrfTuFEfa4MirbobkZGIzgYsb
	 JOSI39sTMIV1kDHCBZvY+qwPDImonirBthBTz2TTzuepeBxd2s33FZsg8ibeZJRe/uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793088877;
	bh=zDHC1ZwMNezRp/C38wrybhN2iQHIM/ZbZNzhYQjU3vk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CcD1BOww8e3h6N6rfe/qqaR6btgZO0QyLZc1hdw9+K9CDn8tr1JdORcarj+e4oeCG
	 Sbpm3FRjR+/L6Wiqu9d8xWLyfjRwytRVuOz7G93vsfScm8A+TEvUPFetMTLH6fyFAc
	 GxKIALvdIRC33jknS1BVOfSTYPM3/vxjPQBzmWY/8BIQ1M7tjO2zACr95J+9Dhdg4c
	 Hm2t1R5nsMD1xfIDMMN8LkYV5QAgcL3gpmlECNNyo+2VVczs/d5R6pF2LOWttm/KSJ
	 ZMEPXXUftTKx1Lcw+h+ihx40YtJwvfP1L90eDd5EDOgeALVR927a9G00t4b+0cn7jk
	 vgeLX3GfOIGWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 648E760712;
	Tue, 27 Oct 2026 08:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8CA4D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1179880944
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoIIZjOiCS7d for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:14:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3768680863
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793088875;
 b=MhTrnwGBFhHmnKEsLHvMHCb+VRHb/RJoWZu+e2V1SaLOT11M/Xr34UA1uW4e8c0hm9SU
 OSnSwvZC1rkLllxTP7jo4yHqcB2Ay+Czq4Y2c1PV7H18hHDjpuP8a5Kaq3IxVa7Vj+T+L
 cvqjMvSyLKABOnMsLo8HQbaZiSc07cSmKm8ZoMSYF7tb2tc5ffIndVvCJFKoQZWKEjUdb
 9Sh8vP26J5VloN6uBwwWu5RJLsLN6A2Lu8fb397UBjrnyaJ3V+W3+58ySVttfUVQj5Gys
 UD/PoYD4bxvKPHYvY+cnyvKZIomzC00szCo9dAg0I3Y1pzHKZnCIT0TqrKAzqHk/dxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793088875;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=sCLwO8fiDC7wC58FN+Nk2a8W9yqDzDAHqIib65a4tZc=;
 b=j68eDLMR4GhGHlRY94I5qzew3OxSQxfbWxpLCeS7y7E3jCTTKkW+SKyd+JnTfavof3/z
 ob/3vhCpiFA9ceee3N/A+ROh5uhg1mi4vd+laasZ2BUUnkBTer2WVnyJgzVlGdMtK0MtM
 liR9EeGjsMWwYP9VRVvlple0usy5ibY560+LtQ+x00f1pbr9Qwe2PZTifa1eb9Ej6xk+U
 mFc+qT6g2mWAO4k3gNdD5vI6ge8SCanYa7N24JkU3NugLBD7aw+9IqomhvrO+2o0cRsTB
 UKELF4ExyLYY3IxpmsBJbWuIXfKTxttwLGMj1pY3VKqdM9DSkHObq/6u0WN3igaZDGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=hBrESVlm; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3768680863
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9920B97A38F; Tue, 27 Oct 2026 09:14:29 +0100 (CET)
Message-ID: <b8668097-6cd6-49b9-befd-c0ae3f99514f@rnout.be>
Date: Tue, 27 Oct 2026 09:14:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jezz@sysmic.org>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26/10/2026 22:49, Florian Fainelli wrote:
> On 10/24/26 13:44, Thomas Petazzoni wrote:
>> Hello Florian,
>>
[snip]>> If we were to merge something like this, we would need to switch to
>> out-of-tree build completely, not just for the specific
>> <pkg>_OVERRIDE_SRCDIR situation.
> 
> I wonder if this makes sense however, not arguing about it, but trying to think 
> whether it brings anything?

  Testability. In its current form, this feature is not going to get tested at 
all other than in a runtime test. For linux that's fine, but if we're going to 
do the same for more packages, then we don't want a runtime test for all of them.

  Also if it's always done then we have the possibility to share the source 
between the host and target build. Not a super big deal.

  That said, neither of these reasons is very strong I think. So if it makes 
things simpler to do it only for the OVERRIDE_SRCDIR case, it's fine. But I 
actually expect that doing it only for the OVERRIDE_SRCDIR case makes things 
slightly more complex instead.

  BTW, the original idea was to always have a separate source and build 
directory (where the source would be under output/source and the build remains 
under output/build). For the (hopefully few) packages that _don't_ support 
out-of-tree build, we'd rsync from source to build.


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
