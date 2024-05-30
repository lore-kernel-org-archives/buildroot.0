Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2872AC25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 18:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EBF84338;
	Thu, 30 May 2024 18:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpbYynD8l-kh; Thu, 30 May 2024 18:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2518435B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2518435B;
	Thu, 30 May 2024 18:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB99E1D4947
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 18:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63354187C
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 18:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6Wxc-SX7cT4 for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 18:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4772241884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4772241884
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4772241884
 for <buildroot@buildroot.org>; Thu, 30 May 2024 18:17:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA29340002;
 Thu, 30 May 2024 18:17:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sCkLZ-00BkB0-2S;
 Thu, 30 May 2024 20:17:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <99605672-166f-4747-9653-6f45458ddf04@infradead.org>
 <87plt5ruxy.fsf@dell.be.48ers.dk>
 <31d643d8-4bca-4817-a6f2-a40ac0d77d37@infradead.org>
 <ZldxjKMyzPIK1djL@landeda>
Date: Thu, 30 May 2024 20:17:53 +0200
In-Reply-To: <ZldxjKMyzPIK1djL@landeda> (Yann E. MORIN's message of "Wed, 29
 May 2024 20:18:52 +0200")
Message-ID: <87mso7qi3y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
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
Cc: Geoff Levand <geoff@infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Geoff, All,
 > On 2024-05-29 17:58 +0900, Geoff Levand spake thusly:
 >> On 5/29/24 15:30, Peter Korsgaard wrote:
 >> >>>>>> "Geoff" == Geoff Levand <geoff@infradead.org> writes:
 >> >  > -sha256
 >> >  > 8406a3b2b799344197c79f96e5b39ea7b6228f0bb2cb069b5f44dce684e29b9b
 >> >  > flannel-0.25.1-go2.tar.gz
 >> >  > +sha256
 >> >  > 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954
 >> >  > flannel-0.25.2-go2.tar.gz
 >> > Hmm, I get a different hash here?
 >> > ERROR: while checking hashes from package/flannel/flannel.hash
 >> > ERROR: flannel-0.25.2-go2.tar.gz has wrong sha256 hash:
 >> > ERROR: expected: 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954
 >> > ERROR: got     : e181a5e4233db47b0f03718ea801274c3a6024d235ead76e974f3df4f4183de1
 >> I see this in the build log;
 >> flannel-0.25.2-go2.tar.gz: OK (sha256:
 >> 565dedf012a358d87d6bb89a4b7118a4a7ab9a3aada9b9bf76349ca5e451d954)
 >> >>> flannel 0.25.2 Extracting
 >> Maybe there was some problem with your download of flannel-0.25.2-go2.tar.gz 

 > The issue has been identified:
 >   - we now require tar >= 1.35 (for reproducibility of tarballs)
 >   - we check whether the tar on the host system is suitable
 >   - if not, then we build our own host-tar, and use that

 > So we should always use a valid tar: either the system one, or our own.

 > However (there is always a "however"), the user can set TAR in their
 > environment, to instruct Buildroot to use that specific tar. For
 > example, it is possible to do:

 >     $ TAR=tar-1.35 make

 > So, when we check whether the host tar is suitable, we in fact check
 > that $(TAR) as provided by the user (and if not given, then we default
 > to looking 'tar' in PATH).

 > But we do not use $(TAR) from the download helper infrastructure, where
 > we only use 'tar'.

 > so, when the user has a system with an older tar in PATH, but provides a
 > TAR=tar-1.35 when building, then there is a discrepancy between the tar
 > we check, and the one we use.

 > Boom.

 > That's what happened to Peter.

Yes, sorry about the noise. Will get that issue fixed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
