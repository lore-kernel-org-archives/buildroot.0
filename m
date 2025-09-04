Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FFCCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E583940590;
	Thu,  4 Sep 2025 16:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu2JJ-PppzLX; Thu,  4 Sep 2025 16:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1967E405E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1967E405E9;
	Thu,  4 Sep 2025 16:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A28AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 668B56063C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIM0nGmEaI8V for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F104560635
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F104560635
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF30F87F4B; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:13:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3e14a3d714cc9f0910ad0bd918c0f6ee4528a765
X-Git-Newrev: 2e81a3282ae318d975dc037142dfc6670902a2f7
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.EF30F87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/tcpreplay: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e81a3282ae318d975dc037142dfc6670902a2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
