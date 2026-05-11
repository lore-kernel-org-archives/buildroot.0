Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52979CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A35580D7B;
	Mon, 11 May 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3GIuP7B9hXy; Mon, 11 May 2026 19:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E838380D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778528276;
	bh=zq4gnVIkDysuZgMUyo9TCjrckhsmGz8KT54OH9v4fCc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S3wq8P/4m+hJKDGunzrDAvZeSBRp2G7X8DvM0jiMAweHclvcQI3DZ4YeshRhv3C47
	 GWM6gVBsDHXk2DAoCrppjiWtqVIZWnhFHIOtF5S0+6Iy44OI7ssOIO0qowMTSBE69Q
	 v2FaevHKaWOCXn/6Odgd9zb2XRpRhWgzBvIT899CWLzD+6eXuT85RRy/aZAVTGwvmC
	 N6n08tzHNIF2CDUB04R8vhCSsJSBaWP4kghWMZ30H8uFlawVCZ8CFz3sZ14hbwmcg0
	 9QUkfKHW9hGpX3/8rtNm6ZUmzkNYYLZ+zLDIWUGtpJUsgnzHihZtgo6A6iT48JCAym
	 GJDFRrMFNzd8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E838380D2E;
	Mon, 11 May 2026 19:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7508A223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ADF7400F6
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDk0HAsk8_jM for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE32D400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE32D400BD
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:37:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04BFB85E55; Mon, 11 May 2026 19:37:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 21:33:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 262db97f122f0ab231927bd63e252bd8343b0311
X-Git-Newrev: 44f60e9f708ff01ee9b4631b252923cab11c79d5
X-Patchwork-Hint: ignore
Message-Id: <20260511193750.04BFB85E55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dos2unix: update upstream URLs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44f60e9f708ff01ee9b4631b252923cab11c79d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The old upstream page [1] is being deprecated. It currently shows:
"""
This page will go offline on 1 July 2026. Go to the new page at
https://waterlander.net/dos2unix/
"""

This commit updates the homepage, download site and hash file URL
to the new upstream location [2].

[1] http://waterlan.home.xs4all.nl/dos2unix.html
[2] https://waterlander.net/dos2unix/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dos2unix/Config.in     | 2 +-
 package/dos2unix/dos2unix.hash | 2 +-
 package/dos2unix/dos2unix.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index cfb5ba4b79..928605ae37 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://waterlan.home.xs4all.nl/dos2unix.html
+	  https://waterlander.net/dos2unix/
diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 720a457ce0..d70bc6c21b 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.5.tar.gz.asc
+# https://waterlander.net/dos2unix/files/dos2unix-7.5.5.tar.gz.asc
 sha256  75f692b8484c8c24579a2ffd87df16b9c9428ed95497e3393a21d1ba0697ac33  dos2unix-7.5.5.tar.gz
 sha256  e09d0709ac6a24d995565989267f2e097325778ed47738ee889a7124bc89a3ef  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 99454aa2a3..9ac53ce838 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOS2UNIX_VERSION = 7.5.5
-DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
+DOS2UNIX_SITE = https://waterlander.net/dos2unix/files
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
