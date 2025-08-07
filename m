Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E320C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E51C60639;
	Thu,  7 Aug 2025 17:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEYnuo6GkIjy; Thu,  7 Aug 2025 17:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19AF60649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19AF60649;
	Thu,  7 Aug 2025 17:19:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7348E31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E08E40482
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0Kz7bz1wBSn for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E88D40463
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E88D40463
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BFE986FE1; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:02 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d5dd06fb070b0705a49b8a9b5c550e83e9d0c38d
X-Git-Newrev: 0cc802c363a32850fd2273a9083c67fc29c0deeb
X-Patchwork-Hint: ignore
Message-Id: <20250807171914.9BFE986FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/podman: security
 bump to version 5.5.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0cc802c363a32850fd2273a9083c67fc29c0deeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

For release notes since 5.4.1, see:
https://github.com/containers/podman/releases

The release 5.5.2 includes a security fix for CVE-2025-6032.

Fixes:
https://github.com/advisories/GHSA-65gg-3w2w-hr4h
https://www.cve.org/CVERecord?id=CVE-2025-6032

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Julien:
 - mark as a security bump
 - add link to release notes
 - add link to CVE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit faff38912b2159ad124034779c8664d8ea051207)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index 734042df95..b5802dd305 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c31845cbbc54a0b65c4afba224048c002b40e863c4ba7ca19355a8d333b3d19  podman-v5.4.1-git4-go2.tar.gz
+sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 7ca9b9ddcb..a7159fbd17 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.4.1
+PODMAN_VERSION = v5.5.2
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
