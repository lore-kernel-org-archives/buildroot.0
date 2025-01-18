Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54FFC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64595410DE;
	Sat, 18 Jan 2025 11:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQvjGzhWQmKb; Sat, 18 Jan 2025 11:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280844123B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 280844123B;
	Sat, 18 Jan 2025 11:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BE22F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EACB56071F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnznuhock7Bm for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02A9E60645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02A9E60645
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02A9E60645
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:43:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F336260004;
 Sat, 18 Jan 2025 11:43:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tZ7Eb-001GsT-1D;
 Sat, 18 Jan 2025 12:43:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>,  Bernd Kuhls <bernd@kuhls.net>
References: <2e74286729fd798109e9c067c28e4a17af8522ed.1736521850.git.yann.morin@orange.com>
Date: Sat, 18 Jan 2025 12:43:25 +0100
In-Reply-To: <2e74286729fd798109e9c067c28e4a17af8522ed.1736521850.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 10 Jan 2025 16:10:50 +0100")
Message-ID: <87ldv8s5ya.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gpsd: python support needs pyserial
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Usually, ubxtool, a python-based too lto drive u-blox devices, connects
 > to a gpsd instance and delegates to it the responsibility to write to
 > and read from the actual device. This is sane, because a serial device
 > can only be opened once, and if gpsd is running, it has that device
 > open.

 > However, in some cases, ubxtool can be used to directly talk to the
 > device, to pre-configure it before gpsd runs, or even in the abscence of
 > gpsd altogether. This is not used very often, except when setting up an
 > RTK base, where gpsd is not needed.

 > In that case, ubxtool will directly talk to the serial device. It uses
 > the pyserial python module. Since this is not the traditional way to
 > talk to the device, failure to import the module is ignored, and the
 > error reporting is deferred until it is actually needed, which is why we
 > did not catch the issue earlier.

 > Fixes: f3ef0723cf71 (package/gpsd: enable python support and modules)

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
