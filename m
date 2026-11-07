Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354CB606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NFT2CRkC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00A6180F22;
	Sat,  7 Nov 2026 11:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9KX8K7D4fEj; Sat,  7 Nov 2026 11:12:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D46B80EC7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794049962;
	b=ZxUy5F8WMCkQfAWh8tQ0HlfvCOeSLh7xR0DT7xQrQDyaHYwHnrEeKCmCRCOf114Zev+s
	 rKvX3tcKQBwDDbe/hdhlY4ZK4U07FgHG3EgcePvPIXD539L0+1ynO9Qj0LmExISwd7EEL
	 62Z8RRwpHfEMLRlFGp7bbqReop+CZYHVZmKHqCFv7u2uUe21KOrbDZIq/sdlEgX18pWzA
	 07xfax0hUAAbOM+NA0yDWnSOLFG3+iCdspd+mbSFiiC1FO0Y8JH2Tc9rRSZ7BlYBqarz8
	 kCS5bEcairG54oCyrxuNIGiQ1U0l/ihiTp6s/hfxIEDKf5JPxO6nIflJW5ZcntDH0Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=e1DgEiTLXxRyFa7NB7ATs4mHup2SgnhU35axV4seysI=;
	b=LmdJG78FAbJ8rAfV2ZTU3GtFOqb0rh2O2JJWt/dX1cyYr9RjWHZIRY076hwgtwNw4/48
	 RA9CMkwd9biWncuVItkcqR+SJlP+vr3QF9Y52kUa+ff4csv5mFbaPUuAdEq9AfdKt8UDF
	 4DDD/bteK/QAwWzUrTUGiZ4rHPLNTo3BE/CUAaSjoudQ2Eif5XvSKlcWBTSisJo9BlOK4
	 Ng5T7gvBTPP7C9tLXtiaRau9ykkzTrbZK7bjrYI8rNBP6pnAXVVh82ElmjiB0T+zP087o
	 To1LBMQaQqv1FzhhNuIsTofS3D24ApiALHR1aFaRtXBTJjHUZPrdWzGzMoNyZDrqhAA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794049962;
	bh=e1DgEiTLXxRyFa7NB7ATs4mHup2SgnhU35axV4seysI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NFT2CRkCGK/HdTlD8c58+mpm5epYXDotsLE0IjIGjQE4MytJh89zOJoBrVdHWtVhA
	 gGN/jedDxpIBN55L6GbxHnJfyPO6roKaC8Ebh7PwUaGeZgVBkwX4HGoMeFWleRDvW0
	 9JrFlBzjkL98NQXJG83+mToQT6PvZEAY2hFUduRQgNRCukq+0TELFcuV7VfoE94NE3
	 amlYpSeTD2lv4LR2AAvaC3+GMTnyQvb9jOnFZD7KVQCo2SlyGF6+hmOzQOyfGRuMYd
	 PirpaeJKQOv60AVgnEdeB+7gtnfZI2Kojcv6gBS7ug4ERc8Z5QyKcOh1RO/s9PiVtE
	 GjeUAoPSnXYVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D46B80EC7;
	Sat,  7 Nov 2026 11:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D487934D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9D314009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrPSHdEjYV04 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0AA324008C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA324008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B902F8B6AF; Sat,  7 Nov 2026 11:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:03:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f67f27cce2c1fca2fa61669d2502e72dcb51156
X-Git-Newrev: 17ba755efd2884e538b9677cee818e02a02c20f5
X-Patchwork-Hint: ignore
Message-Id: <20261107111105.B902F8B6AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect:
 bump version to 22.2.11-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17ba755efd2884e538b9677cee818e02a02c20f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/xbmc/inputstream.ffmpegdirect/releases/tag/22.2.11-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash    | 2 +-
 package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index ed22d4a27a..a347fa9942 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f72d027b0aafe9e7734ca83e88e83dd038ea4c9b912dc6c53dfadbcfdb069468  kodi-inputstream-ffmpegdirect-22.2.10-Piers.tar.gz
+sha256  969295fbec985a940a32ec94cfcd224d27b54618e98fa84a6ee29f5de12c8f7c  kodi-inputstream-ffmpegdirect-22.2.11-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 9b050512ce..c0c99ccbd1 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.10-Piers
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.11-Piers
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
