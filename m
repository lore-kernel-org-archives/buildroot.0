Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10C7D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C1C81448;
	Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVsPQpQ7q1bY; Sun, 28 Dec 2025 21:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DCA8144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955627;
	bh=i2EvktkbjvnD2ugHOwgYqQtL25i3ZSwr4/RgPmmd/ZM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ho4PeHV4WRnQkqcI31ruWjBvz3unnVprR1lLxdLRXbCGRT7XJcJIIiSTsCMI+yZ/R
	 zUtaTVVxMDDKrkPX4kzAtzF1YQSxeZQuK/SAKsXr45929guQwnrmysXEiHHkC1AQT9
	 j8etYpdizwp9Egl91fKEOY9wqP0lEhz7qGVKR23vKE6Jo+8NB1BFs2lZ+56g4ht2mx
	 hq7PBUROEPfeBFyEpB9kmJ3l85mEI7V8DNHy8hrMU8AoVZqgfRYdE8DwpekwyMu7hf
	 jW+QvI+lghRB/FIUZa3tDSgu4iwozus6bl48iV1c3U7Mg2hU34I1FQ/Zy54xe7dfOy
	 G0fpBUOGJAcfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75DCA8144C;
	Sun, 28 Dec 2025 21:00:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EFAED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157F1401D7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnXOgjzVu52b for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5316240191
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5316240191
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C18811B3; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b656345ecb8353a788f809a2aeca5c580fa0d8f
X-Git-Newrev: f2e442a14d93fc99ab31e8eea96901500862f28a
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.40C18811B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2e442a14d93fc99ab31e8eea96901500862f28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fixes for the CVE-2024-24258 & CVE-2024-24259 were introduced in [1]
and targeted the package libfreeglut.

The patches that fixed CVE-2024-24258 & CVE-2024-24259 in libfreeglut
were removed in Buildroot commit [2]. With this bump the IGNORE_CVES
entries for mupdf were not removed.

[1] 0f4fef076f package/libfreeglut: add upstream security fix for CVE-2024-2425{8, 9}
[2] b1c77090ef package/libfreeglut: bump version to 3.6.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mupdf/mupdf.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 6b666033eb..9eecb84232 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,12 +21,6 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
-# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
-# Fix is in libfreeglut, but CVE applied to mupdf.
-MUPDF_IGNORE_CVES = \
-	CVE-2024-24258 \
-	CVE-2024-24259
-
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
