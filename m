Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2F6D6CFA7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 12:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC1C4098E;
	Fri, 23 Jan 2026 12:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io3M8ay-7Ink; Fri, 23 Jan 2026 12:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BB140A08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769171705;
	bh=jJcNQxlZY8OSbm7Ccqnt4mylYZ8Xiltn4dUzL9Vmz+E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XvSoAenfpSphrPE7jueAI0MFpqV1B2vz4pcxyKWfORDJnDSQR0Vf9vjRSscLseIvj
	 wFdgibQw4+wfevkd4XUDw0ZakTEHh2biaxGVLFS8R2vx5+5of4i2XwhtCPQv6WejdE
	 GhZHUY4wyb2SSHFJmjMxuSGWn0BJgrXKegazaR+46ikRf+ebf0djz8/pd3UrZvkfmP
	 DgZEdc0yJdhFwaJkbiQOzgqFBSA6ffRggqdT4+Imo4Z4ddXRAl0CAjpFt/HF2DOW8E
	 ua5Q2MG4V1/ESimJgYRMXVAXwuWn7qrxVwZ872rUiL/OVBCU+gl5f2gfH5AIi1Ugkj
	 kUO+5yZBgm3lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35BB140A08;
	Fri, 23 Jan 2026 12:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEAFD23F
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCB7A40404
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60EOlf3wgRcb for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 12:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF72403FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABF72403FF
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9877C86163; Fri, 23 Jan 2026 12:35:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Jan 2026 13:29:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb556b1e1f5cf356cae34276837c39f26ce67329
X-Git-Newrev: 80fa53a9ee40f6b6bd9956f9abc37cbc3a2c6217
X-Patchwork-Hint: ignore
Message-Id: <20260123123502.9877C86163@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 12.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=80fa53a9ee40f6b6bd9956f9abc37cbc3a2c6217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/harfbuzz/harfbuzz/blob/12.3.1/NEWS

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 3 ++-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index cb5b63507c..c5ac08c615 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,4 @@
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.1
+sha256  3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07  harfbuzz-12.3.1.tar.xz
 # Locally computed
-sha256  8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7  harfbuzz-12.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 5aed4e31f9..c0cdd15367 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.3.0
+HARFBUZZ_VERSION = 12.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
