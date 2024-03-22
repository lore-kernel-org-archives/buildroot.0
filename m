Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA66C6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A21860FF6;
	Fri, 22 Mar 2024 20:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SawypemRxynf; Fri, 22 Mar 2024 20:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9458C61004
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9458C61004;
	Fri, 22 Mar 2024 20:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 174951BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 039EC61019
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQwO3-azKIi9 for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E663260FF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E663260FF6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E663260FF6
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:11:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F4C5FF802;
 Fri, 22 Mar 2024 20:11:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnlF5-006FW9-1s;
 Fri, 22 Mar 2024 21:11:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240318222408.287597-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Mar 2024 21:11:55 +0100
In-Reply-To: <20240318222408.287597-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Mar 2024 23:24:08 +0100")
Message-ID: <87jzlu10xg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: bump to version 17.0
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop three upstreamed patches
 > - This bump will fix the following build failure raised since bump of
 >   webrtc-audio-processsing to version 1.3 in commit
 >   ef0fa986eb7ff25c0a5db70ec0b62032e2d71538:

 >   ../output-1/build/pulseaudio-16.1/meson.build:723:15: ERROR: Dependency "webrtc-audio-processing" not found, tried pkgconfig and cmake

 > https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/blob/v17.0/NEWS

 > Fixes: ef0fa986eb7ff25c0a5db70ec0b62032e2d71538
 >  - http://autobuild.buildroot.org/results/528717c7481adbb5333d77758ef94830f46bc3f1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
