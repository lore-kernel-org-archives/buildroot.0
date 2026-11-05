Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FF606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZR0juPkU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1AE3607F7;
	Thu,  5 Nov 2026 07:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAJDpQ3xSZi4; Thu,  5 Nov 2026 07:39:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8483C607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793864379;
	b=dZgJhS9OPtPJSAhSPoASoQdEU8rRBuU3ygxaiTs7G37vVTWjwHYQ8LW2+0CZ3wyoEze9
	 /kbuGFURLZgx+XDyapcTjztxS3bK7A5wDmmOdtWb+8GJYeF2iVjDIsUttJ0T1cu803hDC
	 lDYIBUgHCpb+FDy1RJk7OGc89V8DK45rP0fP+30dK5/FYrwMJqx1zyQToGj0CrTuygqc6
	 /bOMZ2iwFm1XHSJ3L5gH/nr0nOh2uXJ1VoN3G7LyIUFHqZk6kyw9BI9ueD3lUYVF2MLAk
	 IBXLG1xBi3BIkPMUKGke5sU9ExF/rF84IWeVSuJe9Dsc2n0U7ORHOJa54oMP/sVpxaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793864379;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NxLybLejl9U7CReDz45ucLvnh0RWQo/ti5TOXM0A+i0=;
	b=lo/XXBABAPN8fRqf0SHgLD8Xj+2tftbaOmljcxpiLERhxX1n8Eb4h76BYi1O9VVfaESw
	 j6vU5PIYGNO9tF8IjA/prVGWORApft78wG18EpeXmS5XjyrT+fDJjn9PsDF8YDEKSdBL6
	 67Crxqbtp2Z3L47p2cllW7h2meJSGodN/6qOgGZJGm67XUNJymfGiQHKTC2w2csYmYM6y
	 E2pcyZXFOfvy6NRX4iXfp5jtxQju2n7yEQdbU4xhe81QWQSpHMgOwCQKuNeYgwtDVCSwG
	 Nx5ZVXN1/Mjuxne3iUxe8p0j4plwkJqcqq2bx8Z07PwAQWxRdTThzVRbHWBb+UGSktA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793864379;
	bh=NxLybLejl9U7CReDz45ucLvnh0RWQo/ti5TOXM0A+i0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZR0juPkUzV7SNJ8XAkwsUS4CQ0PEWCJUzqOsQFyu/TpGPnnqysoINZ2xgQGiXwQfD
	 2dhuoQKetdA4uIgbeU+mtT1NGlbgo0u2H3JBY2gMIL8GukTNUtwpN79OR58z6tFGOa
	 3F0qI96FYhx98ktq5ZggBcZ+H1OL7zfgeTgjwW+bil3DsI/KDoovf3Hvf5RRWJl7U5
	 Aafv1dEdHRQgz4xrIHfq2d58d0T1MIPQ9htc3xCov2nONTSIBgYIh+N/RMKOB+Q2r1
	 sDuT3ObY5nVH4j1hFC8AN0e8f6hjC8vE4kMZxF6zIROSguetP+fUDtpIsLdDTTteZJ
	 +3tdVJRsWe/9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8483C607D5;
	Thu,  5 Nov 2026 07:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 847AC1779
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5133040801
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00Y-UrBg8x-G for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 07:39:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D7F45406AE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7F45406AE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 07:39:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0757A4E40774;
 Thu,  5 Nov 2026 07:39:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C96725FF85;
 Thu,  5 Nov 2026 07:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0DBA1032925B; Thu,  5 Nov 2026 08:39:32 +0100 (CET)
Date: Thu, 5 Nov 2026 08:39:32 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <auwymAFHyDh9H7Fm@windsurf>
References: <20261103064034.3913314-1-yegorslists@googlemail.com>
 <auuiaUH0JJ20VZWV@windsurf>
 <CAGm1_kt3BhEuM3H2rRUQYiFmU2+HrsCQdajzCe6whEXwrBkmAw@mail.gmail.com>
 <auu1HsM7xp331Hbk@windsurf>
 <CAGm1_kuobk61y+gvqkLYx2HMh6WiFaGwWj31JZ+=sTKdCqLN9g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kuobk61y+gvqkLYx2HMh6WiFaGwWj31JZ+=sTKdCqLN9g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/file: bump to version 5.48
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:08:44AM +0100, Yegor Yefremov wrote:

> > Note that https://github.com/file/file says "NOTE: do not make pull
> > requests here, nor comment any commits, submit them usual way to bug
> > tracker or to the mailing list.". So is there a mailing list
> > somewhere?
> 
> https://mailman.astron.com/pipermail/file/

Nice, I see your patches there. Then perhaps we can update the
Upstream: tags in your patches to point to these archives?

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
