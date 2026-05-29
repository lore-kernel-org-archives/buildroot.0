Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FDCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CD780DAF;
	Fri, 29 May 2026 16:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAiNlacKo2v7; Fri, 29 May 2026 16:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB5C80B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071262;
	bh=OM1/LTcapu7fyZEalKvPm9PqOHyE4v8A98pAhPk67Ig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MPdgja6nKlkwQ+/L0Z6K2RQPeuGnPEdy28qXOXJTtTerc8wINxQLYrBVCFP3lTyLv
	 fNv1qafszUWLXh1BbNus5PoG5+dJ0maSOsYUXG+OCaFUIGRhdPnTvi89QKvrXG6BAe
	 hOITa4wlW46v9dnvBzHCcjWB7fSpwjFHVuxVPNUy7ruchSbO0F6rKQeW7l3B+MID0a
	 treKgWam6mIhfNwvNFqlp494V9+53tLceAQD3h5+fJTyqES/WkHfEYYYFoPVG6X+Ud
	 6HqCbGIzeBZ5DmaiohyusdL9G5b6DPq92b9oPnsLeS+9AX17lTkHVlmGaPNKQHyfIT
	 a0mBdSXXxVmDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB5C80B1B;
	Fri, 29 May 2026 16:14:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FF1F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43860841F8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mShXatL-3i_b for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C14C841F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C14C841F5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7D9F873EF; Fri, 29 May 2026 16:14:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:13:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69dbd64802e5714bb9622e9de185e6d9984fa996
X-Git-Newrev: e9785d96e5778d9e82a96fee4c9587ef358a6230
X-Patchwork-Hint: ignore
Message-Id: <20260529161405.E7D9F873EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: security bump version
 to 1.11.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9785d96e5778d9e82a96fee4c9587ef358a6230
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/signalwire/freeswitch/releases/tag/v1.11.1
https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.11.x-Release-notes/

This bump depends on the bump of libks to 2.0.11:
https://github.com/signalwire/freeswitch/commit/4bc49f57b733e699a508aa51b83a16f09bf505dc

Removed patches which are included in this release.
Renumbered patch 0004.

The following mods were removed upstream:
mod_isac: https://github.com/signalwire/freeswitch/commit/6286c51ff6e8d5bd5859e46d7ce4be427b7a63f0
mod_yaml: https://github.com/signalwire/freeswitch/commit/74c64339556362ab70e99976a90aca54e31b2c27
mod_portaudio: https://github.com/signalwire/freeswitch/commit/49e63f6fffc6962ecfe762c57aae0c1e5bcc5096
mod_soundtouch: https://github.com/signalwire/freeswitch/commit/d912e9fb011298acb790663ca075e845c3740e9d

Renamed configure option to disable python support:
https://github.com/signalwire/freeswitch/commit/3a53566eab5793c8c2daf9e44e10d8a4a572aa69

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/freeswitch/0002-ffmpeg7.patch              |  206 ---
 .../{0004-ffmpeg8.patch => 0002-ffmpeg8.patch}     |    0
 ...l-build.patch => 0003-apr-fix-musl-build.patch} |    0
 ...xml_int-mod_xml_rpc-const-compiler-errors.patch |   35 -
 ...-Fix-compilation-against-2023-06-02-spand.patch |  150 --
 ...ix-memory-leak-by-correctly-freeing-regex.patch |   34 -
 .../freeswitch/0006-Move-project-to-PCRE2.patch    | 1813 --------------------
 ...07-Fix-double-free-after-upgrade-to-pcre2.patch |   27 -
 package/freeswitch/freeswitch.hash                 |    5 +-
 package/freeswitch/freeswitch.mk                   |   30 +-
 10 files changed, 4 insertions(+), 2296 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
