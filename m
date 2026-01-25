Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90037E63CA4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C727816A3;
	Sun, 25 Jan 2026 21:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMb2miUcpNTI; Sun, 25 Jan 2026 21:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5578581583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769378342;
	bh=CI3osiIrvdVSwCO7mo/m2zDSIP07cVPIqL4HOdhsGBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CWYNEp3mGxB5bIG/X8c/dLeZNxyCvb7nSFeqfSHlW3y4XQRoJrBxfpXQF/iVXGJdT
	 j1CIyMf7X0wUaV4pV9b4FmRjmUZYfiTs8YBeOO8UKZuT8rXRuZtHIU1SLO1tPCv1y5
	 asEiBHdKhlV9Iu2LThPM+V9GW0hQGFMcc90mbH1BKOHHUTmhmDqTJT3IKrx6RudSMv
	 NoSo5IqkeyL525PHE1EGC61Uw9pBMe/XBwDC/0wK7jhdkZeCnfmDG1e8w9E4JRTXGG
	 d/XTPu5srmeONUBvpOpJl9zLgNF+ET5TRheLeAkyhtRk2a0EbmyNK9E6/AhM+gAJ/+
	 /QEc+Xwr5CFGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5578581583;
	Sun, 25 Jan 2026 21:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A48A35C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBCA1401DA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAtLjakvRfOs for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EF3A40085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EF3A40085
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AF46876F6; Sun, 25 Jan 2026 21:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 22:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42411aa324f5e70dc42e9b83824cb8758207158a
X-Git-Newrev: 38e2dc8bee4d5f08e3a7bc1826c6c73e221cd75e
X-Patchwork-Hint: ignore
Message-Id: <20260125215859.0AF46876F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 12.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=38e2dc8bee4d5f08e3a7bc1826c6c73e221cd75e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/harfbuzz/harfbuzz/blob/12.3.2/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index c5ac08c615..57643c8318 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.1
-sha256  3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07  harfbuzz-12.3.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.2
+sha256  6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8  harfbuzz-12.3.2.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c0cdd15367..787f42d820 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.3.1
+HARFBUZZ_VERSION = 12.3.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
