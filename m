Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08ACC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D8360B99;
	Sun, 30 Jul 2023 10:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79D8360B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZaIP_IoI0cj; Sun, 30 Jul 2023 10:59:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95D660A97;
	Sun, 30 Jul 2023 10:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A95D660A97
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D64A1BF2AF
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9F9140138
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9F9140138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyICBhTnRbWU for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:59:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C20F340354
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C20F340354
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3E4FFF803;
 Sun, 30 Jul 2023 10:59:34 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:59:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230730125933.300a5188@windsurf>
In-Reply-To: <20230103200046.96070-1-ju.o@free.fr>
References: <20230103200046.96070-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690714775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JN9sBF9+0ZAPS0M4j4oE8NC8h03AIc7l8T/QdxTexJQ=;
 b=N44pPXwXFReDlxd97WwDVH1Y3r0mzoL1S8KJmWzi2VxFOeDn8p8DWvIiicdvxRF262e2fG
 wdQ4hcG5pxjo29AKnxqTCxjHuVKFFj1bbjLQipXdkOvke7l7kKp7I40VMrQeqtlvvTVNwZ
 Qr5QpT+GJlkXurah1LIn2HFCyYseTUgV+vfkErQODCEFMp/6hdVYHFA0yTqq3HNhVMt9Re
 ZDpMOMIwDaJE0t51GNl4BiZusGsXfxtb8bpP7+2WsDbBOoxSfwZhANNhUzSqsvD2jYel1M
 rFXvTLSaXlXxmSWTtp30JhXCNQxYH621WFb0Ndk14RhImPlOEGdgNDgJAVF25g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N44pPXwX
Subject: Re: [Buildroot] [PATCH 1/2] package/python-midiutil: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  3 Jan 2023 21:00:45 +0100
Julien Olivain <ju.o@free.fr> wrote:

> A pure python library for creating multi-track MIDI files.
> 
> https://github.com/MarkCWirt/MIDIUtil
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit e593656 with commands:

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
