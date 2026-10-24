Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9538E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YfVAEhTV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 740FB406C3;
	Sat, 24 Oct 2026 19:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wkjv-P3vJcEf; Sat, 24 Oct 2026 19:41:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E2A4406CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792870905;
	b=K6RjmzcovnNpONSNAuQWNsw3CXjaz6iDIFwnjbkQoMR+GLeX0rGlx77Df5labp14IibD
	 BYXD6e3ecuzHr6HkUg1phTK+6eDt4QUrqkf4K8azOQA11nhLOdmZ/fT6f9qQkaDD0qhjC
	 W+g0Ve0Hp1Dr2hANa0s0mH8CVt7905j+n0NObJVllg8EnaxGhbdHn3+F+U/HPzfOIZkdt
	 EITVGm+z47zoM3pL16mmzTutGfWDj+LKgGTtiCncnULsj+ZvDMKO7TBxkOIrNd5J604Zt
	 9Zqam5H8+PCfWBlB9vJ20PV3SRjjmJvCL8HJxx64rHt5KCxlsgEX2hwbVfKa4x3wGqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792870905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=aJf9MJwh8VpPfWeUOMG0EFKl47J5tC/o3zzUC2pm9sk=;
	b=B5xPY65ia7BRcRNhbSO/9nEctkdKeLg/FGvs9ODluGqzTB9Vhtr/ppYA+y9P4/YqAG98
	 lO4XBBrlnJ6dSrS1t+0Zp8jxKa1J22WvMQd13aYPh3Bu2v2qXFwWIfafBFB8q6TzMCcFc
	 06R7Sm1HqWOMocpTkXxGSKg4Q+DO67DTUklHF9gKIOIHXNO+oe5CSxTHQPP4Ta0x7kARJ
	 7wGA1/BmtAfpMQ3iFVFY43dB00muSVQO9HIQDvwVxKTAgLzkl1ojugAS2p+klgTP19SvW
	 z9gHfgnQZpA8JIGtkogzPdkfZjyXNzuLwBHFpjAk9VdOsOPTooSwPXERPCKqYe2Lcvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792870905;
	bh=aJf9MJwh8VpPfWeUOMG0EFKl47J5tC/o3zzUC2pm9sk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YfVAEhTVbBCogNYsW1yEZApkT1Wvc44cCRc3f/5FHU4RUlDUX1XtW3L/hoR3weXW7
	 j7SwKDyDf/seM3WOV6ybnG0flE8KRT+nV4S/3u3zII7Bc9IZ52rgjl85dEUimPOL59
	 WltqI28EMyh2GfVCxfguIHit8hfNgTAHxZBcarevHq/x9she6maOrPRoztRXn2rgF9
	 /NNN9G2VVZKp0IQEFJ6j79Yw/nXjTysA0P24KtIl6nDTO3bsjFGDgA0C6PPhJAtf2+
	 mTtmhcZaZ191urRNRbQrxSAB7ooMxpeXdVAoW+hKRaYjW0x16YXgGq/JuC+or7Vi3T
	 90N8CKFABfqDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E2A4406CD;
	Sat, 24 Oct 2026 19:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBCB4D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ECD9406CD
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VX7vd3czQ7H for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:41:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6AF72406C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792870903;
 b=TIY+CETl3M9PkmKCxMT12Ip9ygSYNIdGH2muIGCmUWQPmz9tzpsk+jzEa/qBb1orms2u
 09Vw8Yg8FrgcVl+72Mg85lq7OIpXa9Qg4+D0vuujkAB5ZBfl5UOWewSQ4/pm0q3UTK2JZ
 e3a3M3HThoc/5wdFax9WAblfnDR8iJQjTlQ/GuDewrZdhmaPddMGk10kDsMwNwdAAmfwf
 DeecgitSlWz2ugrQ3XBEaTczbsKmwUFfrI6Bo2Ol5KoP/LP7Gx3EszzHA6J08jGg2W7NA
 xNjtPQkUu1etbYbK3CFZxZanU7Z3HR3APgNwARHKEWet0Ewak3SkuXvutMsLYhmEkxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792870903;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=t9siSO2GujZAGAGiMxb97GmMqMbjPHmSH4q5HM5vI0E=;
 b=njEta8hVfUeYH0URcyQRzgMsB3fOSKpaVc+UBPPJZw1XX3GTuPt0lpxzONcMtUIBSvhL
 I4geLGp2PpIl7p/2mLrTuxdtz8tOiW86d0ygHk7UDl/AINPW0cIN3EpF0tAYGYiddkHff
 JZgAf+Z5zPgJiVnjTXvGd06YQgWdZfazhMjMro50kODKXhTNRZiASYUcJOJx1nXK1eLt7
 WJql8FN3yODbWZ2CSWflmGT5myvOM1TrSOaXzfPHLqORzd/vnxe1SjqrYCKj/ERyrJfvt
 QbRS28l2eWy0Mdw/I92yb23HQjqoFQjWzNIA7l7qk4C8kFRj/38NtMn2A8drbSFTGUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=W0Hw8RfX; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF72406C3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75E7AB97A652; Sat, 24 Oct 2026 21:41:40 +0200 (CEST)
Message-ID: <f01d7b59-7526-428a-b42a-f86f033ae1c1@rnout.be>
Date: Sat, 24 Oct 2026 21:41:38 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
References: <423a0c0b-a9e8-4ab2-909f-60fa4f0e030d@gmx.de>
 <20261012201542.87634-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20261012201542.87634-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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



On 12/10/2026 22:15, Thomas Perale via buildroot wrote:
> Hello,
> 
> In reply of:
>> For the "buildroot" component it makes sense if you squint a little, in the sense that it represents the overall build (like "world" in the make dependencies). For an external tree that just provides extra packages etc. it doesn't.
> 
>>> I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
>>> of your project. To have it work properly with all the packages available under it
>>> you need to add this dependsOn to all the packages similarly to what I described in
>>> my previous email:
>>>> https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png
>>>> I think this is the kind of view we would want to achieve to show the hierarchy
>>> of the project with externals ?
>>
>> That's a nice visualization, but at most tangentially related to what I want to achieve. Which is to record for each package that comes from an external tree a) that that's the case and b) which tree that is (plus the details about that tree, by reference). That information is only implied in the dependencies in your proposal (so, not obvious at all), when it needs to be explicit.
> 
> As a side note, it won't be the only place where the information is not obvious
> to retrieve with CycloneDX ...
> 
> Btw, nothing against adding the information in the properties like your
> proposal to make it indeed obvious but then this information would be hardly
> usable by any other tools.
> 
> If we declare the externals similarly to what you propose in this patch in
> 'metadata', I think finding which external provide a component is pretty
> similar to the action you need to conduct to find the vulnerabilities that
> affect a component.
> 
> I see that you can also use the "provides" property in "dependencies" instead
> of "dependsOn". I don't know how much it's supported though. I will try in
> DepTrack. Food for thought :-)
> 
> https://cyclonedx.org/docs/1.7/json/#dependencies_items_provides

  I think that provides is more for something like virtual packages. Like, 
systemd provides udev. I'm not sure how you're supposed to represent the udev 
component in the BOM then because it doesn't have a version or a provenance...

  Regards,
  Arnout

> 
>> If that dependency view is useful for you maybe we could do both, but I still think using the external tree as a sort of meta-package in dependencies is counter-intuitive, and I don't like introducing a messy data structure only because it's convenient for visualization.
> 
> It's not that I really need the view or anything. More that it give a
> representation that I find make sense to represent how things are organized.
> 
> Thanks for the exchange. I will try to test some things later in the week.
> I hope others in CC will have some opinion and ideas as well.
> 
> Best regards,
> PERALE Thomas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
