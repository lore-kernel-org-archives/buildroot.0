Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A6EEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFAC5406CF;
	Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmTDz1OU_JHk; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6092405A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697729;
	bh=rJURxLnGMEJ9X7elYJUGkTf77i14ib4A2nyGSzyrUHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UYNMsqRGnA0oDwaBRDYpEy2cu3T5EdhFB6BfGCNXcNhxsguCjDNgDBTo0OvQoUOqI
	 CHGWrjxjhVPgmz+zln3xiUw9P5O5rFa4wZh+esIccrl7aeDRj+UrssBwz58uA4rzcu
	 POiffOuStW/ZGVxAZJ2lbIwNaaCeroCLGlNMMO3ZXF0mH5drLtSC0G+nxcAsUkTNTE
	 jrxQ00Sjh/RJD5UlFZn2eercG02FPEsNqNDGyM6x0Lf4vNygJT5kebuh3P8KFdut+n
	 OHTbDilk05LXk5PKNf48QltmZzQ9rbZdk5+ePuZuTQh02VA/x6Obat4cFWYq6w5lel
	 ibtoOw93dprwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6092405A2;
	Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1621EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60084404F3
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXpnbdAUjkp3 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D703403B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D703403B9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55D2A85EEB; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 22:40:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ddb1a99968de9b9c328812ce39fae87f8a6e345
X-Git-Newrev: 101997e334efcbfd9bde3100ae75400177cfa56f
X-Patchwork-Hint: ignore
Message-Id: <20260305080207.55D2A85EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add support for binutils
 2.46.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/101997e334efcbfd9bde3100ae75400177cfa56f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceware.org/pipermail/binutils/2026-February/148149.html

" This release contains numerous bug fixes, and also the following new
  features:

    * Support for new instructions added to AMD, ARM and RISC-V
      architectures.

    * Support for version 3 of the SFrame standard.

    * The readelf program can now display the contents of Global Offset
      Tables.

    * Improved linker tagging support."

We bring and rebased patches 0001 and 0002 that we carry for binutils
2.45.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils/2.46.0/0001-sh-conf.patch         |  52 ++++
 .../2.46.0/0002-poison-system-directories.patch    | 312 +++++++++++++++++++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 4 files changed, 369 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
