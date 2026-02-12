Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4BFEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC8B84764;
	Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYmhnHczoZjK; Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA3E84759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011482;
	bh=1553z1BMzZJXywnldyQ7atP24eBR9zNWdA92i/j25mo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QVa9iABkQs6qbWHQMMo7an7GNczWEYJj5vYuuMheu2JVrW7FEUfCa3BPvt059RT22
	 qT4pC3HvtamVozeLjRNaoFqxaxNRfle/h/PCBwWpYNjeeYthRr9xPKCWqJhKihIAXS
	 Wm0WTSPxQx+pbPO5ap17KBqzOyS0KNu9j6zejt5+9SFwOVT1viZiFPTrQ7igE4Me5W
	 3/lZb41mM82+s5c+W3kZXNE7UHHOKmif+33o1w5Dgv/mB7Tw2H5g49+Z34qrqQyrmF
	 axsoagZOsdgaBhjSzi0Zt2RUZHgx6/q6vdnC3zpki5YGJqNkS5qlG/Y5M7xLMVS2s2
	 3rRTMGC83mTnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA3E84759;
	Fri, 13 Feb 2026 19:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D13EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C79C6413D4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE8SpdI59v9J for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6938C412DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6938C412DB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E3C683593; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:35:51 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b871e3e4b1386d3813fb56af32c65c7fd50eb3c9
X-Git-Newrev: 292c8cf89023748ab7f8b6c816f2ba3c38bf37c3
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.5E3C683593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dc3dd: needs
 host-bison
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/292c8cf89023748ab7f8b6c816f2ba3c38bf37c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:
https://autobuild.buildroot.net/results/f11/f11b0b9154e9979f3f2d7ea84a019f7719565e8f/

    ../build-aux/ylwrap: line 176: bison: command not found

The build error occurred already in 2024:
https://autobuild.buildroot.net/results/dea/dea779bbbbc08c7192f89073b93db768c41832f4/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a22fca0055e09b05c3ec402d1d69b5463253a5d7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dc3dd/dc3dd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index c31ab9e1f3..e9cb6ec7ac 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -10,6 +10,7 @@ DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
 DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
 DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
+DC3DD_DEPENDENCIES = host-bison
 # We are patching Makefile.am, so we need to autoreconf. We also need to
 # enable autopoint as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
