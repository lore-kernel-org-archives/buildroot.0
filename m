Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B273606A320
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FpaWGMdO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5251D6064E;
	Fri, 23 Oct 2026 07:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyxOS571Te-x; Fri, 23 Oct 2026 07:38:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7962060650
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792741118;
	b=N7UyaF0b5HOJOBQavc3kZyYWRV+Y89SxP/JubI5CyXz6CxmEnvZC7aAFhlVVEzXvSjlo
	 FM+ESHyFY/11zQtsUn1RPGqFs/Rw/bxM/z/r+/r4axyo1g/4gUlri0tWslu2gatpr3JfR
	 o8R928iorSfUowa0OBn8cLaZM9qwMQGOMRwBiP8jmBxMLCMxnGvNtFRj7wkkFgLH4gSeq
	 z7fio/ku4kzkfrGSHo+OmVxc9Y56qh5sSPmrdBMnrMmBWedsQrd4P/fqDx6ZfwIVAFPt1
	 +SxCJZcvw/yrM97J0gF9TOPNO/DwW0W9FcIq+OPbmhKfbreyNmjYRkHMw1hkPgybTPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792741118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nutd59RseHCXnYKlz5eNJGVbRvWg0xq34VpTTk39ZIQ=;
	b=kwdBJpfEKZIWdObDeQ+b9tzuhfeDKadUJ9w2RZCYbR4VUbdkGDArSkIfoFyXhntgFHfk
	 hL9s3AUAAzefMyDZ7+Nk9w4dkGSqtuYD3QSiOufPmESx0LTXa/sCXVoLvKMtVqvokY34A
	 sRUeYumEXYz9qeNgochyjkkJVACHdko4/mrNzYw1XU9td02oAZPaUyUZ0Q4QRkJ7z4qoM
	 s1dncatn2uf9XX3sKlu80EznW5VhFCT2ggRfigoCLdP24vf8Kt0nTEhVqva0ZJBTwwsCf
	 W4Qvw80O6sZMKSSuAQ9JyPczp2zLH83pQgJtCK7RWsTJLvvJowqfgWIvZbNw8FJJZVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792741118;
	bh=nutd59RseHCXnYKlz5eNJGVbRvWg0xq34VpTTk39ZIQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=FpaWGMdOgHY7pgVsAQWx+UsCzysv4KjP6kVn43Itypp8bhT7fu5gI1YnQNa6ICZ1x
	 Xq6NbNrPjzxDV6IpnDjW2GcrmXsyo3c3nr2/bYGRB9XmP5FpwQIh7J1RwQFz0C02s7
	 B8BbqiT6Pl9WZ/hWft+sTkh+Si1m20SoMAHRnseyE9bdwZ4ZffecAu3jkfrjQeeusk
	 hR1Co1hlDsPl69dxNxE0GwVNyPI9gfQKrPwtvCAxZLD6i7xbSL6LAgHKQtyozbyLQl
	 mXBZVsvwjYjP3amicmMO5xk3aQB8REuWEg3MUs+8+BCWgIKVO5wWl2MBiatA8pbmE9
	 ToRYjutCVs2vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7962060650;
	Fri, 23 Oct 2026 07:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B49649D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 689C680D2D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFf-oRUyPNKL for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:38:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6985F810BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792741116;
 b=SvwOhdaf4A5Vo3eUko6LmixgEazc3aNJz9QZ6QuQYzM9YSotU+JE5+f43D4ibIJ4wjwv
 Y4bV4+vC/BdWUidj5amd+H1GUQ56XWCxbc7YZm4sH8hmSJV1zDKlC2Ssp+UgFiTAsR5q4
 DCu3w1FP2jrckbo+llhIThWJpA/dE5BXfjmoO0jgRxRVJlRvEeBe5NnDwI1SAIWg0Qy+V
 CVRkxk4nIDX3Q0f5ZF48QDpR9mOYyZU4sJaDz6oYrVQP7cacvJpP5MJuZ/DXGi1lIMSgg
 rnul5RoVJgnVClhR59T+GvSYiwy1N+qnhwQKh/tIyGfVEDvxkxLtx2ToWeYjVKLLdWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792741116;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=CTe+TO70m3NsOnt/mBAKELzCiseNebKc+XdhpZNFeIA=;
 b=kukwZ6+YvDZBVopBCiTsIiXilnu2N3T5f1skadY2mx0EQiUCp+gtXsstSZP3biU9Jyqw
 INDiFXjsNvz8OUoPjMnQuzmZPwMFxlNcw2L6LYYg1VlTUT+xMtlwqZmCE3gRbhqvbeNIZ
 Db2jGb027ZqhbnozySnvyxHHDSmhrj6W/2wdXKF1QZjBc7K7+Fn8m0oEot1jqGs9m3A1C
 6BpPTvw4mzuPODfOsG7WDa/ydYxXjWVZRUWJXemqQGIOKPpBZbS5cK+WqQhHws2RYntu7
 BPvre2XUW0G+Pu6uMzwLFhXbCRfvN6uLthsk2795Qm7TAKi/tWJ8RR3TERFk17FdOoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="voLiO/mc"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6985F810BA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:38:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7F9A61A1274
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:38:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5459F60398
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:38:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB5DF10328EBA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:38:33 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:38:33 +0200
To: Buildroot List <buildroot@buildroot.org>
Message-ID: <atsOr7voZR_wkANg@windsurf>
References: <20261011074658.1888569-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011074658.1888569-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/pkg-autotools.mk: further refine
 libtool 2.6 patching
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 11, 2026 at 09:46:58AM +0200, Thomas Petazzoni via buildroot wrote:
> 5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk:
> also handle libtool 2.6.x") added some patching logic for libtool
> 2.6.x, in order to fix a build issue in cryptsetup, which uses libtool
> 2.6.2.
> 
> However, the change in this commit applied the newly added libtool
> patch to all 2.6.x libtool versions.. which broke libmodbus that uses
> libtool 2.6.0, and unfortunately the ltmain.sh in libtool 2.6.0 and
> 2.6.2 is sufficiently different that the same patch doesn't apply to
> both.
> 
> So we:
> 
> 1. Rename buildroot-libtool-v2.6.patch to buildroot-libtool-v2.6.2.patch
> 
> 2. Introduce a buildroot-libtool-v2.6.0.patch
> 
> 3. Update the logic in pkg-autotools.mk to apply
>    buildroot-libtool-v2.6.0.patch to libtool 2.6.0 and 2.6.1, and
>    buildroot-libtool-v2.6.2.patch to libtool 2.6.2 and later. Note that
>    we didn't test with libtool 2.6.1 as we didn't identify a package
>    using this libtool version: we for now assume that it will be like
>    2.6.0, and will fix later if needed.
> 
> Fixes: https://autobuild.buildroot.net/results/3faf9e6889cbe33019141450a95023c730a6d03c/
> Fixes: 5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk: also handle libtool 2.6.x")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I took the freedom of applying my own patch, because just yesterday we
had 23 build failures of libmodbus because of this, and I believe the
patch was quite obvious.

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
