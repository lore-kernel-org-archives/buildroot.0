Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D153E8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE838144A;
	Sun, 28 Dec 2025 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzOQlhIp1Jbi; Sun, 28 Dec 2025 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639988144D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955632;
	bh=887DMPFgqwUVYOMUNas8LYtbI22eUOo5Av0g+FHmGI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jJLaTVqNbzlonVeP0O39fOHWijoWzpyMPZmla6IqrXFMKLTvOxfFmeAY6cf7nu8lx
	 6BsZEA1zD3fo6xkFOoiaVzL9+kL3g+5MxqUMUW4NZPeNPTEWgTlD1zosN8ui5qLLM/
	 a7Sywc44K3l8YJOqOC5byrEXiv/1uf1gwGmoG1mFy0/f9Kkqs4K/QXOS+ftTk0kXSx
	 s2Oe/pIzroheudvK2lkS338cMDagpb6s8EvW4guUXSO4EYbfDDShfIdqaK8LmBlgYj
	 mMR9wQ9nJIObaiZ1LgqAW0qmC/z/ygmlXVEx53tqupvNxc3pMgyDtIhd5YGF/mFHum
	 HbeOqoPJN3Sgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639988144D;
	Sun, 28 Dec 2025 21:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 794BEB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11894405C3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm0QvxDr7tLF for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6134E405DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6134E405DA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DDCF81DBA; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2e442a14d93fc99ab31e8eea96901500862f28a
X-Git-Newrev: 0669124d77f5b4980398a792914065736df676eb
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.4DDCF81DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: add CVE trailer in
 patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0669124d77f5b4980398a792914065736df676eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0013-Properly-check-authorization-on-incoming-guestOps-re.patch      | 1 +
 package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
index 91e379b9a6..c257e77504 100644
--- a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Properly check authorization on incoming guestOps requests
 Fix public pipe request checks.  Only a SessionRequest type should
 be accepted on the public pipe.
 
+CVE: CVE-2022-31676
 Upstream: https://github.com/vmware/open-vm-tools/blob/CVE-2022-31676.patch/1205-Properly-check-authorization-on-incoming-guestOps-re.patch
 Signed-off-by: Stefan Agner <stefan@agner.ch>
 ---
diff --git a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
index f47fabb71b..48962857ba 100644
--- a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
+++ b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
@@ -19,6 +19,7 @@ The 2025 Broadcom copyright information update is not part of this
 patch set to allow the patch to be easily applied to previous
 open-vm-tools source releases.
 
+CVE: CVE-2025-22247
 Upstream: https://github.com/vmware/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
