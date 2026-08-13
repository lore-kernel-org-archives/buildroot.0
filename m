Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1AEC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8D7540DA7;
	Fri, 14 Aug 2026 13:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cvd7iurrz-mK; Fri, 14 Aug 2026 13:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC03C40D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713714;
	bh=4IqJ5JtJDzJ5FGgarKBS4TwBDPiPbdeczxTAD5pip6s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OI6VdyFPcITfl+j2DVgrCgCUUjkXaMMG7iivmBszKvXblTLbo1TSMfQBebCofl1kj
	 PFfJV1NswN8NA9v8KD8XEc9/KsdOhAQgpyO9i0t/wN+Avj22R5Qfi7W678WIIrIZwj
	 bJy/5VnC3k2B9GPLoIY3BZe4CVWz4ox9Mf9BCnVfsmDlME+cZIuBYM6vxoUdQs/qj4
	 +8TL0JIOZVxcY+I7eiH8fr1vTEevjWryqmM7jAPpvbEccyplT8r4SXj53I1bfabQEy
	 vKapA4VhPoMpxzFlznhF1bkma4qvdMOquc2sZFbddDMfoEDFrz9H2+DM7HVD0MEppA
	 6i9H0Zdo6EkXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC03C40D55;
	Fri, 14 Aug 2026 13:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B32E139C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E585D80E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3f72SRNGEZX for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9832811E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9832811E9
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDCF18D665; Fri, 14 Aug 2026 13:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4e69061c7a8e9930cfa39ee1c3aa5c668f44e76e
X-Git-Newrev: e2a7b2b2fe3a7a533503e0753a82ead6b88fd8cd
X-Patchwork-Hint: ignore
Message-Id: <20260814132034.DDCF18D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/apr-util:
 security bump to version 1.6.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2a7b2b2fe3a7a533503e0753a82ead6b88fd8cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
CVE-2026-34502.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 209117f1dd8a833c8a588c6fdffcff30abb1eaf3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 7e2793cd77..b8fff95de6 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
-sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
+sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 477db1c593..c11957bc56 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.3
+APR_UTIL_VERSION = 1.6.4
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
