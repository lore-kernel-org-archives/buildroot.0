Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF3FD9E07
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 19:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB157406CB;
	Thu, 26 Feb 2026 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1lKxgkhyzpJ; Thu, 26 Feb 2026 19:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7B7406D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772135048;
	bh=k5XnIJX/jqDqOVa7EE9/2u+ljEBq2oocGDFcybfYWSY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4SOdSEEdNtNoR6TWu/c/CTsVx9h2GzqtSkcXhh3BvlpKj+54hA8ASBfQDAWNC6R3
	 o/V9i5ldl3AalLp6LHtYj/u1urHJYj7ToihvqpupKXKfdTQtFWJMoH5xBZT1ba1ngJ
	 5QtH94Qg1ABsYVidC/Yu/K1ElycW2/BuUJU2mNDN6VEQmUQCgyh6FZ8HMfKHBQywBt
	 38Od6akOfQ4U9RJY2nnxlOVtc5EsWZ0IYfPoJFXRh4eGkSVgk7iHi4PHGszI8x3ypV
	 WJ3254Ai2LQ6NfxIVHgBMlZTQ+L/9crKw1dgOVbjNXiGlRXXsTE4vuzT/TV4tKQ4Rl
	 9WMizLAesuNdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7B7406D0;
	Thu, 26 Feb 2026 19:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB41A204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACA28406D0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEeK0hk_Sagb for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 19:44:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a02:168:860f:1::35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEFEB406CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFEB406CB
Received: from mail.codelabs.ch (mail.codelabs.ch [IPv6:2a02:168:860f:1::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEFEB406CB
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 19:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 90C845A0003;
 Thu, 26 Feb 2026 20:44:01 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmnCmtmP6zHi; Thu, 26 Feb 2026 20:44:00 +0100 (CET)
Received: from zbook.home (198.210.60.188.dynamic.cust.swisscom.net
 [188.60.210.198])
 by mail.codelabs.ch (Postfix) with ESMTPSA id 38B1C5A0002;
 Thu, 26 Feb 2026 20:44:00 +0100 (CET)
Message-ID: <cf65ad066e47e39cc22f720d794a87dae31e2a11.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 20:44:00 +0100
In-Reply-To: <20260226153843.194855-1-thomas.perale@mind.be>
References: <20260226142700.1064999-8-martin@strongswan.org>
 <20260226153843.194855-1-thomas.perale@mind.be>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772135040;
 bh=+bzWL8bFKQ2ZW2XFYA81m+vEZE/ZhIhqdgjAcRd0dho=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=wg38GjzcjySLe52HwZ/bUe2W4sc60Ktdny6tRDwc25gR5ogBHyvFD9VNPCkN8Z3Zq
 PBrQ+eMxZKDogwyw67osSpFaH8DAoN/qWGMmpxMT+7EIiadaSNbMrEgLAU6xYsAMTR
 yl4kr1/tzp+mfm1OSsxamrs6xVvEgWe5As+vcwbbMVzBAHB0MXzWip22gXftqBDP/E
 iQItWv4zKePLO5KpaH3H7Bq4s8jcgpws5ymHf5oAzZxylLPrA7CBblJwGWYg/NNe7C
 wtiy/6Eya2X2VmaVPvr8ctF/d5OQau3/gMLpnHDI9eicADgH2cIDp75rjwvQIWCwbT
 zF7280YxzHhYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=wg38Gjzc
Subject: Re: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: add generic
 purl for http(s) source URIs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


> How do you plan to use the 'generic' PURL name ? I don't think we can
> have a proper unique package url based on the Buildroot package name.

Yes, the name won't properly identify the package, but it seems
mandatory to pick one for "generic" PURLs. So if (scanning) tools
inspecting generic PURLs are clever enough to just look at the
download_url, this may work to identify packages. But this is certainly
questionable. 

> I started last year some work to add PURL support to Buildroot [1]. I
> only focussed on the 'ecosystems' since we don't have a solution for
> C packages yet.

Interesting, thanks for the pointer. My idea was to approach this from
the other end, i.e. try derive ecosystem-PURLs from the download URL;
this should work for CPAN (when using cpan.org) or PyPI and others, but
will probably be more tricky for Go and cargo... And it allows github
PURLs, which can identify the source properly.

> The main outcome of discussion regarding this series is that right
> now we can't be sure that the package name in Buildroot correspond to
> the one upstream.

I guess the main problem is that there is no good way to identify
source packages; there is no "source" PURL type what could work across
different projects. Using "generic" PURLs is certainly not a very good
option for packages building from a tarball, but the only one we
currently have?

An alternative could be to encode the tarball URL in a
externalReferences "source-distribution" [1], to have at least
something that identifies the source of a package. Tools probably won't
use this to identify packages, though.

Thanks,
Martin

[1] https://cyclonedx.org/docs/1.6/json/#components_items_externalReferences_items_url
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
