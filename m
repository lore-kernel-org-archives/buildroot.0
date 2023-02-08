Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7527DC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 13:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01675610E5;
	Wed,  8 Feb 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01675610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_L17K7vs5Mw; Wed,  8 Feb 2023 13:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3778160FD3;
	Wed,  8 Feb 2023 13:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3778160FD3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76FCE1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5183460FD3
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5183460FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziivL17qhJzD for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 13:54:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D659560F6E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D659560F6E
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 13:54:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51B68E0012;
 Wed,  8 Feb 2023 13:54:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPkti-00GEHV-Ik; Wed, 08 Feb 2023 14:54:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220422214919.367067-1-aperez@igalia.com>
 <20220422214919.367067-2-aperez@igalia.com>
Date: Wed, 08 Feb 2023 14:54:06 +0100
In-Reply-To: <20220422214919.367067-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 23 Apr 2022 00:49:17 +0300")
Message-ID: <877cws5kld.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/wlroots: bump to version 0.15.1
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to version 0.15.1, and adapt to upstream changes:
 > - Adapted from the old -Dfoo-backend Meson option to the new -Dbackends
 >   one, which is an array. The set of always enabled backends matches the
 >   previous selection: drm+libinput always enabled, x11 only if selected.
 > - Removed the libpng and ffmpeg dependency, which are no longer needed
 >   with examples disabled (which is always the case for Buildroot).
 > - Changed homepage and download site URLs to the FreeDesktop.org GitLab.

 > This release changes the API/ABI, and applications which use wlroots
 > must be adapted and rebuilt. Currently in Buildroot we have only the
 > cage compositor, to be updated in a follow-up patch.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Old patch, but while testing the recently added sway package I notice
that wlroots fails to build with X11 support:

Found CMake: /usr/bin/cmake (3.18.4)
Run-time dependency xwayland found: NO (tried pkgconfig and cmake)
Program Xwayland found: NO

How is this supposed to work? We don't have a Xwayland package in
Buildroot, so no pkgconfig file. I see there is some fallback logic in
wlroots to look for an Xwayland binary (on the host presumably), but
that doesn't work for hosts without it and will again fail at runtime.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
