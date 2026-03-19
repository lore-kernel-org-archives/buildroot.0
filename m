Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34827F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05996821F1;
	Mon, 23 Mar 2026 19:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usORQFGtGZGW; Mon, 23 Mar 2026 19:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2152082207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295263;
	bh=60jWcfmxMyaxElzHCxfkP7K6WGN+CN+KZUqUiC5pqWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZzlqrF3Ic8m5P0RleZmpYQjpTMBBoLE3DplSz/XEWegKZ9KaDFITl6DSsINwP8Yb8
	 zfNeiZPJPWJQYmGgLPtAylMN7TsqTg/4tQfYOLVP9kFjztGDtbqmtGmZO9IVvLrJ8H
	 SdtpfxVXrAFj1Sv47n+Oq02xuv7linHKxZxT6LIrexNBs+PQK53vZ3+zK4clCCpv5s
	 VWvTQbldQ6XWKjQgjUUQSG6o8xpqVbY4R0LAOlvMEPBkQwa6kUV8ehmD0Ep9oNudPR
	 sDC2NxdCEn5DlmEXT9GOr/U8nGHQAx4+Fdk6ehUu/dxNuqQDXCUvXyAwV+d1Btajxd
	 NRWf8aaw+9gmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2152082207;
	Mon, 23 Mar 2026 19:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3F0F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E788E818B5
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDv9XV_42oJ8 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B704821D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B704821D9
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B986984BCC; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:09 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cfb1f6344848a94864d3bb8add40c82ed2ffce49
X-Git-Newrev: 8ccf7b3887e641c0fa83fc2eb74f356c52a099a6
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.B986984BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libarchive:
 security bump version to 3.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ccf7b3887e641c0fa83fc2eb74f356c52a099a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.6
"Libarchive 3.8.6 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d950ff24888ed48cab96582b9389bda7e0bff6e5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index db7ed95bd9..be357183e2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
-sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
+sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f3e90e5910..3b8fdbae1e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.5
+LIBARCHIVE_VERSION = 3.8.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
