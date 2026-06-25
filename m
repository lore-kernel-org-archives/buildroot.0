Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A5BC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFA26108B;
	Fri, 26 Jun 2026 14:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAHPyXKqAVx6; Fri, 26 Jun 2026 14:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0585061003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485535;
	bh=GsGutlrPhgw+ZSp//S3GbbbP5uZhyjOZiEEkO0swFmk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gfFykqDJHo14VCVttrK2DCfbOZdycmjOig78CZLOhcmwnsqAglNQXJUGwSlWGZWBp
	 6NrvVz876hjJqDPoQuKKAo9mIV4FOWTDancAVMavdTGD10NmW865RIoKe12umVzCYD
	 irjME3yADSbhtbGTnu98lhvg7sh5vIdX86cajFiW49Fv3JVKXzMa/rxNBrBTWfd72Y
	 uuubMGLiq+8C0cjpNl3BZ3bw1Ixqc4tmj5ABbHzTHJtiK5hIe2vHmfz7SPMPWJiWl2
	 JJJ4FtaFDlwwFk8MX4vly/ewSHP4DPPaF1ItavvZNVLG5ZWOWPKd/J0GjSVQz/5e8u
	 NkIbIiwQsG9HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0585061003;
	Fri, 26 Jun 2026 14:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D766A3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE5414071A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcDMxlt-kv-m for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF8E240702
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8E240702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C48668649C; Fri, 26 Jun 2026 14:51:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:35 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: dbe1e0f6ca99379a221757004e5b7163fb995276
X-Git-Newrev: cfb6bea3fff9d55305c981ded8323cb5e7c2826c
X-Patchwork-Hint: ignore
Message-Id: <20260626145122.C48668649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/tmux: security
 bump to version 3.6b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cfb6bea3fff9d55305c981ded8323cb5e7c2826c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://raw.githubusercontent.com/tmux/tmux/3.6b/CHANGES
https://github.com/tmux/tmux/issues/5109

Fixes CVE-2026-11623: https://seclists.org/oss-sec/2026/q2/934

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 28c6fc47b45dd219b20640efc201a15d72370bf2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
