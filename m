Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC942EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2691481130;
	Thu,  1 Jan 2026 17:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxZgupav9X79; Thu,  1 Jan 2026 17:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A674480F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767289008;
	bh=4FnhIisyPL86TUbdVeYb/5q9Jui7FOyrV8rVfX5wo/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qbjS2QiR/r/iWhwDrpPpVEXx85DO/dWp8n3ScKhhgjl1DMW/v1cY5z7HsKAAUKHGB
	 27B+wvUzPGmKY7HemesHOMuBj+5WGFtffSMGckiPbhHFr2xzkfeLx3dykxyVWcnoQT
	 gTlIlatcrtpkq4nWO020Vj6zqLZXu7nn87U2GDbwTYLEeJrUg5HauGQoNc2SYcLZnN
	 gHi2gal5i37fO4HZKMjZdup5MuiChCb8npbESJXAK+qZEn/Kya1Rh0Onm9SPpiAG8e
	 fdhfD+AEnz4iJ1RhH3/dQypR8oQfDq7P3Hz8O/U9K8qKvB80ih+Vt4KX80snm4c/fP
	 OTOVOz8VsbKBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A674480F1C;
	Thu,  1 Jan 2026 17:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 507A8206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D124020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HASRmrnxo5Uj for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A0E400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63A0E400F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:36:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5490787E5F; Thu,  1 Jan 2026 17:36:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 18:36:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b5aebc085661c958488125fe1a794e5813d254e
X-Git-Newrev: 802392055a950defdcc2c63161ae59556c8edf58
X-Patchwork-Hint: ignore
Message-Id: <20260101173646.5490787E5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softether: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=802392055a950defdcc2c63161ae59556c8edf58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the increasing number of patches applied for this package and the
lack of updates to fix the build issues as well as updating the version
to newer release. This patch removes softether from buildroot package
list.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |    9 -
 Config.in.legacy                                   |    8 +
 package/Config.in                                  |    1 -
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 2107 --------------------
 ...eate-libsoftether.so-and-dynamically-link.patch |  133 --
 .../0003-use-fhs-install-directories.patch         |  307 ---
 ...orking-softetherd-for-upstart-and-systemd.patch |  218 --
 ...xeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch |   90 -
 package/softether/0006-cross-compile.patch         |   30 -
 package/softether/0007-iconv.patch                 |   28 -
 package/softether/0008-librt.patch                 |   33 -
 package/softether/0009-uclibc-ai-addrconfig.patch  |   27 -
 package/softether/0010-use-bool-from-stdbool.patch |  167 --
 ...ix-implicit-declaration-of-function-getch.patch |   34 -
 ...-implicit-declaration-of-function-freetap.patch |   31 -
 .../0013-fix-build-on-freebsd-version-140091.patch |   55 -
 ...-properly-set-value-for-hub-admin-options.patch |  193 --
 .../softether/0015-adjust-types-of-variables.patch |   93 -
 ..._IKE-fix-too-many-arguments-to-function-N.patch |   54 -
 package/softether/Config.in                        |   33 -
 package/softether/softether.hash                   |    3 -
 package/softether/softether.mk                     |   37 -
 22 files changed, 8 insertions(+), 3683 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
