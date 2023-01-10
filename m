Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB2C61DB3
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC54181E10;
	Tue, 10 Jan 2023 21:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC54181E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyTKjdt1rm44; Tue, 10 Jan 2023 21:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB2081CDC;
	Tue, 10 Jan 2023 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB2081CDC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8D821BF86B
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 21:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B462481CDC
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 21:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B462481CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZs2dTqBgA1X for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 21:36:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39D4D81A23
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39D4D81A23
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 21:36:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69F2F1C0002;
 Tue, 10 Jan 2023 21:36:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pFMHx-00168d-Cw; Tue, 10 Jan 2023 22:36:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
 <20221004133057.2003750-5-aperez@igalia.com>
Date: Tue, 10 Jan 2023 22:36:09 +0100
In-Reply-To: <20221004133057.2003750-5-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 4 Oct 2022 16:30:56 +0300")
Message-ID: <87eds2kr7a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version
 2.38.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to a new major release which brings in improvements and a few
 > new features. Release notes:

 >   https://wpewebkit.org/release/wpewebkit-2.38.0.html

 > This release also includes security fixes for CVE-2022-32886,
 > CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:

 >   https://wpewebkit.org/security/WSA-2022-0009.html

 > Both building documentation and support for gobject-introspection have
 > been added in this release. Version 2.38.0 also introduces a new WebRTC
 > implementation based on GstWebRTC. Options for them are explicitly left
 > disabled to keep the configuration as it was, and may be enabled in
 > follow-up patches. Lastly, the SILENCE_CROSS_COMPILATION_NOTICES option
 > removed because it no longer exists.

 > The patch that fixes the build on 32-bit ARM targets is also updated
 > for the 2.38 release series.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2022.11.x, thanks. Just like for webkitgtk, it needs cmake
3.20, so not trivial to backport to 2022.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
