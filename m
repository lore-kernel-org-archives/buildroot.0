Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8537C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED746129D;
	Wed, 22 Feb 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED746129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtW6WFlDM3s4; Wed, 22 Feb 2023 20:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96435613BA;
	Wed, 22 Feb 2023 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96435613BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4D31BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 383598202F
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383598202F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7_DFnLrDo2R for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:59:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B588202C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3B588202C
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50DB0240002;
 Wed, 22 Feb 2023 20:58:56 +0000 (UTC)
Date: Wed, 22 Feb 2023 21:58:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222215855.32deb357@windsurf>
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677099537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXz0Z16W1W0wIVpPS+4H38eJR06Zgre47UlfmAriW/U=;
 b=g2h9dL3Z6c0EWLG9zabZUeLMxlOH1N2Hrh+UJ7z0NZB2yHhz20jAG49VAenXI/jFu2NndF
 SUKPGGs9DfchGdvoFYCoETcLdFVxIreDu3aYVDwDGPn1iyNt02XjV+OMtCFzemLoY0YEBG
 785f2w2YhsjNE0mOA9UC1rMi2Fbl/rCC8dKJFK4PnBf51TDohcIOFrnn6Rs+rQ/t0oiaDS
 s81/1n927O0l2l3oBynYIRZ3DlzbF6rXmZzcw3HvPgC6pKnY16RKDmWoIKyN7jjZtqaiUW
 mkaw1L0x6pERsP5abjsCsGNpmpRcRWS4PWOkF2MlSl20tkMYuK6+NXmYZT8DRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g2h9dL3Z
Subject: Re: [Buildroot] [PATCH 1/5] package/gnuradio: drop unrecognized
 volk variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 17:05:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Volk submodule has been removed since version 3.9.0.0 and
> https://github.com/gnuradio/gnuradio/commit/80c04479da962d048d41165081b026aafdaa0316
> 
> orc dependency can also be dropped as it was only used by volk submodule
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/gnuradio.mk | 9 ---------
>  1 file changed, 9 deletions(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
