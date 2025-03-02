Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42275C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF97E40C49;
	Sun,  2 Mar 2025 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JZZ5QUufq_f; Sun,  2 Mar 2025 19:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687E040C88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687E040C88;
	Sun,  2 Mar 2025 19:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1285182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5CD3605BB
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpTg90rY7I6M for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 19:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A4E160704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A4E160704
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A4E160704
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:22:48 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 305B824054C;
 Sun,  2 Mar 2025 20:22:46 +0100 (CET)
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id 03CA126003B;
 Sun,  2 Mar 2025 20:22:46 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 4CDC4240CA2;
 Sun,  2 Mar 2025 20:22:43 +0100 (CET)
To: Han Gao <rabenda.cn@gmail.com>, Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Drew Fustini <drew@beagleboard.org>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Mar 2025 20:21:10 +0100
Message-ID: <3279501.5fSG56mABF@kilian-laptop>
In-Reply-To: <1913069.tdWV9SEqCh@kilian-laptop>
References: <20250101205435.1513140-1-kilian.zinnecker@mail.de>
 <e508e642-3942-47e8-9ff2-a23f16d9d706@smile.fr>
 <1913069.tdWV9SEqCh@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3215
X-purgate-ID: 154282::1740943365-1651689A-1939DB06/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1740943366;
 bh=kWoQsr4kKxDa5lZGM7J7vSxJ0ToK5kT0g8Q+El9aPMI=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=OMXIATqKvJhh3NXYvnxue3m9MkFosBxoRQlaN5Ukrn2eeIURh+zgwD1KKhgvlMiAl
 ganv/j2nn+ZFbueo+o0f/LmBs91jBIND8TEGwS8AbqyXreuJbqEGhV0GQUEposhKDy
 vjC4d241ZTs/wZQtd7+4zOzvR/jSRJ6KEnFtangJlvwOZSPqIEy8NQzPgoWPc1T8HO
 RA4NDLEQY9FREtc4eAEx4f2oLgmGOyfKhhLp6MgmKZ8OOX8MiB0FgXdx5uSraPmQ9E
 kOCsPkdDHrBxHpr47AY2uTYyRFLtxSx6RIHk5z5l2kT4oiu6SyjV+lFeaoGotqFl02
 kj/ONsCnuJkgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=OMXIATqK
Subject: Re: [Buildroot] [PATCH v6 0/2] Add board support for the
 BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain, Han and all,

I was able to have a look into the Ghostwrite issue: The author of the paper 
helped me and it looks to me that in Kernel 6.13 the vector extension is 
disabled via a RISC-V status register for the TH1520. And as long as the 
instructions triggering Ghostwrite cannot be executed from userspace, 
Ghostwrite itself cannot be triggered. I would still add some note about it in 
the Readme, so that someone does not activate the vector extension, without 
knowing the implications.

Regarding the Xuantie binaries license issue: I created an issue in the 
Xuantie github [1]. Han, could you have a look at it and maybe help that the 
developers of the repository add some more explicit note on what the license 
of the binaries is?

To me it looks like the Xuantie binary license issue is now the last thing to 
clarify. I will send another version of the patches once we know about the 
binaries's licence.

Thanks and best regards,
Kilian

[1] https://github.com/XUANTIE-RV/xuantie-yocto/issues/4

On Sunday, 23 February 2025 16:41:54 CET Kilian Zinnecker wrote:
> Hello Romain,
> 
> [--SNIP--]
> 
> > > I am not sure, but I assumed the Apache License could also cover
> > > binaries,
> > > i.e., such that they may be redistributed? Can someone shed a bit light
> > > on
> > > this?
> > 
> > If unsure, use XUANTIE_BINS_REDISTRIBUTE = NO like for the
> > amlogic-boot-fip
> > package [1]
> 
> Thanks, I will have a look! Maybe that's an option!
> 
> > It seems we have lost the provenance of this binary (who built it). The
> > xuantie project uses an apache license and the Debian image from
> > Beagleboard project provide its own version.
> > 
> > xuantie-yocto deploy theses binaries blob (light_aon_fpga.bin and many
> > more) from a closed source package [2].
> > 
> > Kilian, can you try to ask on the Xuatie github?
> 
> I already asked in the past via email, but they never uploaded a license to
> the git. Do you mean I should directly ask on the git, e.g., opening an
> issue for that?
> 
> > [1]
> > https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/amlogic-b
> > oo t-fip/amlogic-boot-fip.mk?ref_type=heads#L11 [2]
> > https://github.com/XUANTIE-RV/xuantie-yocto/blob/master/meta-light/recipes
> > -b sp/opensbi/opensbi_0.9.bb#L2
> 
> [--SNIP--]
> 
> > In Buildroot we can't track if an harware mitigation has been enabled or
> > not. It would be the same issue for Spectre V1/V2 etc?
> > 
> > At least, this topic deseve to be added into the commit log and probably
> > into the board readme.txt too.
> > 
> > Builroot defconfig are provided as the minimal configuration to boot the
> > board, not to produce a final/customer image.
> > 
> > You can add a note for the user about the "Ghostwrite" issue?
> 
> Yes, good idea! I already started formulating something, but I also
> currently am trying to clarify on it, so it will probably take a little bit
> more time before I send another version of the patches (probably few days
> or one or two weeks, let's see - didn't find the time to already do that
> the last few weeks).
> 
> Thanks and best regards,
> Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
