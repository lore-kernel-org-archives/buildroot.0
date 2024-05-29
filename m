Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED6C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 18:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B97605C4;
	Wed, 29 May 2024 18:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Myn9asyCiEZ6; Wed, 29 May 2024 18:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A3D60B45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A3D60B45;
	Wed, 29 May 2024 18:19:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8507D1D393B
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ECB340428
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTl6nBxhkH7y for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 18:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54BFB400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54BFB400F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54BFB400F1
 for <buildroot@buildroot.org>; Wed, 29 May 2024 18:19:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31DDB13F89A;
 Wed, 29 May 2024 20:18:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 29 May 2024 20:18:52 +0200
Date: Wed, 29 May 2024 20:18:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Geoff Levand <geoff@infradead.org>
Message-ID: <ZldxjKMyzPIK1djL@landeda>
References: <99605672-166f-4747-9653-6f45458ddf04@infradead.org>
 <87plt5ruxy.fsf@dell.be.48ers.dk>
 <31d643d8-4bca-4817-a6f2-a40ac0d77d37@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31d643d8-4bca-4817-a6f2-a40ac0d77d37@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717006737;
 bh=u7FhnncinGYx/PF7Eyy84M88c32ds0ElICaw4YjsPwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgPeiqL+3rNyibDcE5IZWvn+WFBbAaUoYJG20ubEYDMLDW16+idSmRiioTij5yCMx
 N/aSzA4JtgF7M3PPKVDp0+Dk52hPnX+GnQXFjFLo55Sy0WS2UXAWihJ6WGTn0egKtU
 G+/P5t+k3nYVI2jta4LzQhLf8u0ikZi+jCPBivbOWA/KB/iqzgk5EUnMwgk2KW5A5x
 iLMfMnbQZtOzZaLc5RY0V4P9lL4u4DnpCkg6a2YaAGn7qy/Dyl65Yo36YqGAZqglgW
 Sa9HCURiBJvjkv86eBvkI7Vzp0K/9bUdQ84PdcIh83qRwNHM+rCeoA7ViR3fTQQ6zi
 1uFH/dU7Bs+ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RgPeiqL+
Subject: Re: [Buildroot] [PATCH] package/flannel: Bump to version 0.25.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Geoff, All,

On 2024-05-29 17:58 +0900, Geoff Levand spake thusly:
> On 5/29/24 15:30, Peter Korsgaard wrote:
> >>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:
> >  > -sha256  8406a3b2b799344197c79f96e5b39ea7b6228f0bb2cb069b5f44dce684e29b9b  flannel-0.25.1-go2.tar.gz
> >  > +sha256  565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954  flannel-0.25.2-go2.tar.gz
> > Hmm, I get a different hash here?
> > ERROR: while checking hashes from package/flannel/flannel.hash
> > ERROR: flannel-0.25.2-go2.tar.gz has wrong sha256 hash:
> > ERROR: expected: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954
> > ERROR: got     : e181a5e4233db47b0f03718ea801274c3a6024d235ead76e974f3df4f4183de1
> I see this in the build log;
>   flannel-0.25.2-go2.tar.gz: OK (sha256: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954)
>   >>> flannel 0.25.2 Extracting
> Maybe there was some problem with your download of flannel-0.25.2-go2.tar.gz 

The issue has been identified:
  - we now require tar >= 1.35 (for reproducibility of tarballs)
  - we check whether the tar on the host system is suitable
  - if not, then we build our own host-tar, and use that

So we should always use a valid tar: either the system one, or our own.

However (there is always a "however"), the user can set TAR in their
environment, to instruct Buildroot to use that specific tar. For
example, it is possible to do:

    $ TAR=tar-1.35 make

So, when we check whether the host tar is suitable, we in fact check
that $(TAR) as provided by the user (and if not given, then we default
to looking 'tar' in PATH).

But we do not use $(TAR) from the download helper infrastructure, where
we only use 'tar'.

so, when the user has a system with an older tar in PATH, but provides a
TAR=tar-1.35 when building, then there is a discrepancy between the tar
we check, and the one we use.

Boom.

That's what happened to Peter.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
