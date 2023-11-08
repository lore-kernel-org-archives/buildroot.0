Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F275FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1B681B23;
	Wed,  8 Nov 2023 21:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB1B681B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUgegtTW3e1S; Wed,  8 Nov 2023 21:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C338C82023;
	Wed,  8 Nov 2023 21:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C338C82023
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 469B21BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BC1400FB
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71BC1400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYr9BYaVpra1 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6584013B
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6584013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A1BB86D63; Wed,  8 Nov 2023 21:10:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 21:18:50 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 0431681d7b11ddbc6b46cf4a83ab5e0bc231c572
X-Git-Newrev: 27694094775a2d6aab4a78099cb573342cf874f8
X-Patchwork-Hint: ignore
Message-Id: <20231108211053.4A1BB86D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/tor: security
 bump to version 0.4.7.16
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
Content-Type: multipart/mixed; boundary="===============3209272796704123452=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3209272796704123452==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27694094775a2d6aab4a78099cb573342cf874f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes a yet-to-be published security issue TROVE-2023-004.  From the
announcement:

https://forum.torproject.org/t/security-release-0-4-7-16-and-0-4-8-8/10064

We are releasing an emergency security release fixing a high security bug
affecting relays.

This is tracked by the TROVE-2023-004 92 for which we’ll make the ticket
public once the packages and network has started to upgrade.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a6b5f27c40..c8d551d95a 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.14.tar.gz.sha256sum
-sha256  a5ac67f6466380fc05e8043d01c581e4e8a2b22fe09430013473e71065e65df8  tor-0.4.7.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.16.tar.gz.sha256sum
+sha256  5aeeb071bd5c12eb2eec140a87f94052ecaeb03b5e1cee7d1e5cf1a3cbee7a7c  tor-0.4.7.16.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b794296c6a..0273db042d 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.14
+TOR_VERSION = 0.4.7.16
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

--===============3209272796704123452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3209272796704123452==--
