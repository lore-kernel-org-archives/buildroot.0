Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72618EE49A3
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 04:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F024090C;
	Tue, 22 Aug 2023 04:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F024090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfstguTMJAtV; Tue, 22 Aug 2023 04:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA7340912;
	Tue, 22 Aug 2023 04:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA7340912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1F8C1BF36F
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C786E60A64
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C786E60A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDxHzecdJksn for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 04:07:17 +0000 (UTC)
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65805607F1
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 04:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65805607F1
Received: from [211.234.197.211] (helo=pony)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1qYIfh-003HSo-EN; Tue, 22 Aug 2023 05:07:13 +0100
Message-ID: <2a15628f8d76880c9099dcc2527bbfdfda69da62.camel@codethink.co.uk>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:07:08 +0900
In-Reply-To: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
References: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
Organization: Codethink
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mesa3d: Allow building patent
 encumbered video codecs
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
From: Tristan van Berkom via buildroot <buildroot@buildroot.org>
Reply-To: Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Fri, 2023-08-04 at 20:12 +0900, Tristan van Berkom via buildroot
wrote:
> This patch adds some options to allow building the patent encumbered
> codecs in mesa, such as H.264/H.265 encoders/decoders which are
> useful
> for hardware accelerated decoding via libva/gstreamer.
> 

It's been a couple weeks and I've been following the mailing list, just
a friendly reminder, please let me know if there is anything wrong with
this patch, I've tested this and followed similar patterns found in the
mesa3d.mk and its Config.in.

We require H.264/H.265 support for hardware acceleration in our
gstreamer pipelines and would hope to see this support in some form in
a subsequent buildroot release rather than maintaining our downstream
patches.

I filed an issue about this today:
    https://bugs.busybox.net/show_bug.cgi?id=15736

Kind regards,
    -Tristan


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
