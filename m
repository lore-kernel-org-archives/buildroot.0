Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD3C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D4060B32;
	Sat,  5 Nov 2022 20:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D4060B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0djNxuC9c93; Sat,  5 Nov 2022 20:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85AB560AEA;
	Sat,  5 Nov 2022 20:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AB560AEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3B41BF371
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76FB8607C0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76FB8607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jv71l1vdbNUl for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:03:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311A6607B0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 311A6607B0
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:03:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62174E0008;
 Sat,  5 Nov 2022 20:03:33 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:03:31 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20221105210331.2d1aad17@windsurf>
In-Reply-To: <20221104151242.2735240-1-vfazio@xes-inc.com>
References: <20221104151242.2735240-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667678613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQCmsgU7fi+TPH1rUuol/gMouHBnTAi5Kd4rDmRcRbo=;
 b=Kax1YXGaneO151h+TWCzO37u7nv5C5xO4XJS6TjQVQehW+vvJWrMKbhXTPS6oVCdRl/YoC
 mtPFFQHzOruoCkNLNFyn2i8kvPDTMnRmrLOKcIcSUzjsKPWb1xcIRC2LfmjofE5eICvU4M
 aJ7AS7McxtInraD5ZXJeIuEFg6tSdpqNJksNgKrGWZHPaF2wf/VHbVTfoudDNuvkzdCe4T
 bPItxk7lc0auUGCNmrbiLso9rNwTbHoqWsxQPQfir/cKLWtbj3y5jPIdivEbgY8oPBs+a2
 nT4RVgkdVevnxqP98qQOeANM6wv/+x0x695HPffYQjvd7n/Fw6F+Clapqw4ETw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kax1YXGa
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: specify SWU_VER
 during build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Nov 2022 10:12:42 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> The swupdate build process uses SWU_VER as part of the build commandline
> for compiling objects to define the value for use in globals.h (see also
> Makefile.flags).
> 
> This value is also used to communicate capabilities to lua handlers
> (see upstream 0f38ff186e76c55c8d00ccb53739a29bcca91445).
> 
> When swupdate gets built, SWU_VER defaults to using `git describe` to
> determine the version. This, unfortunately, picks up the version of the
> Buildroot checkout and not the actual version of swupdate.
> 
> Now, specify SWU_VER as part of the make options to override the
> calculated value so the proper version is reported.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/swupdate/swupdate.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
