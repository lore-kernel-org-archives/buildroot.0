Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8AEC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF56A41DE9;
	Tue,  6 Feb 2024 15:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF56A41DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZiW6r7_G6OU; Tue,  6 Feb 2024 15:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AEFA41DA4;
	Tue,  6 Feb 2024 15:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AEFA41DA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 330941BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B53B41DA4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B53B41DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wknioQaGaDcn for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:04:30 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp4.osuosl.org (Postfix) with ESMTP id 325A541684
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325A541684
Received: from pirotess (unknown [85.119.216.19])
 by iodev.co.uk (Postfix) with ESMTPSA id 64DFB29093E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:04:26 +0100 (CET)
Date: Tue, 6 Feb 2024 16:04:24 +0100
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Message-ID: <ZcJKeHM4KgSI_AVY@pirotess>
References: <20240206145353.19868-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206145353.19868-1-ismael@iodev.co.uk>
X-Spam: Yes
Subject: Re: [Buildroot] [RFC PATCH v2] docs/website: Add Makefile to
 pre-generate the website
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/Feb/2024 15:53, Ismael Luceno wrote:
> Supports the current includes plus smu [0] lightweight markup.
> 
> [0] https://github.com/Gottox/smu
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

Changes from v1:
- Processes includes before passing through smu
- Still imperfect because smu mangles many html tags

To do:
- Maybe special-case html header and footer for smu files.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
