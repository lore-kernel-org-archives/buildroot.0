Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EEC606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rPTJBbiW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF2C403B1;
	Wed, 21 Oct 2026 19:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOjA9uBjFAGG; Wed, 21 Oct 2026 19:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8FAD24030F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610623;
	b=gB0vd+QWu5zPyamvsdQJI7sFjoNTb88t74xY3AvQX+a/NGpAFvSS+w3533CGe2LMl5Zk
	 MWeR5quDHMAqquRM68cFrcHBVpJu8u5mD8vkp34XL1h168qAIXwy34dL5evjKyQDXSSaU
	 Guie7Iqf4DZfatlqHpAr3Q7AjOaLgzp+xbKiJecX2zwumeVdnvJvO4tUclyCuM6GK4CfT
	 nc2QJ/gDH/3z10HlS+7fciCmNtxgosWbju5Y+Sy4128EiP2CxVbcrcgGp5gXdHZPKrLbl
	 UDLkEuY9ldz1oHErMWr8JU+ePAHevZvhytSpmOiPpi4oOkHyxeQGGYoxvXnQ/JWLQmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FEzejzmkotIL4NeTYw80Nu+5UuR/5HKpi6joBujw4T0=;
	b=UK3PSoDJoEcw+6R4+eC96BChdE1UKXxiPxD/JgTbpuaJ563wMsM6r5xLwxLLLTC+yN4H
	 zQfsQsjW9kPj29NZZAX7+TJUJ2vLSj+C1rjXclsbp5mAsR03dr8zuhoVxc3ofVr30WvyY
	 lT/mSxEzRN/KiT5xKJJCPO24ZAKsxT2xcMJGXB5kMfEhl+INIOOzFUj1p+lbcqyx24wlE
	 4W5JhkIDuvmw6kDqSbsW3NV9HuzE84ZB4BFSP8Xb11monphT58Y+Jczu4aS+6LDNpGE00
	 UbA4Q0XBJgalOONpzq/J71DRX4j1YGsVOfpU294INnI0Eseg/oFnKtEcWU2lUyYbsmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610623;
	bh=FEzejzmkotIL4NeTYw80Nu+5UuR/5HKpi6joBujw4T0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rPTJBbiW2l/6J5SeErvUIZXaJq6xGfY6HO1eeh3WF08GAsxGFvkHW84M1pRH5JDhB
	 QFzq3cfHz90mxiRRSGC6+z2ai62LpszjkozZB1n6IXu58JjLQWlO/yExqvRYI8vkWL
	 WYAs3GnGOORKhleBOGb4gxpAyAZiv59VtEjc2WWJFFLfihR3SQjDaoovBtEOYWLwnY
	 lcCOS12XTyNI/s4T6p8iEXGyFBZwxSXyAO4Q5wFdRStLY/K7hJWPYnACk79EAaIAy+
	 5C8kg93UEOWACHEpFPNunT//25DwWwDAx2wnUww4zR1vYqPX3NCrblp9uT8H5ECnnB
	 R7vlBjIjykAcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAD24030F;
	Wed, 21 Oct 2026 19:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7E93C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CDAB60B7B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byhf7eXgaF_j for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5373061189
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610621;
 b=Fv138sQks17WW8ecj9jPwRsfgkV3EwFQsNSyLXelxFckdnawmqcB3Co4QJ5wo2+ke00P
 i1eNiwJeh1K4AcCBONk/VEavtoP+cZdifQIqtS0uT11vVI5mxiWKKg8kaOLY8pzn2HQjl
 MT68hUXBJGnatmz2AWEWSmj22sKOdjrtUedTi8xbqiFykk59IBIA6kHlLr8gHeslc2dEy
 Skzgladc5ifhELMmD4nXOljhIG6P3o8tVahMCo77+npBlZkeCgRrIOukuG6T56V7GycOn
 lXoBCbvwNAuiAIaRoivWWuZ5PXBmgaOsorNHZH0UG8C5xn3RzMoMt6Ql8/urloDbF0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610621;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vpIjdfExI5+QY31EqwOphRodKgC2n/21dRD1sOtiRas=;
 b=fnu8gPtJwL0xUIDg55zSyQYJ9N90w6XoUkegSFT5sjdZSrvLSSPG1qt7DlPbWFcDCe1A
 nUjhVRSjd0fZWDl1BbUZLf8MCZrTep7zWUcuJzlLqoIfBgxyb2lAoMmpd10PxaTIQhT1v
 OfcyHvg4/cY520vBzaZuz1ZRypadVQCQAdE6DlXz5UwJweElwol4oLNzgrU9MVYgc3JcB
 8ZQZhXwILwW6C7Z3tXcTd/0fTxhjvjkMqPPiI9uXZSOef3XXhKUO9e0h16aLOPJUGzgGj
 6WWFSQiyrQYKXy63hpFrSnw6ifFIJG98wm0lKp712UXhw7A0X5zgE9inaF8kh0a81vg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N3F7TizL; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5373061189
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:23:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 836D11A12B2;
 Wed, 21 Oct 2026 19:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D6F9606E3;
 Wed, 21 Oct 2026 19:23:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3DD5E103289F5; 
 Wed, 21 Oct 2026 21:23:33 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:23:32 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Mark Corbin <mark@dibsco.co.uk>
Message-ID: <atkRFa0olsjOBNX9@windsurf>
References: <20261020202639.1094960-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020202639.1094960-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:26:36PM +0200, Julien Olivain via buildroot wrote:
> The initial attempt to make secondary configurations to be selected
> less frequently by autobuilders is not working as expected. It was
> observed that the i686 architecture was selected most of the time,
> because it is currently the default choice. We revert this
> implementation to propose a new one.
> 
> This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I've applied PATCH 1, 2 and 3, which are obviously
non-controversial. I'm waiting for some consensus on PATCH 4/4.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
