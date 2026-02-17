Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB329E9A04D
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4F7409BF;
	Wed, 18 Feb 2026 20:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCAgxlIv9LZL; Wed, 18 Feb 2026 20:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908B5409AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771445310;
	bh=5927Gh4qt8EmuQVSSQ8Zzf4KSWLyzYV7KlhtdAxMUGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lbMChefYoyxvQRoZsIGSYsYkaJchtopVieBKnYNMousmBOURF66rurnnlfBUUNJnG
	 zwJsjKgloI67yhzzD82cGyNrA+swkaxrXcEoGKgpW/aWClfST1/nsru0G2B++ulTtG
	 R0beMHzylNWcQEfys4pXPPN8mewN/i7Ms/FcQtlxUeFgcFhcuLRPilQBrP9mBOpr4+
	 FthRoMZd9R9DnblXrcQS6d57hKl4Sq1wbc9L8ctli6v788SI+Ewa10RHHy1l5Wl/GD
	 e8y3BymjIdkA4RanmKoD+y7W8RLekEEOPl0Rgy14Iz8C/1UFVYkSayuQzxh2aF0DGq
	 EnStO5Efn2f7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908B5409AF;
	Wed, 18 Feb 2026 20:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C613183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 051A660871
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FamYgIVlRvGu for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93F4760AB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93F4760AB3
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8342886FFC; Wed, 18 Feb 2026 20:08:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 22:44:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3b592bd62076ac0897b7862919aadf767ccffffd
X-Git-Newrev: e0c14c083a930e2dbe63bcc1cf5ed453e858a742
X-Patchwork-Hint: ignore
Message-Id: <20260218200826.8342886FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: remove
 support for binutils 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0c14c083a930e2dbe63bcc1cf5ed453e858a742
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Now that binutils 2.46.0 has been introduced and binutils 2.45.1 made
the default version, drop the oldest supported version, binutils 2.43,
keeping only the 3 last versions supported: 2.44, 2.45.1 and 2.46.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                                   |   7 +
 package/binutils/2.43.1/0001-sh-conf.patch         |  50 --
 .../2.43.1/0002-poison-system-directories.patch    | 307 --------
 package/binutils/2.43.1/0003-objdump-memleak.patch |  31 -
 ...-std-gnu23-compatibility-wrt-static_asser.patch |  90 ---
 ...Warnings-when-building-gprofng-with-Clang.patch | 801 ---------------------
 ...-std-gnu23-compatibility-wrt-unprototyped.patch | 619 ----------------
 .../0007-gprofng-fix-build-with-std-gnu23.patch    | 199 -----
 package/binutils/Config.in.host                    |   4 -
 package/binutils/binutils.hash                     |   1 -
 10 files changed, 7 insertions(+), 2102 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
