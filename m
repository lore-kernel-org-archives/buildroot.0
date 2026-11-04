Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A3606D808
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mrf/Sumw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1212D60844;
	Wed,  4 Nov 2026 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUihvZ98Y32k; Wed,  4 Nov 2026 22:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 449D96081E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831664;
	b=buBdKk+BziuFb8MrgjbMuy+7B0TuSxGWYhaKhqMTSgKny34wdkkhWFAishg9qps4k626
	 YwAiOmvb+GKkNmi0kHniKK+slZlMQIqJpEAgkCzwT4FkAfMOqZoQxglTbpJuz4Hxte6b4
	 1UGJMBm9eyiTvUhzveLyuVXpb+X0qJ1F2NgNFIcnWUnFrj4Krgucabxmq+mGAu2gm2R8K
	 a5fJa2KO6SMtGzHgdnbkC+pG++hbdVvEpNsOEkruC/rvRsN5YADInffDLOhDh2NPSKRYZ
	 N9qqTljPqrwcF7tBmBa0idQixlMMunYhuuEczzMD+rwGxOjPi2i1XdVQ7jtZdciZCqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cfeER8oVt1L/1iO5yifzd1ePb1FhqvjNZK+z5VFUKAc=;
	b=UWkx0sbtPS8+6TFTpotL45j+iCYmGOTSbZ1drQQ3QfLHveB9HRH1sUaUwakysS/Qeuoq
	 jcAqo3KyZliHkW+hksTzlkFVD3onnqZz+JH3L5uUjdvbScQGQ/TE2cqjVXA4noI8cjxXI
	 Tu7Cao8o51xLTE+3JfkAt9X+cOm7xGj+yyEvNQenjZ2Cg6V/sVozsGAX3ndm7MGJ7ynC5
	 5Q9vwzRXtPPAOJ4TiXCuc80jzakfiukOqUef7xaC3rOWnpK9R3khAouFzuPX03jXGQ+/4
	 WEO/O8+f4wsYOf/L0zppSbOfzaa89i6IIGFOk60FUv7QFp0ckzk2H5VCff6fZ+VlFpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831664;
	bh=cfeER8oVt1L/1iO5yifzd1ePb1FhqvjNZK+z5VFUKAc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mrf/SumwEBPw/6X9q9xYBk0q0E1YNLIJfDlQ9kepiI9aFF/EEiFqBiINPAqB0BzM0
	 jKYqj1Om/jKu/pX14L+to7jeeQIr+WSnL0AVCSfxurFoluwbYHhkMv5J8h4DSrcwNr
	 VE6+cp4FJALpXmJPcQLwa4QVo0ogGKJoRpzJf3QDF6wsuoTE1FX67Dwf4myU+Atee6
	 /Q4VJNUYq6Uh4uDCWM/ao6kdPqWe+cGxhthBEEO5oE6j32dLW60cyAbCs8YhwOk0oj
	 E55+bgtHHIMCLnlYJLbzWY2XKI/OHYRc3Iq/udyHiyINOfduf993CpcIL+MoiVxOWh
	 FGfZ5Mv4UgKSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449D96081E;
	Wed,  4 Nov 2026 22:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D68362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB00840211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZDp6UAOg2zj for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0C61D4008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C61D4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:34:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8715B4E403FF;
 Wed,  4 Nov 2026 22:34:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 57BB25FD65;
 Wed,  4 Nov 2026 22:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB82710329276; Wed,  4 Nov 2026 23:34:14 +0100 (CET)
Date: Wed, 4 Nov 2026 23:34:14 +0100
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Message-ID: <auuy04ugIUfC7nkF@windsurf>
References: <20261101082513.1583784-1-bernd@kuhls.net>
 <audouIxxR5_vsJNX@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <audouIxxR5_vsJNX@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: fix build with LibreSSL
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bernd,

On Sun, Nov 01, 2026 at 05:30:26PM +0100, Thomas Petazzoni via buildroot wrote:
> > + static void test_xd_keypair(struct dcrypt_keypair *pair)
> > + {
> > +@@ -2339,7 +2340,9 @@ int main(void)
> > + 		test_static_verify_ecdsa_x962,
> > + #ifdef HAVE_X25519
> > + 		test_sign_verify_ed25519,
> > ++#ifndef LIBRESSL_VERSION_NUMBER
> > + 		test_sign_verify_ed448,
> > ++#endif
> 
> So this patch changes test_sign_verify_ed448() so that the function is
> not implemented nor used when LIBRESSL_VERSION_NUMBER is defined.
> 
> > +diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
> > +index 6ed164c0f0..20371cefc5 100644
> > +--- a/src/lib-dcrypt/test-crypto.c
> > ++++ b/src/lib-dcrypt/test-crypto.c
> > +@@ -2007,7 +2007,7 @@ static void test_static_verify_ed448(void)
> > + 	test_end();
> > + }
> > + 
> > +-#ifndef LIBRESSL_VERSION_NUMBER
> > ++#ifdef SN_ED448
> 
> But then here this gets changed so that the function is now defined
> when SN_ED448 is available... but why isn't this also changed in
> test_xd_keypair() ?

Any feedback on those questions?

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
