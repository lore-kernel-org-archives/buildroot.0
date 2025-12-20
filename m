Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D8E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D35BC60DC3;
	Sat, 20 Dec 2025 15:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WonGgPfKwOK; Sat, 20 Dec 2025 15:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 815096073E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766246026;
	bh=e21fpJuXc4Zh2+28svWI4n7i9Mf2laoglm6v5PzkNWU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l8eOfKos0U7n5o0dmJkPbvjWm0j0M4mD7m/eovgFd4sHhfPEPmWjM2402Wc8FJ4Iu
	 xsXZk10Bj702PLmmhk8QvM+xRan4Cs+7rOY4nBooHbCQYmcs+DCu8+7+Cr5oG+Rbp0
	 qL/owAPuCT7tyBpB0RsUPBjc9p4CGzo0tL0shaz59zyqMIg67XdyRjQkYDgz0k/gRI
	 klnu9D+cHI/MOD/sHyCvC8Y2tx6beC5y2rXZz8pwUYfcf6um5cMELXcDYYoDJLBA0x
	 uz4RTNz8PL1Edl9Joo0vVTfLfeB5KwOFpBvWzgb/ovPz1Uw/cFaD6iYBNnp+OV2/nN
	 72iAbzSK5KJag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815096073E;
	Sat, 20 Dec 2025 15:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB92B1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A188F6073E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o3cKrfmizQa for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F4760739
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F4760739
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:53:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9250A87519; Sat, 20 Dec 2025 15:53:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 16:48:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1d159c5d5dc00233c74a2bc24994bc194e4e177
X-Git-Newrev: fb57257e385b2aef41c0bb72ad8df6a7b86012e2
X-Patchwork-Hint: ignore
Message-Id: <20251220155343.9250A87519@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: bump to v2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb57257e385b2aef41c0bb72ad8df6a7b86012e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - Add support for Porkbun DDNS provider
 - Add support for domene.shop (Norwegian DDNS provider)
 - Add support for round-robin records to Cloudflare
 - Add example config for DuckDNS IPv6
 - Cloudflare: omit proxy setting if unset in config
 - Cloudflare: omit TTL update if unset in config
 - Simply.com provider fixed and re-enabled
 - Support for long ddns-path requests (increased buffer size)

Fixes:
 - Do not use an IP resolution method different than the one
   specified in configuration
 - Fix support for Namecheap
 - Fix Dynu IPv6 issue
 - Default value -1 not used for ttl setting
 - Fix IPv6 detection for providers with "v6" in their name,
   e.g., ipv64.net and dynv6.com
 - Fix dnspod error: "Communication with checkip server failed"
 - Fix cache directory creation on --help or --check-config
 - Fix cache directory not writeable and no $HOME

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index eb5249e371..f6e07a2e30 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
+sha256  411a999420d825eb79998b6db84936d0dff7baa07510cb4a9c65aa4eae0d42c0  inadyn-2.13.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index fa2eedc1f3..a8891debb3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.12.0
+INADYN_VERSION = 2.13.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
