Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FA607BF2D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cMNwFigD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dqebi9nr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF26F6063F;
	Mon, 19 Oct 2026 15:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfyCfAhQYnEp; Mon, 19 Oct 2026 15:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E09FD6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792424085;
	b=hP3GiMEuE87INVcYlSJnvjTgmoQ/PxMiQzvS3VIR7PUfb+1bSn89mdny+tnomlyX1tIA
	 jVJ2sHFWouqC+3h5A9MwJcpoB/E0Q+IEZ+D0aufJKIMc/wKocAywsJkT4rJmjcXht/Am6
	 4ywAHI0JdHN0xuRqfnhdXPN2P75pbz/5DHQDvIWSTkKaKwrUSkpaoG4O7HVtiZwf3ScN4
	 TPNz7ex3ZUk+ArJwv66b3dnusTSvOBuEYFIXO1bf5nXzMXeReQg8L1Zuf95Ssdymd57P2
	 oD8OmIUT4uJm4OwjFdxV3fMy5BwztzFo2hirwIhiL0KTvSDX0lgEIGePyRRKPEyg5Yg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792424085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CpfnCRy8OWF+RvohTRqy1Qa7wuB9xQLuYcI3m4mFtTM=;
	b=X5u+yajDT8Oq9RAJm21sjedbOSArV7wCQv4P9V0O2g22Ei2ZqTJqwxBfknNSNB37N+iR
	 W134n5r1DUpctkqRg30HT950hQdNkUNexyTZ9PHOVRQX8e54aA/CP93plt1SIgQIAXYfT
	 qBvIY7TKDaJeC3kIOCKrAAWDo9FLFhfMpTDGIMH1ixU2idmcb7BZJcWLNBLTj5iC6+e95
	 2ivxXVDl9X9yYeHy3k1p/WntRP3cnwlQbgzk6Oi73T7T56LvX3ODO1vW/4dvTvb96cOuk
	 nR9ahQqhzIf8b4Hl2x++P10d1t0PXdi7aRMEOtVKh6CU3WYKjU/qFL1CFEHwyQ+x2wA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792424085;
	bh=CpfnCRy8OWF+RvohTRqy1Qa7wuB9xQLuYcI3m4mFtTM=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cMNwFigD24lhNtF6ejswKMBjt/T13H7qdT9QhFfwK1unfXvhv4eQCqDUTdlgP2wGE
	 GHbPscuhXYfG8h0dAhp091Q6MmNnZsHUZi+O35jynwlA+UDMpNdhPtxk1K2SsbTQYr
	 g91EUhXJB3cJLRxFwfOmLwvzvdrJmjFoMBpjJknptPh/b6HfH6jvguSjltd+QcSJD8
	 RAz+6btNzoc9AMeou17ravFuo/tjpEBZLRK1OTYfy+ll6ANJc8bOqlHpauCpE7+pYy
	 TRGFIFkSWZAIqw1MznbT6lqOMBlrILHFB47Gxo7dp2gni5vW/Whb+LA/urGxLa5eg3
	 HEg2Az0uN6h0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09FD6060C;
	Mon, 19 Oct 2026 15:34:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81D7312F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 736D7400F9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez05VW42816c for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 15:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B3270400B4
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792424082;
 b=KshTDtWDt8k2s7m4as5VIHui9QMN5uohNbEtpfKwpI51dWn1hV+DX8Eu/rALCR0FLRW6
 OuQI5JVqiP2Tbh0SD8tX4AWioMecS8lJgVG8ApEzZIoYD6wpFFTU9e2NQhfWg7Uld5EZC
 d7j0Pc7RjbhiCFVrX1+yYTiLcc+ai9uIvFTIqTvNWcyUP7D05gyt/BhelioadrleEFn3E
 DCXtsw83/l69dZK79/+ld8qFdG3WBHs8s3bR4vVYLo2zn6Par9SFEAX9sfRNvU1cU+b4X
 K3aWNSOL/snF2XNl/Mh3HGG6vzJhZ1aJMcGh5MqpPaLGSQj8XNRTU5I6A22sM8n34aQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792424082;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=cf0xA0zOQlbYqdw05/ymp9jqzAh4Xc3JAeNh5rJXYH8=;
 b=JNA8w7xJ/cNq2vQXGyE9Api/PVQHf3FkNqXyy5ca00NENMXvL8Km3TZ8ljSxQDOju8cG
 tRCOFVvSADWfAn4bPZC8EN/MI63OP9VoCQ9ypNycdxgULf3m4fs3BpK3Oi5VLQAR4nHYm
 Skue/aMzK5AGWXLclSBNSZId2UeMG20ZXHY7vK5dWoXymuf/eEKxZcwnL1ypnMJ9hmHH6
 5xKmqefxE+d2bHLgdNT5RKZkSQc88TgBLC31aNwuj6ECf4ow9H1XUyz546/WgB1TzPhzH
 ZI8+LX5z9E0l0POlYKfnU6R9lTK4RSW3n6YCTgHlKRQ31HXlDMFVxRmEU/Vniqge71g==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Dqebi9nr; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Dqebi9nr
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3270400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:34:42 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2e946155442so18172295ad.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792424082; cv=none;
 d=google.com; s=arc-20260327;
 b=cqfDcft+UJaGcuEe0vPHInAKcEOuvIGvjn5bl9N3e+VT4P4JsTs09a/LamUKP83yJ0
 J1smnzQ9PfWvp870KDoR2B4ypdA7cNwnbiduj7cJBMLByYZ+JHuno0KsKa0QplNw0WI2
 Uy203rCyaX5efZhcJzy9UZfgcD5Qljmso7CblGyjj9lmrPmctxlhwCkCt8pXpRLSmRpm
 aYAzjBcEunV7ofw8n8iiyF5uLn1iXgz5kQy7GUE1LwSGjWzuh0bANuQMN547wsPVqBlW
 /J5pi4upkSlUD3ju1RPWO74ez3aX+Pl5+JEy31GW5fHOWD7dXHi5CvLA2xP7w6UuK5gt
 ppMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cf0xA0zOQlbYqdw05/ymp9jqzAh4Xc3JAeNh5rJXYH8=;
 fh=IkPV1CfvAddJ1qLyDJIGhPm4VOo1HUJqzzOubV73QTM=;
 b=UDh8T4cHiMT7h5uUQWiBVp0EJ6lEejtOIXkVgLEs8ymsEivewLPifZxseyzy9BxTAk
 /SjFa0lJ+OhwRH22oHa/EpI7YBj0hVQzM+qAr6ARAmhmnBNFe1tRyzMTik5z/eJOE2XP
 2uPdxX6szgssCOUkMgSAPaHXG6EO2RMTOluXsklZ67lUNzmu40ecD7FClyfOBQ1lzYI7
 Un4nCUJRXiF5s6BUg/1qf4kN0li81FDhMXf2SK0VemqvqGET1CgO1Q5ZwCCRjJ9uyuSR
 v4+Q9P5PvCn7AKhewRq+j2tIovaPoFpLi8ooDRQlBPzHya0IqeR/azwuDFIBHofHkh6q
 H1MQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792424082; x=1793028882; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cf0xA0zOQlbYqdw05/ymp9jqzAh4Xc3JAeNh5rJXYH8=;
 b=Dqebi9nryTpo9rwto6ZlITGHsGPQxPaSBEDcvhDf6d80BwUZTc1YoXD+QdAXEaSqj+
 YToSTbMGxHASGvFwVDvtMvtRUkPjlj0XSqYFrKBK1WUBSkC/qksBoXGg2Xkqg7fVucSX
 /zhRrtyltpouvAN8ZtZV1xX3F3UDi0uEt7RhNxDg00omg6Oswj+1Msh68B325ZmsXQCx
 tJUlvGYGzhaCRoXcA0xkdnJCSSOksGWuRiXdO+l8SmZH7khIE+OYIaj/G9Q14vrDOFbS
 IGN9E5E0KAxLTsfx1fPODgvXJ9lWmb08KG/hVxd5s5dSHitb4PiGFjKWmX+diEFIs+02
 QL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792424082; x=1793028882;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cf0xA0zOQlbYqdw05/ymp9jqzAh4Xc3JAeNh5rJXYH8=;
 b=woH3h27dFXRJL4NBugmhhTYMX2xDrHT35/2PKBHBKJpPTSPZdc53Vd1hNvME/MbuAh
 sJU4HNnSzgPAdakhFy8SGwBWhbINvzmy5wEeGHMdha5IiGmQveqaV/+a2mXefiBCXCJa
 NVzhisXZKQd3TfAidnIu7WjBB6XuGYrjW+/ehM2A11kqPHW39QKs9uC8b0V7C7UYHZ2j
 a6WCalqKpeT74bYynG0bKL1hfgnxUlqBI9i5qIY7L4zGcj1L70xZ4dKCOW6u8pV0jB/M
 DgsQDZPfnUir0173lxhO+kZOUgk3wsDgKw3yQmHCOsGtl/szuXA0raJMZZ2V+r1ZQYO2
 U8rg==
X-Gm-Message-State: AFq9FYIyLLtQQa6LrJF/bAnWNQsMhr3iXaUa8FqB6HmkGQqoOtnaOWAX
 TRSoH0/3rN2azandYoOsJfm3QFBphkWqotKFzL/NU1xGNWXb27prW1TnFGuI358ViHy4q79t/sT
 fdatQoYXvMAnpa6/BI2aWUi2SV9hjeL8=
X-Gm-Gg: AYBFou1pbOHN2XRefm18rKr0Y898ln64vwj6qegCa2bWDeNYcVbkCriJlMEP6CgPNBE
 m9yccDJIq2eiyz7VJdr3E97EKVzxeU7AJSWdBdkKuyk95I2xnuNa3vSePxN9+Wjug1fRiSoOlG7
 hWnuSsrDX1rHrfggpx3ArbC/PsHBo4V3tifgJdkXSYM93gtpi5KevjyHn0GvpR3g/Z5HhG2LWbS
 mGCgMaR242z2LbkN3tzYt0zbS5SH0i/lZ+qOwbYjJ6orGrpfk555ZnBpPA6uqPCxq9ZEQUgNsYo
 e1vU+dG0HR1P2JbymTachSeK8BoH4W0ul0KZnwJGtyIaJ3olTjPxZm77UjdfPITHMjjBD/slMpk
 PKpbY/OsPC/Sf
X-Received: by 2002:a17:903:1670:b0:2d9:216a:cdd3 with SMTP id
 d9443c01a7336-2e9a6d1d820mr69531105ad.18.1792424081584; Mon, 19 Oct 2026
 08:34:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-3-titouan.christophe@mind.be>
 <20261016221711.GD331129@pevik>
 <aca763fb-39ba-4f28-bd5e-4ef815e71fc5@mind.be>
In-Reply-To: <aca763fb-39ba-4f28-bd5e-4ef815e71fc5@mind.be>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 19 Oct 2026 17:34:28 +0200
X-Gm-Features: AclHuK9TwqrE6pUsj0z3WDMGKw2DB3ZXz4mO3lnMd_VU0T8Ly3lk3opjRs6fCZc
Message-ID: <CAB1t1Czfc-e4RkQ=Hd9eHycECLOfsNw0R4DBhBJkqnsQ51K54A@mail.gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 2/7] */Config.in: use the new $(VAR) syntax
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 at 16:06, Titouan Christophe
<titouan.christophe@mind.be> wrote:
>
> Hello Petr,
>
> On 17/10/26 00:17, Petr Vorel wrote:
>
> [-- SNIP --]
> > LGTM, I'd add my RBT but the commit is broken:
> >
> > $ make defconfig
> > Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
> > make[1]: *** [Makefile:1047: defconfig] Error 1
> > make: *** [Makefile:83: _all] Error 2
> >
> > Even removing output/ directory does not help:
> >
> > $ rm -rf output/; make defconfig; echo $?
> >
> > You fixed it in the 5th commit
> > 04d878306a ("package/openssl: move libopenssl/libressl options out of the choice")
> >
> > But NACK to that approach. Each commit must work. Either this 5th commit must be
> > squashed into with this 2nd commit, or if it does not break the current master
> > it should be as a separate commit before.
> Indeed, the patches could possibly be reordered; but I don't think it
> would be practical to make each one be fully functional.
>
> Indeed, I would like to separate the Kconfig update (which is already a
> big fat patch, only taking things from upstream); from the related fixes
> in Buildroot. This is to make the review slightly easier, because you
> can actually review the different logical changes that happen in
> Buildroot to accomodate for the KConfig bump.
> This implies that some commit won't work individually, because all these
> changes must be applied together. The alternative would be to squash
> everything together, but in my humble opinion this makes it much more
> difficult to review.

I'd say it's up to Buildroot maintainers if they accept broken build.
I mainly care
about broken bisection. But sure, otherwise separation is good. We talk if
these 2 commits can break build
"*/Config.in: replace bool entries with prompt within all choices"
(which IMHO causes the problem)
"*/Config.in: use the new $(VAR) syntax"

or should be squashed to the following:
"support/kconfig: update to kconfig from Linux 7.2.9"
(IMHO just "*/Config.in: replace bool entries with prompt within all
choices" requires
that but haven't tested)

@Thomas @Peter @Yann WDYT?

IMHO they should at least note that they broke build system (at least
'make menuconfing', 'make nconfig' and 'make defconfig')

OTOH it's still
Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
(and any other $(BASE_DIR) usage)
which I hoped could be somehow fixed with cherry-picking the relevant part from
the update to kernel 7.2.9. But maybe I'm just wasting everybody's time.

> I will, however, try to see if another ordering makes it possible to
> apply each patch individually without breaking the build (but I believe
> this is impossible due to the changes in Kconfig language)

Kind regards,
Petr

>
> >
> > With that fixed you may add my RBT.
> >
> > Kind regards,
> > Petr
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
