Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 23:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5404860A86;
	Sat,  4 Dec 2021 23:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDOXuoKIwwYD; Sat,  4 Dec 2021 23:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD9B860A6A;
	Sat,  4 Dec 2021 23:00:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BBE21BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF41B605C9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMyhRV22yxsF for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 23:00:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5683660A6A
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 23:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 102F29362D; Sat,  4 Dec 2021 22:55:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 00:00:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4a57a86e60cb5b705a9a8885da6edea874b8a24
X-Git-Newrev: 7bd6ed208c234d0a0a065ce13e0fe9a5f438e9ba
X-Patchwork-Hint: ignore
Message-Id: <20211204225557.102F29362D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfat: add EXFAT_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bd6ed208c234d0a0a065ce13e0fe9a5f438e9ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/exfat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index e23495152e..282a30aa5e 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -10,6 +10,7 @@ EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
+EXFAT_CPE_ID_VENDOR = exfat_project
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 EXFAT_CONF_OPTS += --exec-prefix=/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
