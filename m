Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C720606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NSQQ+Kdt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E6381134;
	Fri, 23 Oct 2026 07:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ej9jfYo3VCI; Fri, 23 Oct 2026 07:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D341680F47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740560;
	b=FZQflYGwDOowosc4mOx4A1po7PFXcTQiQW1mTh5Agd/hmgqIGMVwIU+HerUqjXN2anok
	 Ji8J9mZOTqhTiR3PCfvzh7A+duiw4WT9w1RAqZuHQIiQxxMRjSEShI2ls7lem8FHEgBPo
	 d1Qc0gP6f7t/mZsC+uBoEXtrsUmu5Y/HkpkYr7PBfiCCD1q0Vx7W+ltrqSBNpPOzF4Kqn
	 vaoOBesKXA+JjHW05LaY3oSksMtfGeKo9mT7yULeWel9hmoAHBnaOyvh0SH8xYUcH88HT
	 GPE3uy4Ar1Iss9OEUFYpvnVN9mirH/R7jQ0O445sqcsI5eRG1DN2OoTk7rcyBvgcr1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IK411oAh6cx5YUJB1382EUZZwax93ZFA8qoC/Tlc8TU=;
	b=ZTYgAXFqLqU6tNMN94kYGqbT+kin2YilSqIgIqJaZeFG3+zH2aPjZCOvcuKO/nEr7AKI
	 XPgsY0v2poLOMQtuJ991Q2agmwzpIBb2u8e6FnKlXhRmBK6UkPzdzxrErSHxI+gX/dgCS
	 i0X7MeVSGE7ra1HpBXtmoLJjozbK4cZ7AIaHP+YpBioIpZezTbTC0pq29WkOWDU238wYI
	 KFpKBaWq15YV3KbfDG99wP/z2xvgfSxAfHZkuc6Q6ikkvWmx31dNNIXgzjgEj41Y8zBAs
	 uRlCYekNFoI6efLngWctO9NKC+o8Dmg3BPG4JOBflayjheutPU3CIIS6HWaGWcFW4mw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740560;
	bh=IK411oAh6cx5YUJB1382EUZZwax93ZFA8qoC/Tlc8TU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NSQQ+Kdt4vEhsBjnRWCO1FLjVXgen9b4w7DKjkoFDMoRXUixYuHXk+sVXLEzE/lIN
	 o0Fj3IcXASkWP/tp52cPLf0V0G0UfHfT+JzBKsta265yxvDxaWr1jpmEDrI0GnC2Qs
	 zapcYD3pQ2SipsWZke6RPjVhNfics+4IxBEI4e1E61toIeLMBoUss6U9so02tfXteQ
	 DiCR9ZaGBLPllVShwlxSfZ66hFBsKweCF4DH3tq/FRvex/PtINscywtmIqRBZ1zVlQ
	 rnx8TWJ9m7GW4Wj0qQTUMA9mSLRmhqdUqFgMmPW+AGPmWSq4JTufbbsYmAGVRlbcQu
	 hllcI2mokIe1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D341680F47;
	Fri, 23 Oct 2026 07:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D321249D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C286064E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAeySjOinSzw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:29:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 30C696062B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740557;
 b=i+bSo5MSJEDY4ZuzxWOzgxvhaV+SbW/JWSdesQxMcNN/yvnymuICQsrXmUsLD4qaoOTy
 LX+h21QvGTW8rCxDlVSkH7iVJpGtJ2Elaz6dLklgvrY3+CALsme4ipVxMlx2sCg1qBsiE
 PqCsg8ZUL6PwZpunvzNsUetDbjA+C90gxfRTljsyXst8GeIrxkHGGbimYqJav+EY89aRq
 5CryMjhqeVfGdV0875qRjjHH/K55dhc9bSAx7gOgEZi9lPvsJG4BHl4cl02h+h1wmnewK
 EfovIN/OTxCxY3bNyK6d+a9wpEMKxjSDi37qU6ury+3g9KIm0bkFWnUsdqGgwxbvOXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740557;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=wYMd/eS0fldtCHPsoAkYlrSkfllnSrhn36epmCvEhfA=;
 b=cfe8S4v/L8mPC+KDz6zX36H4Osu1KytOFtWE8XFyF5OTuFZEA4lMo+MJf1ojcYC2q6AN
 hf8Ha6R4kWj3/gmYOdRb+DV+wamAHvgvJb6N9Vdag259yAML7pLyUvduvttMUSjp8nyss
 SVV40EQY5AvHD+6DUUTd1jawIo72NHnn0Pl2BzBjUPh7dqgjUAkcNkYpxeegBKVodRwZt
 Zb2syky9QNgmp2Nrq3QJRV2Fahgi6leAbS5Nf2/7jjzK9e6en4rIz6tIQ2RHPQO86/aTn
 I1XNvRJzgxVq3F0ivj4WopptAVOglsAmzb8BG4IPfElYp/NzTzfFwIOYhJgEVNlYaUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uisr77v9; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30C696062B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 97C0D4E412CD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 633FC60398;
 Fri, 23 Oct 2026 07:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE1CF10328F4D; 
 Fri, 23 Oct 2026 09:29:11 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:29:10 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Markus Mayer <markus.mayer@broadcom.com>, 
 buildroot <buildroot@buildroot.org>
Message-ID: <atsMtHazGzkiwaXR@windsurf>
References: <CAGt4E5sTu_c5K+j58Jx8NXGZccX8PQbyTTZJ3HKt6wktgjYHTw@mail.gmail.com>
 <69c73771-8203-4c26-9a6c-0f7a5940c519@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69c73771-8203-4c26-9a6c-0f7a5940c519@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] .mailmap file for Buildroot?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 12:46:23AM +0200, Fiona Klute via buildroot wrote:

> > I was recently faced with the misfortune that my long-standing e-mail
> > address dating back to 2012 (mmayer@broadcom.com) was discontinued and
> > no longer works. Of course, I can adjust my submissions going forward,
> > but existing patches are stuck with the old e-mail address, which can
> > be confusing, since messages sent to that address will bounce.
> > 
> > The Linux kernel has a .mailmap file for this purpose. This is a
> > standard feature supported by Git[1] that helps with remapping e-mail
> > addresses in situations just like this one. Would it make sense to
> > introduce this mechanism for Buildroot, as well? Surely my e-mail
> > address is neither the first nor the only one that has gone away over
> > the years without the person also disappearing. So my feeling is this
> > might be useful in general.
> > 
> > What are your thoughts?
> I don't see why not, it's not fundamentally different from updating a
> DEVELOPERS entry. Just send a patch with the mapping you need. :-)

Agreed, it makes sense to me as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
