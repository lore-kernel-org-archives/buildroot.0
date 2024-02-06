Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BBCC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD078217B;
	Tue,  6 Feb 2024 17:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_fUqi5pZCVn; Tue,  6 Feb 2024 17:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA5782668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA5782668;
	Tue,  6 Feb 2024 17:46:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 865D01BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C3D961124
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C3D961124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8TV1v-mB5Nj for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:46:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A38F3610A0
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A38F3610A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06456240005;
 Tue,  6 Feb 2024 17:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXPX4-00EAX5-2D;
 Tue, 06 Feb 2024 18:46:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
References: <20240202233030.1192392-1-kilian.zinnecker@mail.de>
Date: Tue, 06 Feb 2024 18:46:54 +0100
In-Reply-To: <20240202233030.1192392-1-kilian.zinnecker@mail.de> (Kilian
 Zinnecker via buildroot's message of "Sat, 3 Feb 2024 00:30:30 +0100")
Message-ID: <87a5od5vu9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/radxa/rock5b: Disable FIQ debug
 interface
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kilian" == Kilian Zinnecker via buildroot <buildroot@buildroot.org> writes:

 > The custom kernel used for the Rock5B features an FIQ debug
 > interface which is enabled by default. As it is not needed, it is
 > disabled. The documentation features instructions on how to
 > re-enable it, if it is needed.

 > Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
