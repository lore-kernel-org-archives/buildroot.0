Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7B606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nm2yAxU+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=O5YqMYte
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D536B80C86;
	Tue, 27 Oct 2026 07:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eky4aqULCLNZ; Tue, 27 Oct 2026 07:03:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A165E80C53
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793084580;
	b=XzNtVuZfbCaY9zqxTFE4YJwlQIvEVWzoRG37gnig88nHesGjEFZ+A81lbowK6GcRcFCC
	 t1rJuyRspVeRAZ2L5MZJQwJN1QbfgrLKZEpYQWN9yzpGiYxqCNpYanm/UyrqjlXKFzpPX
	 8e5deCw+P61bTWY6ftkfpKcY3OaMolRvjkb1W4vHu/hSpbs/oJopM0+CLyHA1b0f59OdF
	 uoDUWlTU/uSfK1IyF2Eg43/dmHTLih/efTmeXMsYdUuIesQS2J8Tv7uceGzkKGA+n470Z
	 Lc0B4C/T15vVmBh1Kycjib+4BOrpEoC9mKa5DeEs0bWOmGjyi3VdxjXKu0uxUbQFs6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793084580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YHlftG76l48d3A/M4GmTreqZv5gy0kqJ12Yj8L3QX6w=;
	b=NBO/1LoErujNrRuC+uXyGt4ZaPQ5TzMbm+iddb6ua3vDqHLXfLsSOygQ1PG4L+HALikX
	 ADQQj2xonM2eSIOlbj9bHzPFa5oAxRqTkr6uUmNNInroVWbQZmhhviIR6B8v9ShK54ozz
	 97WCSfJ1TKS20oQcr8t+SO7Rxfgj6gVsLN7QhUAlGRLDzkseWPPmFS7lVSRbAguxKTFeE
	 CxohZWLvbPv/bP/lqTfG2VErvxHxZ22aR+Z7IwjGxNyo0pYjtdLM1ut0LfWc1+5fCMEfD
	 XCfXknBmwxycoKZy7FE6qGzwHIYxjYvQGXvrehmfZYyNeqtzbKMq6O1MalYjGDVTwgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793084580;
	bh=YHlftG76l48d3A/M4GmTreqZv5gy0kqJ12Yj8L3QX6w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nm2yAxU+08iZZPKl71/tmp9EJRdW54whTPVanIqDy/kbfvcaUTV5kip2Q9D8pjFjA
	 nXl26U0Louwbdhf65gHMf5EaP0fi6X3Xx3m8p5/bJPe3iBefLMDgaSz061//H67sC4
	 APcsj4AsNWrUQpkoyItKguqO0bhpvHeIeBnvdL1EQyqTNAUj8qCLpP2HjAwxA1q9Q8
	 8Za3gvHA9ZuCcZLfgFRJaHinjazssUp/7kE6JTq9LbSZ8wvZ7vVO69dlSIBrbEO58i
	 RZEuXKCCFuow+RJdD/1Qm13UKTpugDo1ay/8RaLbVaCxpR18Y0dsaIspJCkGLsqM6J
	 TgYULXpimGEKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A165E80C53;
	Tue, 27 Oct 2026 07:03:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62B02356
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49076400A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ1bKlMAM9ut for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 07:02:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 749E440062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793084578;
 b=jR9i13MY+yo/6fWHzqbzjqSLoDcD9DzGJg/KMWMqdBikqC6awaJugr5VI7WShUmwNYS6
 uh91hL7xpfiJvP6HFdS3Z8tBDUhsC+WXiCh1HSM4qxADcpWOhLMtB1T/g4STFMV/SIdpe
 kFpk+f6ruqABueLuxXQS9BBzQNl171OtSvw63zH9hMy1/xtz5AV8kUs8pRKkj/kTAqNlt
 jL/cwzRG+6Jgg6n4wJvFjQ9qGTB7a7kxruOnM6innF7QooP30Q/xCxa+mIJdlZTobCmuG
 cnW6krOC/yUx/TGlxzar6nmg/ZNR4SXbTPz3VrsNKQTGH6BtiGvMXYY6hkj+BL7Icuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793084578;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=qXjb3PaWO0FkkoMGRRhmFXQ7fpI9oBcPzhb62HFkw98=;
 b=DT1ff+L5dtmCQoMrab+dhpwaFVbkR3RXnxDU+RCorWD6PlxDgY3qtQnsH9eRiiz0Thnv
 64BWfVL3giW6oSQgiTEL1oZp0v4WXuYgXwqckXAVoyQOITHbNiNzVneUCNB8wtriowLDZ
 Lx1WB4HHMgVyWUlf685W7sBCEK2Vg0quv3XXZJuF3DxR/oJdwA2FmLIx5zJ5l4/KQ+Gld
 so6AEFkN0rqE+wVLQ26glmEcb0Pa1VBjU0v8s1j2jmfiGTi5UKHzTZ8S1jdeSefPLEkmB
 ms6SAnRX7Rt9tHaquWaHS7auDkQMN2GSTRP8kX75F5tZTjRFzkZ8nDHjaT3IWKnEQWg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=O5YqMYte; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=O5YqMYte
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 749E440062
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:02:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=O5YqMYteqC5T1JnUCxBgFPPfJZHGccRAR4MpEfMmUdrH6HQiwVkv0S/E8vSTfQK2vTeSYplBEOJLiXDHjE6svIswbP5Z7SVFqWsPVnDPfeJb+BqxpZ4fSve9RWyp80bHQkZ5z5VJwCI3GbRDWOf+Hc8G7TzoxloHQVDNc6oxJ/LSfe1lYd9dRzcux/lPmXcRloRfvPXmt6P1Kks7uol5z3oWeGULj3YWC8sCrfyQWGNHohMltUgwgB/yiSF2ioP56XrHz1u73D1XwkKi5d3r251boi+EiUxHnXwwwsLT7SEaQzZQjcxF4Dp+NrXkAWkPdWKG2zOsfwxyO3ybjSLB9w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=7sZRdcIZ2clEK0mlWwwg07KjkENQEBCKu+WcSavBvvc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -579460163; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Oct 2026 07:02:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLbCt-000000099Er-1oob;
 Tue, 27 Oct 2026 08:02:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org,  Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,  Arnout Vandecappelle
 <arnout@rnout.be>
In-Reply-To: <20261021205653.895333-1-paguilar@paguilar.org> (Pedro Aguilar's
 message of "Wed, 21 Oct 2026 22:56:53 +0200")
References: <20261021205653.895333-1-paguilar@paguilar.org>
Date: Tue, 27 Oct 2026 08:02:51 +0100
Message-ID: <87ik2nzkv8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: Use typing
 annotations needed for Python 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Pedro" == Pedro Aguilar <paguilar@paguilar.org> writes:

 > Python 3.8 and older evaluate list[str] at function-definition time,
 > but built-in generic annotations such as list[str], dict[str, int], and
 > tuple[str, ...] are only supported at runtime from Python 3.9

 > The generate-cyclonedx script uses these built-in generic annotations
 > that cause the following error when executed in a host with Python 3.8:

 > Traceback (most recent call last):
 >   File "../utils/generate-cyclonedx", line 222, in <module>
 >     def cyclonedx_patches(comp_ref: str, patch_list: list[str]):
 > TypeError: 'type' object is not subscriptable
 > make: *** [Makefile:23: _all] Error 141

 > This commit fixes this issue by replacing built-in generic annotations
 > with "typing" equivalents that work properly also with Python >=3.9

 > Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
