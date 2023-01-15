Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1588C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4923A41718;
	Sun, 15 Jan 2023 21:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4923A41718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ng787nkN2LO; Sun, 15 Jan 2023 21:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CB441723;
	Sun, 15 Jan 2023 21:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CB441723
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B226C1BF398
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9A160FEB
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9A160FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWjs0U9zi5r1 for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 21:08:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4119C60C0B
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 21:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4119C60C0B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F91187BA6; Sun, 15 Jan 2023 21:08:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:30:26 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 752fd5060a13e79f3be4b72bce068197eaed7c9a
X-Git-Newrev: aab29257d470ace3b223c8bb3978c5683c4d1a3e
X-Patchwork-Hint: ignore
Message-Id: <20230115210855.2F91187BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tor: security
 bump version to 0.4.7.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab29257d470ace3b223c8bb3978c5683c4d1a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Changelog:
https://gitlab.torproject.org/tpo/core/tor/-/blob/main/ChangeLog?expanded=true&viewer=simple

Fixes CVE-2023-23589 aka TROVE-2022-002:
https://gitlab.torproject.org/tpo/core/tor/-/issues/40730

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit beeb4a2aad034d201a13caecd9ddbfb19761beb1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 2a2953dc29..51892f15c3 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.12.tar.gz.sha256sum
-sha256  3b5d969712c467851bd028f314343ef15a97ea457191e93ffa97310b05b9e395  tor-0.4.7.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.13.tar.gz.sha256sum
+sha256  2079172cce034556f110048e26083ce9bea751f3154b0ad2809751815b11ea9d  tor-0.4.7.13.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6812005618..03bd998708 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.12
+TOR_VERSION = 0.4.7.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
