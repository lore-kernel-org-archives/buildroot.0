Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85676606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LOa8qr8w;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=fvltzYj9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EDCA40937;
	Fri, 23 Oct 2026 10:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqqNNIi-BD7w; Fri, 23 Oct 2026 10:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C79940927
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792750515;
	b=XYwogPO1rBUhPIU6VGjz+bL/MywsOJ2cc4HfrycuQ0Fu/VbrSACCqMd7D/i9XmK2p+eF
	 0dURCLlpqmwnuh3mjtUcr1YelCD0U4wn0jtDrS3BwJP0LIWbNZE3+7vudmV4BdL4G6V4k
	 INdD3Pc96asgS5W8JvyestqTOFs6pUq/j9xYda49uF4+cTNL8t7YgZNpwB7F3yhYiGzyi
	 wQeLM4F0h8KC6/8wrtzsa8rGAUUR4bEfmd12ms0Z8rxuwa0LPV+TREcRGIUINOtW5tg8d
	 tjH2ZzfxIARd2WcGBcVb6o5O0N7D6HE19nIwS7Nfdnqahm2GFSFRAAG5PdwOPP6uphA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K+2KVVRINwiZPIvgK8qo9P6e2tU0oI6qpZWsc4zIyYg=;
	b=dSFSemfAHratf0nodY/3Re45rwTJk3iiqkcY5JP0qCk4WmaasjTE40YwW0aaVuAwtqli
	 RwUTvetEmsOsSGwQzByQ9cqChDGPeFmz0xrDekcBZFPftjlVxG0No/24sPk2bf2rEKWG7
	 uJYB+p9qM1HHIeDqa3bsaGQVgOjzx1yBhLgs6yEXnTaXhEXgpZqFeDIw6HCORo6Pqzp0L
	 p+Alx5QHr6mV6mPlcGWe16PcyBA+DTuhTBKa1wfCj+ViJc8oWuHPW6fCygXVUxc8zBYdJ
	 B3JkoVtfZ+8Vh436uaBURUhU5kY7UHntyCAYf0uWSz8wrYUS9ish6hVikJ15LbebHnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792750515;
	bh=K+2KVVRINwiZPIvgK8qo9P6e2tU0oI6qpZWsc4zIyYg=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LOa8qr8wnNZ1OaeRPbmLWNoDWCwKsgO+TZl+wFyo5dNfGjqUCeveEEI5h8fEaDxzp
	 Opgv6BjYJ8fK09ObGYmdnJG7FY+ktseun1JxaJPVzzLbSUqR6BXgyyFoub/U/AUJvm
	 K0jteJwomaawt4ZoAxAntLLVr+XQsEov1xq4/eZJgQB1F5Ogki6dqlutGxQlQ/n0c0
	 8MRWagJdi4MhR7gtZ3m2R/OXYL3EaxhgKEy5KrNsZwYVIbKXURV7qD700JPOTwFAzo
	 4xEnWgrdRDSqjZ0Rjp6+1IpwvIKLDJu6uz2eXCQn7rQvtBlR7PJ1Sqsq767lbkPEfC
	 7l/zbuLN63SIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C79940927;
	Fri, 23 Oct 2026 10:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA7749D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4943E80E04
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_3DJDh7eNLq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:15:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48F8680DE4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792750512;
 b=Y3X/sleA8bxXAqquyK842TAz+H6NnWot/8CcLduHxv1f01OhtOFwEHZHGPVHpCJw4jdQ
 Add8dDQZZMKoMJaK7rpWTHeO7/j0l7LLymiYj0oIPA2i44bikncdznJnVcoOzo8TIZtOr
 DTuN3PctYu3VxW76pSdTSCuGETfnQIZygp6JaJBTCyBwbTXXNwFKrQL6p/IE+ylK8qQ1H
 da59xwb+MuvG+sICtAzpg86W6apBxGPB+w9RNwHaApfNdaZm6ne0UnhNubUMOGHz4z1EW
 wAhLsEZSM/k5zPBp5kHBXMQ5JH3SkYWDdI3BTFADYcWlFulrUhN4FFqhyM/dY1r0BTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792750512;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=dven5WU+mNpk7iuS9kusS5AGef7vHLPwkrrMXbP1dng=;
 b=NRUBcqDJpGE9SQWWSNQ1BqlCJDQ1Aj6tAzGC6+H29OhraUPWZk0q/DRBtiKFiihQA3hH
 07mJLAnT1efZWdNpYLdSkv0f3pupVTLMcrdBX+AkFpp8LYH4HAvJ0+e3npxqBm9LSdpm9
 eCoUUGFNaD42Pc6lFZN4LpraKvju5P6J560git1TrnkN3Cf37OH1uMWJ9yxagN2o6itKi
 43znlT+k1tyIGySBNpyUClaFoViLiih+bR62FqtfK3P8J00U/aSKZUf5a2I1tofDhqNLz
 CX7bnYNth/EcJd5qonio3eEavHekHB5qjozMFDUDV3aIQajXoUKR/GoSpJo23VOnSSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48F8680DE4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792750510; bh=nirKNL4BC/K56rsKQdzmwjh2Yco0AxeXwSkBECPZW88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvltzYj9ULbqYDhd45zLMpDTOHYoBPNtMQIlwhOjEkBo1WU0cOf/yedasW3LYGE6y
 m6/uG3tEqMi3UqF13IPp8S46UmgidT2g3SAt0sf+iiMEE/G5H6MGV/4PW0RADdvsCi
 W5jey+y15ngiVWuB7AXH2byNz/oKpytYv8mT1VGUFY/XWiCcvof2yFkCrV8NsqkTkj
 0CP3RV0DyPclorOZMPrxbRuEJ4NykE83LgENEXA0JOJ8temd2uvaDS18IMbKbFHfZR
 zY4bbhmTVJ+4IV8eWuPEth0E9vqRlX/lV3H67Vqd+211zCR1ODk6ocURKQuIg+dHrZ
 zj/TAq9CSh+Kg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4828A31E0A98; Fri, 23 Oct 2026 12:15:10 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:15:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <atszrpfaNpx3zWmi@waldemar-brodkorb.de>
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de> <atfRLgIqqBBd6TuN@windsurf>
 <atfrauVhAXrHeul4@waldemar-brodkorb.de> <atsOH2BI10KVAnRX@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atsOH2BI10KVAnRX@windsurf>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,
Thomas Petazzoni wrote,

> On Wed, Oct 21, 2026 at 12:30:02AM +0200, Waldemar Brodkorb wrote:
> 
> > Thanks for fixing my bugs and applying!
> 
> Could you have a look at the build failures caused by chawan and
> propose some fixes?
> 
> See:
> 
>     arm      |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/35f6ff053723bf0d16ac5b425cf943bac01a4418 |

chawan needs fenv.h, which is only available for a hard-float
uClibc-ng toolchain. Here arm soft-float is in use. How should I fix this? Any
suggestion?

>     i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30 |
>     i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6a6cc4babb214f27f4f0e69ce915bf39d05042 |

Patch sent.

> powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/553aca94416bcafabfe23d34d6907bdb9ebb84c3 |
> powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/41cab338af1c162d9d1444645020a20b2b0c05ae |
> powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6401afa998d5e131614bda67730a79526da784 |

Patch sent.

>     or1k     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b |
 
OpenRISC is not supported. How would I express this in Config.in?
Any suggestion?
 
> All failures:
> 
>   https://autobuild.buildroot.net/?reason=chawan%

I take a look.
 
Best regards 
  Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
