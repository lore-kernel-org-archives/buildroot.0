Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC32AE7C715
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9844584238;
	Sun,  1 Feb 2026 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYquFmScYrol; Sun,  1 Feb 2026 09:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8569E84220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769938050;
	bh=fSE/1kuiPgdCg/pTQpIVjAL266NhjkR3V8MEJzCY/Q0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EhNY/j4mpdUeGgOCHWkXb1I4uAY2rKJRPhvf5CdA9APpoIGRawr5xEzBmTqOKFRdI
	 84Z22DWGCYF6aqukvZy5Sa6zxRy9cdoXZ+ACr5BUvexM7LbFDyjdDq1clg98PWQLE0
	 cduRfjahsBqMhbe5QJ9XFP69J/Sc64lt8DAIuVYJU4GzYzutbPaQy2y9s3B7UkAMcQ
	 /bLlqhp5HxECsHrqdHwWaw9zPdRvhYLi2q5WtOV9Ke/M+Gj82g/Vav7sZQ7jFVzFm7
	 L9jIKRSAtWM9SYyJzaM+q1u5TLHDxdZx3wCWihfa27j5rI1iiR5npy2oaFmmCt2I5b
	 eqBnSG2wE1YQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8569E84220;
	Sun,  1 Feb 2026 09:27:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B16B70E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD5C40834
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPXjmPwd-NGw for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7503140832
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7503140832
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43C7786112; Sun,  1 Feb 2026 09:27:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 10:22:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ce07d07db0b293e447b85c12d23543660fbd21a
X-Git-Newrev: b16009c06d9a62bd0ad036918f0cec94ba367f25
X-Patchwork-Hint: ignore
Message-Id: <20260201092725.43C7786112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.8.22
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b16009c06d9a62bd0ad036918f0cec94ba367f25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://forum.torproject.org/t/release-candidate-and-stable-release-0-4-8-22-and-0-4-9-4-rc/21160

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.8.22/ReleaseNotes
"o Major bugfixes (security):
   - Avoid an out-of-bounds read error that could occur with
     V1-formatted cells. Fixes bug 41180; bugfix on 0.4.8.1-alpha.
     This is tracked as TROVE-2025-016."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ea15ddefe6..eeafd49058 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
-sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
+sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 746eacd581..c0785ef2b1 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.21
+TOR_VERSION = 0.4.8.22
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
