Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56F606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lZGlDv/g
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17CA6605E6;
	Tue, 27 Oct 2026 08:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlcEO4xk3XMo; Tue, 27 Oct 2026 08:15:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A9C86606B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793088910;
	b=jrNeFEWrW3h5CKjW32TBQ0LTAekgJNl/lXqKbl4y+iOzGe7fIHkZb+ID2toJr8ilON2z
	 NjkJaET0FP+Jemrj5UFm7bGTTcNfOQXYYTzvzW0dv1PvFRaukj5TdAj28CF3veO8z2xvw
	 To0K/sAXkqaDWHKUtFvgu6Tl/0u4teEm5TC/wtCP3n0ODsC5FVo4AjDrL1Jk1hEc+i2E8
	 TdpSV+tMH+sbbXnOKAJBJR8Y/TFW3uBSwsjTUkHHosBNbVGaahSY/pNN3Q33pC210wpch
	 sPUYkRxXpT7f+YXUlS5eW45HqYTXlpOfvsoz5ZnpdVAfxUeUesGqh5eW6/3TiLQuLOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793088910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RIaFpWORblvQFJTivfckUnfBybs4RlPAlNrcIxznv5g=;
	b=rJDgN6cbpbKijZZ2xAM10r/Jnp4tAF2yyG44T2eiGImPWqrfMgqewqjoMLZ5uYvwIwXa
	 vzn4CKjhTXhJnPG7KobiZDgyjWJqORzcWj/YtGsviw/2RJxUS0WWPK1KjR79AtLvyIxcd
	 ZrYLrPhjG846KKhq6P4NzlWN7NR9o/e/VdPdw+FQ0VAsfkQYeKxDgSelyvtE4OxH0rWIa
	 20SajdCcHhpS7OLiyaxvGcTCrMFWIfSpOSbKctIxLVge1xURXg0CSGSjH72OKHvEpUxZe
	 q+Hs3YPyTOciQomW4qSWPrVs4j+/pUM8j3LdZi7ga0x6GDfRe21vPQkBrcKAHNRUS1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793088910;
	bh=RIaFpWORblvQFJTivfckUnfBybs4RlPAlNrcIxznv5g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lZGlDv/gfbXx8GgR+w5gTfU4i821QFkc07ox+GLFo4kiHirr/iuTtZVdz1r/qs8SS
	 fnvOliXcEv4F0SwVM2Mpt4WNGD7d9LcZJSXQVWnQvlcgkNlFulDiM5zdvfu5PSy5Vj
	 NmJbf/Dz+GHF1q7dfzKSxjH46W14rxIePnJaNRsh+VYihk+MT/uvEqF8u7u+/P8d7v
	 seyllnqUbjwnjW8uPMaGrzrVygZaGZph8MQOQTP9/P8A8BQ6phAfn07o2vwPDtvkMo
	 Qg7aO5LJUSuoPMxnLdP7a9SSOfWdoFtCKYmNP/f3MRwdT0NHiBB4dljWPAsqK1Fgx8
	 kOyMd6pJ1mReg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C86606B3;
	Tue, 27 Oct 2026 08:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDB04BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11EA04025F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk9Jsy-5IUUc for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:15:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6EEAB40259
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793088907;
 b=WBke9YKvRLhMW6bUIXtDB08fwajJ/P7/k7ACipdUyRj4sJ1MVXKKuWToEYxBdJ9mmacN
 mKeMyX6FDFDEzCCubeMxStka8ovE47okITjAgdfazNeV5RW8aKdX0dzI9sklQtiTptzdN
 i7zSeJiUATIl5MrOxLxVlUDUH6UBQq9+mg11eb81i/wuzkMLmg/XrEPZz841Lho9A5jRZ
 FgGFlYuruOg2m3sUihsP1fLMAFQQ1ZlqhgHejtR+TFimZAobtk1DCLVUnyUVhjbeeNg4j
 b/LTXcXkmjLTVXn2pCyzh+yX6q64XFv8bUcdnENdBMvnCV009k19GjMM4ic2moFfAIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793088907;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=PCp9uTbMk4D6LW/24KXQy55kwp6CdIqEXWpGoJQg9zM=;
 b=T4saV1KlDERR71XW2ViCLjLFYI5knkia+up08S5ZO1h4I7IiMjuYrWlcumgartwp8FUq
 IR3mlvKLsMeTF08VG6dUddWL4RDrW1NG1adD3VAbtkENABfbwZheo4MxlwS+WUyykml9D
 K13TCwiKF7axoIgt1SlN2s9yorgkC7KRPkKlORRyzaL5VuHSDG+9qfwyfaIcquKprr43X
 67l/9JIFvA3trFFwz2yhI6jDCLXi/4Al5BUmF+7XCvnPcbFexeqKPY8M1vhXMvGtEmCXQ
 UwcnsySPEMJj6IWuVvO1vPKzlNoUe4R6xpeOfaCQ+BiknAcYKUidqZObl9fNqhcRMYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DQXnq8Sl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EEAB40259
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BDBF04E41331;
 Tue, 27 Oct 2026 08:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 894AA603BD;
 Tue, 27 Oct 2026 08:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D0E81032900F; Tue, 27 Oct 2026 09:15:02 +0100 (CET)
Date: Tue, 27 Oct 2026 09:15:01 +0100
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
Message-ID: <auBdSH403Z_zX2Vz@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
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

On Mon, Oct 26, 2026 at 09:45:35PM +0100, Alexander Sverdlin wrote:

> > Does it make sense to keep syslinux? Even Wikipedia says it's
> > "discontinued". Do you still use it?
> 
> I'll be fine having it downstream. I just thought, there is still an
> interest [1] in this update ;-)

If you're still using it, totally fine with me to continue to have it
in Buildroot.

> Sorry, yes, all the dropped are "already applied", I will mention this
> in the commit message if you'll have interest in it.

Perfect.


> > And not this one, that you are removing?
> 
> So the patch 24 has partially reverted the patch 7, the latter is already merged
> upstream, but in different form (22d32c15ea96
> "Update the longjump calls to fit the new declaration").
> 
> Ultimately, patch 7 doesn't apply, patch 24 doesn't apply because patch
> 7 doesn't apply, but even if they would both apply, the net result will
> be exactly what 6.04-pre2 has upstream. And it's not buildable against the
> buildroot gnuefi package.

Hum, I'm not entirely sure to follow, but if the result builds/works,
that's what matters.

Can you send an updated version with a slightly improved commit
message, and then we will be good to go?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
