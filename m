Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF0606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RNzwcCCG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6B5606C9;
	Sun,  1 Nov 2026 16:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjQMTGfwkklJ; Sun,  1 Nov 2026 16:57:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E2F1D6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552237;
	b=O4LhBmYJZLjyCerUFxiR4cVVQP6yfk8nHO22pnh7rMrN8jWruGKesJCBSBbK7pVawkoF
	 4XSuPCRWSaljSzZVqR7xkttZF9ERlZ32ljEokoPeWZ302HT6KjZ+UCCZZWT1L+RqvOxC1
	 WjiTmobApl+Ql8tKK5EO/OLNzI1BJ1/XTQY1VMSRPqZoISdvjddtjqnElkz89feRVmlJ1
	 NolPmoCpnUuyQ71rkmwNXyIgoZuyA+9BNUPG0kwFYxC8LngPAot5ywEGhPo3N3na3HWzk
	 IescjhacXE2sgIki2Rg14mJS0QlpsOZZIR+ea78Fb/qZuj6OYVTqq/51SWV+n/ZXLOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2XwiTDMutINI1rpX+3nJ4UCi6YQqDKhT4O49et9jOr4=;
	b=o18ngjXhqYsG3YbeS3f2lA/VG9LxJWMwX/Q1CyXggIRT3HG+EK54w0YVbnlnupVedPDM
	 GUZXrTpyIaiRFJmEpsfEGyH3mEXQIwMPu0A53NUAusYV21zRvMo1L2EmvzEUzSWYIyvYw
	 Xkx6I1rDTOYO9p0/2YqitoyHTEt2v2MW+uTl47c55suynDa9ScaPBtcy0BbMEsq6ZcHPD
	 vCkgXqZRTQCbvcbCT5AAQbN9PaBnIqGBuDfpnDlLS4e1J+9L+SwsRpvFw70E7QVSQglso
	 O5YGFMCfJ3eXBDkkFHisrOJDSq/GV4ugt+eesrg6QhVlkRSCMQ8wdyRYkqOGuGZDN3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552237;
	bh=2XwiTDMutINI1rpX+3nJ4UCi6YQqDKhT4O49et9jOr4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RNzwcCCGsuSz2B27wxYcDWZiJ85S+Uj2XOY6tL/bUg5a9XoLmkg0jvyLxYA7Eo50Q
	 x3A+cMvQ6wfcYk89zjJVdCf6nRo+PRcY0vMkjew591lwCQBoXs/zCyOOoLt3hTAdxJ
	 8DADBgl3SNAsdqb7v3acOVIbnP5EFO62nZ2VTQHYZB3pj6fp5fnoNTxu/JPe8kx6cQ
	 q3SFkSVYlj0VOtwDjQSDPAYYunep+IJKXSz8W4pe84gsZ2UVw1UQn6XCGJ+QhEYxpO
	 cf2aUCkazF8/VzMRGmBsatMZEuX6ykI+0j4vRcN7iVSr1S8GARt3Mg5tZRiK1KvODT
	 2vHRuEi2Nobmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F1D6061B;
	Sun,  1 Nov 2026 16:57:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4FAB2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B674C400AE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEocbvNh0P4W for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0F30240076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552235;
 b=FG52oZKqzHopd9WUkQK44rLPCOb0yCe0/0oLYv9bUgjZct+j146y02WX48/lrqVPFKxK
 +Z3LbMCjwFAtCk//Nzbrh5SVc92tPv4dBIWQXVKnovY/SnzBuDDGyseIiiQLZocKw1FcK
 WJq1pR9Ck8uaFiRlRzr1VePcGkSqU0mUxZWFTQgzhiNQxfp9+nTa7FcxIJa1MRknhgRn3
 1uihqqYQ6HG7siOLJ1ptjKMLfKVfGlHkai8X1ysh3RDaqqjMKu73H+ofTY9PlClFcBni2
 Zwx1IsTD0Z61ZjdeaijZ8whhJJS8OqNbxvlQHIPQdO7NXmz27nHlVepLA787mlXkO0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552235;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JnBwKkN9QYJd6L59o4i6D/r1lrvysf5xDJtNILcv+a4=;
 b=gW8pe24j8moN5aIPg66Pzgfq+CpgzEwi4OUFKxyYt7vQdBrpyTf4mXDctawNyfzG/s0O
 Z5iTwgJDqOFhB2z+QaQsqfEbzMcTVqHl7KFDQg6lpwAh5NPVLLR/wP6iConudz3ouEQXj
 MMlUSfV6/1o4frqc39EWOCopNHa1iB8F7hXV9TTNqHxLoKJ4XPeN0c6o8eMWiuU61C/RW
 9f9w6iilqLCWoD+YlaUtPNF9fqcaIPDB52FOpjE374d+3hEaiOjtiMphi3YMIEE+GvObx
 lCmRH0Dn0hijVJGNQnT+1Jj8EGJ8BiKm97PdJxsPXyZO0JSjbE+Koz9dSJLicUeKeWQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F30240076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2D9C9D42B; Sun,  1 Nov 2026 16:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c4f14c9d65ce61f22277be0844c12af9c6b4913
X-Git-Newrev: 1488abeb5b9288c3ac85cec5d1b0938b08c8c2d0
X-Patchwork-Hint: ignore
Message-Id: <20261101165545.C2D9C9D42B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump version to
 v0.7.2-167-g8fe1f4514
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1488abeb5b9288c3ac85cec5d1b0938b08c8c2d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The releases of libcamera-apps and this package are not synced feature-
wise. To use the newest release of libcamera-apps, version 1.14.0, we
need to use a git tree newer than the current release 0.7.2 of libcamera.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index d1d7576533..1caad4f40c 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7c5728f6a51d717542cfdd2ff368ac78fa2e50e8a7360a38bb37952e9293e008  libcamera-v0.7.1-git4.tar.gz
+sha256  58864d3ef4f14661187ce9871e2a2d38d6f0e89c76b6beff2f663021130359af  libcamera-v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 256909ebc8..03c31eabb8 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
-LIBCAMERA_VERSION = v0.7.1
+LIBCAMERA_VERSION = v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
