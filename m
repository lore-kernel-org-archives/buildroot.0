Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF0D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF23C837C0;
	Tue, 13 Jan 2026 19:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIohl8kXCUzC; Tue, 13 Jan 2026 19:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343A183705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333014;
	bh=9VmvPzFkRpZyK+wEubOXr6WsG8j1nR0CIn5NDAifg80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lJJAUNGNSvZ7gMdj3fpK7uJb80PRazBfTvhyNC58iSDGx8xWbwm6MfHphCcZJm9GQ
	 g2hyVHuhWxUiP8SifOM4VmG5+oSmwVfZoRngXMiAzjqJ3+t9uYhGteXMRoQmjL3KY/
	 scUweA1gOzVL7PsLoPifA3+rHfeLL4WljHc1qi3zo6BtiBMeFFZC3TvretDLoJbx/w
	 w0qDamwCyepsHi5s/Gdgjb8IKFRBwrDjc5928m32I10E40jP0KGsRKKiiV9DNfPG55
	 NJ2H2d8rZa0zHN6f8s/QMpfaytS3J+iaHBXcBWo4/OSceuqPYYkEIgVY4cFWnpN0Dh
	 Qhzwu3dot+/Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 343A183705;
	Tue, 13 Jan 2026 19:36:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4D71C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D38D82CE4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krCtj_1mrXG8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B38F782BF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B38F782BF5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1C8786E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0bb1063b5443a0def920ccbb0e48671bd987ba1b
X-Git-Newrev: 7dd431c0d82ff363c64fe181a8b1b0419d29520b
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.B1C8786E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnupg2: bump to
 version 2.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dd431c0d82ff363c64fe181a8b1b0419d29520b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For release note, see:
https://dev.gnupg.org/T8001

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 611ad8e88c615f74c20dcd31340392f51320995e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 01060f897b..ee37e6a3af 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
-sha256  b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  gnupg-2.4.8.tar.bz2
+sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
+sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index debf15ef63..d083ea850a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.8
+GNUPG2_VERSION = 2.4.9
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
