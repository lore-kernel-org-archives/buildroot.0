Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB12C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B8680D96;
	Sun, 10 Aug 2025 20:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfG2m01DIn-0; Sun, 10 Aug 2025 20:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2461E80D32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2461E80D32;
	Sun, 10 Aug 2025 20:04:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D382E154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F6740F56
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFbQOtvLi1kc for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD08F40DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD08F40DBF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD08F40DBF
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:04:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -809661905; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 10 Aug 2025 20:04:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulCHC-00758x-0T;
 Sun, 10 Aug 2025 22:04:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-3-thomas.petazzoni@bootlin.com>
Date: Sun, 10 Aug 2025 22:04:18 +0200
In-Reply-To: <20250810124820.2116495-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 10 Aug 2025 14:48:18
 +0200")
Message-ID: <87sehzndtp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mZV547QI+369W5mlDNkS1SKKVZ9E52tN0Me9OEisCgsZhHu1aGPib6KPOi9KgY7JIJRgUGxsgjX9orovWArXSWArigOIxdIVc9SWt26GjpEBbLBaeUJngwnlaPVi8ajlBUjMt4YfInLf2joxD2CejsJo6LycWb8Nq/biXa0/d6GoO6/sKks29OufDVAcL/Kd963k9XocYhrORhI+pjXBYo5k88G2dxcW9WOCIyFblrOWx4e74ieNIEw+9ZzpF9QuAOTiDVJHUVdsxsrKyt1pmJCJTCFlwfO2u92lCC5sKhvTyBRXI1dslIFNClmFbpsucKpsVrjnn21siBmdc3WaJg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=0P79mkuClzm2p4k2Y5+gkXWqbJUN5j+4XXjDff6xYBA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mZV547QI
Subject: Re: [Buildroot] [PATCH 3/3]
 toolchain/toolchain-external/toolchain-external-bootlin: update to Bootlin
 toolchains 2025.08-1
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The toolchains have been rebuilt with a recent Buildroot, and are
 > based on:

 > - Stable toolchains:
 >   GCC 14.3
 >   Binutils 2.43.1
 >   GDB 15.2
 >   Linux headers 5.4
 >   glibc 2.41
 >   musl 1.2.5
 >   uclibc-ng 1.0.45

 > - Bleeding edge toolchains
 >   GCC 15.1
 >   Binutils 2.44
 >   GDB 16.3
 >   Linux headers 5.15
 >   glibc 2.41
 >   musl 1.2.5
 >   uclibc-ng 1.0.45

 > The microblaze bleeding-edge toolchains are back, since we integrated
 > the "atomic issue" fix.

 > All tests are successful:

 >   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1976388296

 > (note: the test branch had one more commit doing tweaks on the wget
 > option and re-enabling the backup site for unit tests, which are
 > needed to avoid intermittent failures of Gitlab CI jobs)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
