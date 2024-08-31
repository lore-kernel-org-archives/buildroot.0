Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FF9CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F66581799;
	Sat, 31 Aug 2024 16:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G04rSbusUo_x; Sat, 31 Aug 2024 16:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A23E8179B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A23E8179B;
	Sat, 31 Aug 2024 16:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAB91BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13341412FF
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3dl-BwA-wQU for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67418412FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67418412FC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67418412FC
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD04760003;
 Sat, 31 Aug 2024 16:22:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skQrg-00GUzu-31;
 Sat, 31 Aug 2024 18:22:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240627205332.3302187-1-yann.morin.1998@free.fr>
Date: Sat, 31 Aug 2024 18:22:16 +0200
In-Reply-To: <20240627205332.3302187-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 27 Jun 2024 22:53:32 +0200")
Message-ID: <8734mkzmpz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix downlaod
 issue
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > am335x-pru-package is downloaded with the github helper, so the tarball
 > is generated "on-the-fly" by github.

 > It loos like the process to generate those tarballs has changed, again.
 > The hash for the archive has recently" changed. The delta is in the way
 > directories are stored in the tarball: it looks like the "basename" of
 > the directory path has been split off from the "dirname", into a
 > separate field:

 > @@ -270078,8 +270078,8 @@
 >  0041efd0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041efe0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041eff0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 > -0041f000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 > -0041f010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 > +0041f000  50 52 55 5f 50 52 55 74  6f 50 52 55 5f 49 6e 74 |PRU_PRUtoPRU_Int|
 > +0041f010  65 72 72 75 70 74 2f 00  00 00 00 00 00 00 00 00 |errupt/.........|
 >  0041f020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041f030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041f040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 > @@ -270104,8 +270104,8 @@
 >  0041f170  34 61 64 35 37 63 63 31  39 35 66 32 38 62 66 35 |4ad57cc195f28bf5|
 >  0041f180  65 35 38 35 63 33 64 34  34 36 61 62 61 36 65 65 |e585c3d446aba6ee|
 >  0041f190  37 30 39 36 2f 70 72 75  5f 73 77 2f 65 78 61 6d |7096/pru_sw/exam|
 > -0041f1a0  70 6c 65 5f 61 70 70 73  2f 50 52 55 5f 50 52 55 |ple_apps/PRU_PRU|
 > -0041f1b0  74 6f 50 52 55 5f 49 6e  74 65 72 72 75 70 74 00 |toPRU_Interrupt.|
 > +0041f1a0  70 6c 65 5f 61 70 70 73  00 00 00 00 00 00 00 00 |ple_apps........|
 > +0041f1b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041f1c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041f1d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 >  0041f1e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|

 > Switch to using a git download, which uses our reproducible way of
 > generating archives.

 > Once extracted, the files have been verified to be identical to the ones
 > in the archive on s.b.o.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Frank Hunleth <fhunleth@troodon-software.com>

Committed to 2024.02.x (after changing filename and hash) and 2024.05.x,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
