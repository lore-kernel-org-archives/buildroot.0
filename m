Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5158DC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11D960B55;
	Mon, 27 Jun 2022 22:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11D960B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG8UoFT_-ioE; Mon, 27 Jun 2022 22:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E185A60A6F;
	Mon, 27 Jun 2022 22:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E185A60A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACDC1BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8772282BC8
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8772282BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEeKW5c9yi7B for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:40:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D071582BEB
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D071582BEB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B7F3876FC; Mon, 27 Jun 2022 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:34:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77bf0a1e630da4d9c597cd92c9f2c49b6738da31
X-Git-Newrev: cc66cf922b0481b66011b171db7985a27c79c381
X-Patchwork-Hint: ignore
Message-Id: <20220627222807.6B7F3876FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpreplay: security bump to
 version 4.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc66cf922b0481b66011b171db7985a27c79c381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2021-45386: tcpreplay 4.3.4 has a Reachable Assertion in
  add_tree_ipv6() at tree.c
- Fix CVE-2021-45387: tcpreplay 4.3.4 has a Reachable Assertion in
  add_tree_ipv4() at tree.c.

https://github.com/appneta/tcpreplay/blob/v4.4.1/docs/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 8bcdae958c..32bfd219d4 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.3.4/tcpreplay-4.3.4.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.4.1/tcpreplay-4.4.1.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  42c055106e55852c29d94bb6e1b9e001a0723349f2985eb893a47d384c85002b  tcpreplay-4.3.4.tar.xz
+sha256  51f70ed14be5913f19c25cdfa530e98c14cedab1c76fbdd26eca7b61b57344f2  tcpreplay-4.4.1.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 9f2da6439b..86894e468e 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.3.4
+TCPREPLAY_VERSION = 4.4.1
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
