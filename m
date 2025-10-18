Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8515ACCD1A4
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB9B68331B;
	Sat, 18 Oct 2025 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSHLp2hIbb5v; Sat, 18 Oct 2025 18:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83938329E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D83938329E;
	Sat, 18 Oct 2025 18:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 222AED8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507D540904
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmfXLi5ROpol for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A91240995
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A91240995
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43C00874BA; Sat, 18 Oct 2025 18:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 18:41:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4bda5e952c4bb0ef56c59518cb82673a2e9acac
X-Git-Newrev: 4cbb39d4d2c2664b91c5862e2e3ec472c8194cb9
X-Patchwork-Hint: ignore
Message-Id: <20251018182103.43C00874BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: security bump to version
 5.6.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cbb39d4d2c2664b91c5862e2e3ec472c8194cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/containers/podman/releases/tag/v5.6.0
https://github.com/containers/podman/releases/tag/v5.6.1
https://github.com/containers/podman/releases/tag/v5.6.2

This commit fixes the CVE-2025-9566 security vulnerability. See:
https://www.cve.org/CVERecord?id=CVE-2025-9566
https://github.com/advisories/GHSA-wp3j-xq48-xpjw

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien: mark this commit as security related]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index b5802dd305..e52a353aa7 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a2cd66e33e1cabe34d11543c3fa68f9ebe7fcadbde578231d28745aa0f48a21d  podman-v5.5.2-git4-go2.tar.gz
+sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index fc9a989bf0..71eb26b496 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.5.2
+PODMAN_VERSION = v5.6.2
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
