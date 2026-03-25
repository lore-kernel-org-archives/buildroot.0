Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ACC106B533
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 13:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6153360731;
	Wed, 25 Mar 2026 13:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byxIHQzuhW0a; Wed, 25 Mar 2026 13:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1746B60704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774444936;
	bh=pEzOvdw50YBpyhTWkPsWpPi29gOTC3nI7aXKnSepARc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQrxFVfpzCvm7fy2evK+mbdNritfSYPDffJ0L+5Z5+0C3fk0IDMBKZjgMlDJ1Q8Df
	 LW21lgU9035Kofpxlf4FgX+7uox6ARR8FZmbIZorodBDNOHtCSDr6KHHA+EFG6sxTH
	 +j218zTSwCeFFeBvHSrw988L+7C75R0OgxUdHi5PGgrZBKjCMZ6ate1WVtdpwVTp26
	 LfD+xhG7oH7802ZHSQqchsb/+Q5P8QL54OlaHZZm38RbrR4U6VdGSbLRfQ0yrEfk/c
	 GXm0IPM0TSlOq9OjBDeekQPuWzNcENAtc8gM7sA1YLGg5IdLTpJdCmh1ach8lyOjV+
	 rpD7bwhF4tETA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1746B60704;
	Wed, 25 Mar 2026 13:22:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0271DF5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E84C0408AA
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzziJqi6Oe7v for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 13:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A70C94087F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70C94087F
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A70C94087F
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 13:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id C9A345A0003;
 Wed, 25 Mar 2026 14:22:06 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_VGvLSzEBoI; Wed, 25 Mar 2026 14:22:05 +0100 (CET)
Received: from [10.6.32.204] (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id B31865A0002;
 Wed, 25 Mar 2026 14:22:05 +0100 (CET)
Message-ID: <0242e80ff6d2e69be00d58324aabe11fac9e4a31.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 14:22:05 +0100
In-Reply-To: <20260319130014.120393-1-thomas.perale@mind.be>
References: <36f45eeb35bb33fa068060c77ba22b06fc34550a.camel@strongswan.org>
 <20260319130014.120393-1-thomas.perale@mind.be>
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
 d=strongswan.org; s=default; t=1774444925;
 bh=d2VG0wcIvr8N1vPltuGo5YzMVLFixyHIAi9ckrQu56k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kEOIhqfatmPjep6Nyhj2JU1Ql8rzFRzuMuguC652bSWH8MMYqUyjqiupaJ30UIAWy
 pKPZfT8hUXW8TuivVOrxPrQtUmsUGTz6gBQAitk2fC1/axauBB0ime4AtFk0asyt/z
 wh5oGGG65N98qQDPKB6urp5brG9TppktBCX8VQBhMKWkaePGNkvR6R0OpdUSt+94Er
 y17zagX+Bdn+RK1JOzhhSM0PyE83fC7zYjSv7gTZVrHkhQXRlXk43E7VrLQTyo9+h2
 3kX74bBe41GvwWn42G9sPJxLoFjRZFI4W0ActU5cPEH9pabcUTByjAB/0L0BSFpC1M
 MuWyy+XGfBNnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=kEOIhqfa
Subject: Re: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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

Hi Thomas,

Thanks for your feedback.

> For the first series personnaly, I would not include [...]
> 'add option to control patch diff inclusion in SBOM' &
> 'allow referencing patches by upstream URL'

> Regarding this series with the additional metadata [...] I'm
> wondering if there isn't a better way to add some of the metadata
> information without adding to many CLI options.

Ok, I'll respin a series with a minimum of patches: unit-tests, fix for
root deps + externalRefs with hashes. Not sure if manufacturer URL
extraction from Config.in is something we want upstream, but I can add
that later on top of it.

That metadata template thing sounds very reasonable, but this requires
some more work in a separate effort.

Best regards,
Martin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
