Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60F7CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E24D807FA;
	Thu,  4 Sep 2025 16:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kXBNt8BZL7c; Thu,  4 Sep 2025 16:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917EB807F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 917EB807F0;
	Thu,  4 Sep 2025 16:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C0E5B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21DCA4006B
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjBGgpQgjFGv for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A99340057
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A99340057
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2844087F46; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8af66709c705ad98edc165e738795c6150b02783
X-Git-Newrev: cd49292b2d8bb6f852ff425266ab8022f2b57c8c
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.2844087F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tcpreplay: bump
 to version 4.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd49292b2d8bb6f852ff425266ab8022f2b57c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Bugfix release, fixing compatibility w/ gcc-15.

For change log, see:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Peter: mention gcc+15 fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f80622f1cc33dc9f845d0fe1272a38788a789e9)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 6dc6e48f9a..4307fa60fc 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.5.1/tcpreplay-4.5.1.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.5.2/tcpreplay-4.5.2.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  5126613f783062b43f514b05ad981376050a8fee35b03c8de4445ddeefd95049  tcpreplay-4.5.1.tar.xz
+sha256  2df15bc6d49f96a77617d137049f998193bbae95c1a31b04ca02856a24cbf384  tcpreplay-4.5.2.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 17766707e6..32bcf8d278 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.5.1
+TCPREPLAY_VERSION = 4.5.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
