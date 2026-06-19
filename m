Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3DACD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 22:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFF76F9D5;
	Fri, 19 Jun 2026 22:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHRVy4dXSlVN; Fri, 19 Jun 2026 22:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1B86F9D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781909418;
	bh=WOpCHajpAD8xOxvpht+aOlyqVhpUca0l3Y2Z6TPZpJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gjjID5Yh91hufNEBRmfiMSUjuE0lLwtBpes7IB62PEQJGAMk4aYI3/zRNHv2uuqFa
	 +J8nQJiVZEUpOf5pO4+3ca2htfc1EIelz5rU4XQWTFC6vbQ3mHj9dbJYlHen43hQzm
	 QGeHSORu3ZxhCbAsgRar5L/NAXMV0w5XWuup3vfql7hPemq1LMdpKgZJwFNh0WBAks
	 Jpf0QEu5MdHfCbhB9WgaltJeteeKcWfVAnIpYA/oHGO6R2GLL9CAgVG7NpSbxzYe62
	 EyK6WLXTC+cL9vy0mYpWHvcKmGlaR12TYf8/vQkTA19Qujk9aJyRp2W935ov5hL/UD
	 H/9bJG1lOnNCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E1B86F9D7;
	Fri, 19 Jun 2026 22:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E0752D7
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B91A4ECEE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB6K6FEPjiAb for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 22:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D804ECEC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8D804ECEC
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 22:50:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C47B6818E3; Fri, 19 Jun 2026 22:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 00:32:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f39a9ba291db640ec5171fb9a14b1ff7c69d186
X-Git-Newrev: 28c6fc47b45dd219b20640efc201a15d72370bf2
X-Patchwork-Hint: ignore
Message-Id: <20260619224952.C47B6818E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: security bump to version 3.6b
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28c6fc47b45dd219b20640efc201a15d72370bf2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://raw.githubusercontent.com/tmux/tmux/3.6b/CHANGES
https://github.com/tmux/tmux/issues/5109

Fixes CVE-2026-11623: https://seclists.org/oss-sec/2026/q2/934

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/tmux/tmux.hash | 3 ++-
 package/tmux/tmux.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index 867fbd6c55..34419940f3 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tmux/tmux/releases/tag/3.6b
+sha256  390759d25fdba016887ec982b808927e637070fd7d03a8021f8ef3102b9ae3c7  tmux-3.6b.tar.gz
 # Locally computed:
-sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 1f98cad706..b435c62a8c 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.6a
+TMUX_VERSION = 3.6b
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
