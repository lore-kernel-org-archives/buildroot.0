Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB8D3749B
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E062860D88;
	Fri,  5 Dec 2025 20:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35u3yoSOmL1l; Fri,  5 Dec 2025 20:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D7061B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967628;
	bh=GzL2vScsjYtHCphBj8LTf5c6u2xSwB/kJXi6ZUtXYLA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b6dkieA7f6i62rQxj3t7Xdf8hg4QCIRV8QA9L9eej09mML0wfKxclZvP4dYSfv+at
	 uNeiBJOKB/5ZHzI/dyZAOA/wzq0NBKEwSSu02J0JY0trTYqjIZP/+w772Rte7G4s9+
	 sp0FJ0PzKv6bb20s/ZOHYGotSJwlhhxAGBlSFsFtXqd7ZVrwuKUFH+4MDumGhVKpqf
	 cjiV+JcvodDfJAHdlhbfJaRJWwmk3RNibP0d8mvKhYunUQ+V2LwHpOiFUFmiJkMahd
	 s2mhS8/V2WQBqy8tLCNMs6DkSLECcEGdf/n5EksOqbv9Mad/PzQPteiEGUVSX7cC2g
	 mFqYigTEI4CWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D7061B7F;
	Fri,  5 Dec 2025 20:47:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A52BFE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B9A284BC6
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfOxkq1jZq5q for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828BF84BC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 828BF84BC8
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:47:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72551865C0; Fri,  5 Dec 2025 20:47:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 19:23:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eed28fd448ffe39822ee2d8d82c040fd7045865e
X-Git-Newrev: fc4ec2369baa790766c0af1b2d97d5fb2bf063fa
X-Patchwork-Hint: ignore
Message-Id: <20251205204705.72551865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: security bump to version
 5.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc4ec2369baa790766c0af1b2d97d5fb2bf063fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/containers/podman/releases/tag/v5.7.0

This commit fixes the CVE-2025-52881 security vulnerability. See:
https://github.com/advisories/GHSA-cgrx-mc8f-2prm

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/podman/podman.hash | 2 +-
 package/podman/podman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/podman/podman.hash b/package/podman/podman.hash
index e52a353aa7..ff6600ac8f 100644
--- a/package/podman/podman.hash
+++ b/package/podman/podman.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
+sha256  60de04a48c0ecf5006fb8e26543e2275126833aeaf2b5ea02ba492965d96173f  podman-v5.7.0-git4-go2.tar.gz
 sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 71eb26b496..31cc9ba349 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PODMAN_VERSION = v5.6.2
+PODMAN_VERSION = v5.7.0
 PODMAN_SITE = https://github.com/containers/podman
 PODMAN_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
