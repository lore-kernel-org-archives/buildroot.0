Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A3C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 16:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2879B402D5;
	Sat, 24 Aug 2024 16:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJmIT1zmhnTM; Sat, 24 Aug 2024 16:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2ACC402E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2ACC402E7;
	Sat, 24 Aug 2024 16:38:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D61EA1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C516860646
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuIRsDAZNuvC for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 16:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1A7605B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E1A7605B7
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 16:38:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86BAA86016; Sat, 24 Aug 2024 16:38:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 18:33:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0d23b47393e0133b76437a274f724c16a7d7e2d
X-Git-Newrev: ed34c4c77b8b2a830c7a9ffb1d75c7bf1e35a7c4
X-Patchwork-Hint: ignore
Message-Id: <20240824163831.86BAA86016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: security bump to version
 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed34c4c77b8b2a830c7a9ffb1d75c7bf1e35a7c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2024-43167: A NULL pointer dereference flaw was found in the
  ub_ctx_set_fwd function in Unbound.  This issue could allow an attacker
  who can invoke specific sequences of API calls to cause a segmentation
  fault

See announcement:
https://nlnetlabs.nl/news/2024/Aug/15/unbound-1.21.0-released/

See also change log:
https://nlnetlabs.nl/projects/unbound/download/#unbound-1-21-0

This commit also updates the _SITE url from [1] to [2], to follow the
HTTP redirect, and the url published on the download page [3].

Finally, this commit adds a comment in the hash file that the PGP
signature was checked.

[1] https://www.unbound.net/downloads
[2] https://nlnetlabs.nl/downloads/unbound
[3] https://nlnetlabs.nl/projects/unbound/download

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Peter: Mark as security bump, add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 7 +++++--
 package/unbound/unbound.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 96ee80b0ec..ba876299c2 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.20.0.tar.gz.sha256
-sha256  56b4ceed33639522000fd96775576ddf8782bb3617610715d7f1e777c5ec1dbf  unbound-1.20.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.sha256
+# After checking pgp signature from:
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.asc
+# with key: EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D
+sha256  e7dca7d6b0f81bdfa6fa64ebf1053b5a999a5ae9278a87ef182425067ea14521  unbound-1.21.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 6ce6f9a1ba..8677cb4d4e 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.20.0
-UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_VERSION = 1.21.0
+UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
