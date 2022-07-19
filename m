Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A33C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA27F40C6E;
	Tue, 19 Jul 2022 15:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA27F40C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tV7uf6wnhjJr; Tue, 19 Jul 2022 15:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A235140C6C;
	Tue, 19 Jul 2022 15:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A235140C6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48F4F1BF951
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31A6E813E4
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A6E813E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jVdlM0YbRZs for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57259826C2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57259826C2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60DD583D05; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 16:59:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3678ad62f0f4392b063932d9786d87b3d165c47e
X-Git-Newrev: 3ff0a4ca5ed454ebadd7b8ba6bce6b631493adfa
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.60DD583D05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tor: security
 bump version to 0.4.7.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ff0a4ca5ed454ebadd7b8ba6bce6b631493adfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes CVE-2022-33903.

Release notes:
https://raw.githubusercontent.com/torproject/tor/release-0.4.7/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0e36d3a42ccbcc2757dece3edeed33ebef020894)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 8f37dd6219..dd1edfa97c 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.7.tar.gz.sha256sum
-sha256  3e131158b52b9435d7e43d1c47ef288b96d005342cc44b8c950bb403851a5b44  tor-0.4.7.7.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.8.tar.gz.sha256sum
+sha256  9e9a5c67ad2acdd5f0f8be14ed591fed076b1708abf8344066990a0fa66fe195  tor-0.4.7.8.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3b470a80d8..0e4bb553e2 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.7
+TOR_VERSION = 0.4.7.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
