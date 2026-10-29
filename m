Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12DC606A324
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pqmTQVBB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA03F80E2C;
	Thu, 29 Oct 2026 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF4BTLoN1PD7; Thu, 29 Oct 2026 20:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4501180E37
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305825;
	b=qPqseHzF9Ztk/pJXVXbVqLrlKHaKprgEilLl64nHHGoVfjOU22hbpSuchxVJNkKgZh7I
	 kYykyV6mw4RFM2dovLIfZ0dyIcCDHTsjX/rZObsaJ02JkXRv1Oe6W0yZkdSO3A52eE7w9
	 nIiAP6o3jHx2OIJX+uX7NExVLwDXZ2GqJljY5mkwiNju9qY1vrf8e4Xq8ltGmP6u/YKqP
	 E8tSPzSNxlLxdHHNkpMBfY22U/dcVaLSa/Br8RZfp7H/EHsclEjhFw/Y1FRwKyLigAeZI
	 mktxeZBtGiVUjUHJcQGIr0OomSsRk9jgdlnIIyUq1wrh2CinGanMJe9biJ708uOp/kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rgx0UC4HL0+h8ij11AeEl389FEIChYIe71XhpeQvsac=;
	b=IW4JkLF87az2S6TTfDPxkpnnYFpA7sqYFQbhtPt+avOzXRw6Kg3gqN2SbI04Ek+6oFsS
	 TBjTgD9duR4mnwcWjP9RisV4YgIgu+oAdCua7BPX8tEMQpQtu3hngjCSOrDZPPOG6a5sT
	 E6sg76GMg79d/4PD4KrBpZf5jZmdlOZpno3yi5wY9CWP4gUA3/CCtCCcekFK3iuMB4RhP
	 TkdCZ0NSyuTqLceTP6cmhmfw+a/BrjjyY61npxCbVPBmq+8WCV1GIRC1oX5njqH6/YPs4
	 sUKVu9oUpfLuRz9nroHyqMCBDSnO1FuCKBu7a+1AE7rh7mdTS0lwoWwuevrQRIS8usw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305825;
	bh=Rgx0UC4HL0+h8ij11AeEl389FEIChYIe71XhpeQvsac=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pqmTQVBBmpQPmFJUCY/VkMmpnsz3H7IQGpBpRMJwpSmzXtF6TqBm989D+NJbhRtpQ
	 Fd/IDxnsbvKcJG8nBb7wmMOi4bR8ZoAw7ss9sllcyPRU/dIYkLD+xNkD5ZsE1y7oW2
	 FM+TmhVpTfx4Wj8qEOpcaZS+ApLD9YQv0CZkhG/4Scus6HvUCy36FfLc+rqkxA+LL+
	 CyFgQHlUeE8MNuQb8hx80XxBXcF4GgZ0iIs4ZSb1ZebLfY0PF1I2B0waxKvbmpGdwV
	 2hPMbmB6iwsXZzXmUP9HkVNXdpMaX49M+SLIEwCqg5HW3pLSwQxlE7bkBlBnydXnOJ
	 6BOJeO1D6QIvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4501180E37;
	Thu, 29 Oct 2026 20:30:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B3A4334
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615C44062B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMLk8iqkqttC for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2F824061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305823;
 b=eQFsySW3CdQRYRDaW2fHPBqcqnU9Vz6wZoeyUGoUzXW1ZmEB4seQoskLwn2JPgQyaHk9
 iWumznfc9aBiTyIw+pKcUALl9hRJqs1dxA9yRhtuDXqSqnubM5SrctIQ+FY8L6tTOraVj
 qMiomukRd7e7wBUbRws0RMDWqk4gMBJ2IYq74556Tl6+h81y5p2+3edHLZq4/BsnSt6vj
 N4bitDA0pjKwYrZPPYedUEY4Lt4QfhGtumIhrWtdJXHkEuH2Z0NYt54Vfzi8gpkMOMIBK
 iMfzXZki7NOfg80BmcNBGCtt3jUYFXOYx4gyyE2lksPmankVkun2S7SbcB8lXxLtYgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305823;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Y5Ox6gINSjcuZNDUFqrT629d0S3YUHUenbhyHpWVQ4g=;
 b=sVA+BmWaHPWnoM0urgodvmNVHfg4Q3s5nTxzuvXzI5MlnVSKzM7vAhvsrnNOtWTxDcfi
 mXkWw8cbB6rsBGyLMHBpxqFTJdl6xwq8ayH1EqErX4euKl2OdsQXJAwyPPsUOs4soNmap
 okdRXmFYeQvoqNSHDjuNAoK/NbqYsbBqA5ZCKO7MyBe0hNt7S389ynaOx0XmKSKvuozw5
 oZ34MjMq6olOdFlVVYqJCtytM8IZGyFRHjZZ8rcAcqsvpbBmDor/tipHLraw9SNt3Da8D
 i5tbaL+0C5nh9W88RRNWyGoZdNQsmx87Nhw5yC6M6iQX/dxxxP596rO42NMLCwRAgZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Dxpq0SUP; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2F824061F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:30:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 58D8DC4F762;
 Thu, 29 Oct 2026 20:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CBA096076A;
 Thu, 29 Oct 2026 20:30:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88A411032909B; Thu, 29 Oct 2026 21:30:14 +0100 (CET)
Date: Thu, 29 Oct 2026 21:30:13 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
Message-ID: <auOsS9x90TIovctY@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
 <auBeTP2NwmLiaDGR@windsurf>
 <ec78e4b982b6b8b0a3ccc04fc9b70ca5@umbiko.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec78e4b982b6b8b0a3ccc04fc9b70ca5@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
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
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 04:48:51AM +0000, Andreas Ziegler wrote:
> On 2026-10-27 08:19, Thomas Petazzoni wrote:
> > On Tue, Oct 27, 2026 at 04:54:45AM +0000, Andreas Ziegler wrote:
> > 
> > > Yes, there is still interest in this software, and I sadly mourn the
> > > absence
> > > of the don't-delete-host-syslinux patch.
> > 
> > Not sure to understand this one. Could you clarify? Is Alexander's
> > patch dropping some feature that exists today in boot/syslinux/ and
> > that is important for you?
> 
> The v1 of this patch was a series, which contained one additional patch: https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/
> . This unfortunately did not meet the upstream requirement. This change
> would make a messy (and dangerous) installation of syslinux on the build
> machine obsolete.

Which change? Your proposed change at
https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/
? Sorry, I'm still not following you. Could you perhaps bring a bit
more context?

> Last time I did low-level C and assembler programming was during university,
> which is now more than 30 years in the past -- but if it helps keeping
> syslinux active, why not.

All we care is about keeping syslinux active: reacting to build
issues, to new upstream releases, to patches being submitted against
syslinux in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
