Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEEFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4247041EEC;
	Fri,  6 Mar 2026 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8AKxFnjYDMC; Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E17541EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826686;
	bh=1Fk3unyGChewPN3J+Ai7J8xODLb2Q42ldnjDlGfkrzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LaXPh0H8tKHlxzkksAc7zZDgk6IIgbfi8ux9wuTEr+Dn5BloLZX3WHaiInQHuyAKD
	 hGRojVn0NSW7fVP4QDW4zYYTM8KZfrhvhR9KFS9jTAcXpKVHY+Yhv6tIo3ByNLro4y
	 oLF9NBQ3qOlc1/0tjHDKfDec64nAnEztd+vVrVLXDXNwzfKpuLT1lAdWkjVpSMNemy
	 HQIKarqQ792M4vJ636hyEmqpnbotUascur61z8LyTsjuZZuT0OkKmZtUSXTRgVfP+D
	 AbD9UX/+9jcmUhW4YINJxU6JZBvOM0I+puFbxi4LHTkR4jzBsTrOStvmxK08n6+0pW
	 cz0td4K928xxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E17541EEA;
	Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4A425B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC93E613E9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mo0U-gx8FmDZ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2324E613ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2324E613ED
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 384AF80090; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:15:04 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c44241892e6a705a01e987f863c4d0d6ddf448a8
X-Git-Newrev: 30e89e9983f8441b47c3c51c00d69775f09e3bea
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.384AF80090@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/freerdp: bump to
 v2.11.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30e89e9983f8441b47c3c51c00d69775f09e3bea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

For more information on the release, see:

- https://github.com/FreeRDP/FreeRDP/commit/9b678b6d5a40ce01607d8c3b1b1416437c8416c4
- https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.8
- https://github.com/FreeRDP/FreeRDP/compare/2.11.7...2.11.8

Note: the previous freerdp version 2.11.7-18-g0ee17e2f in Buildroot
is only 5 commits prior the 2.11.8 tag. This is a very minimal bump.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 73861bb720a82316cb56e644fc75d3a7ce95980e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.hash | 2 +-
 package/freerdp/freerdp.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 83b83db121..5ae222e2ec 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
+sha256  8a7c953ece217aa4fa22c4a21ab2bc4c9093fc79aa67d3e1273c140d140203f7  freerdp-2.11.8-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3a1ba61621..07b9d36339 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# Latest, and probably last, commit on the stable-2.0 branch
-FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+# Latest, and probably last, release on the stable-2.0 branch
+FREERDP_VERSION = 2.11.8
 FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
 FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
