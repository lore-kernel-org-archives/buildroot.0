Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99870CDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A70A411C6;
	Wed, 18 Sep 2024 16:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQNytQH66boi; Wed, 18 Sep 2024 16:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1915C411BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1915C411BB;
	Wed, 18 Sep 2024 16:50:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5FE01BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4558419D4
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Kn61Mn_Pn9 for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BA3D40D47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BA3D40D47
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1460E83B54; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:44:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 22208c646bb1255fea3462edb14cdc4c5ab12f29
X-Git-Newrev: 40030e1c6f090969f46fe5ed9afbfa4857450a17
X-Patchwork-Hint: ignore
Message-Id: <20240918165043.1460E83B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/unbound: security
 bump to version 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=40030e1c6f090969f46fe5ed9afbfa4857450a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit ed34c4c77b8b2a830c7a9ffb1d75c7bf1e35a7c4)
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
