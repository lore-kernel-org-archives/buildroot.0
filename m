Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97CFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215DE4031C;
	Fri,  6 Mar 2026 19:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an8Lvuld-P_x; Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30ACE41E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826747;
	bh=SJemd8PxfLzeTBpK6QTiN4mzugD/099obguC3Dk4aPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qsd8+mRPIro3a1O5Lht4bj0/1EGIdOhC4xnDe1tHndYbLUnRb5+1LcieHczbJCWZs
	 Sb47UPAwk6PYTh/9DfccVZK58qlyS74oTClq4RK/GmwCX91l10Qptjteq26AOV9jkV
	 bVjtRN0ihIoqfCBIf9XzdI2ObZKRzSFe4TCl+QMA++7xNQLQRwR2BzKtRI4KZIRgTS
	 RnEaFTgZR/lBJ7CzgTdyP3vEBLLnL+IbujlPXjpPHXIFLjf61SlvFk8wLYYMtthwBN
	 dx45FKn3dasPYWv6QHl1BzL/ZkL1Xq2x2xqTk30DYzlPgM/rRGEiYBuIxA1lkkoaNK
	 +ouoJ5njsQVPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30ACE41E5C;
	Fri,  6 Mar 2026 19:52:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C2D7223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DC583A7D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0RENUw7jLSv for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6872582428
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6872582428
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7175D7FB67; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:43:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9e106312bfeeaac9ed78b206c1463426b6d5d5c
X-Git-Newrev: d5a067ef22adb4edc4ee765a762e56a748576572
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.7175D7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/containerd:
 security bump to v2.0.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5a067ef22adb4edc4ee765a762e56a748576572
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://github.com/containerd/containerd/releases/tag/v2.0.7
  - https://github.com/containerd/containerd/releases/tag/v2.0.6
  - https://github.com/containerd/containerd/releases/tag/v2.0.5
  - https://github.com/containerd/containerd/releases/tag/v2.0.4
  - https://github.com/containerd/containerd/releases/tag/v2.0.3

Fixes the following vulnerabilities:

- CVE-2024-25621:
    Versions 2.0.0-beta.0 through 2.0.6 have an overly broad default
    permission vulnerability. Directory paths `/var/lib/containerd`,
    `/run/containerd/io.containerd.grpc.v1.cri` and
    `/run/containerd/io.containerd.sandbox.controller.v1.shim` were all
    created with incorrect permissions.

    https://www.cve.org/CVERecord?id=CVE-2024-25621

- CVE-2024-40635:
    A bug was found in containerd prior to versions 2.0.4 where
    containers launched with a User set as a `UID:GID` larger than the
    maximum 32-bit signed integer can cause an overflow condition where
    the container ultimately runs as root (UID 0). This could cause
    unexpected behavior for environments that require containers to run
    as a non-root user.

    https://www.cve.org/CVERecord?id=CVE-2024-40635

- CVE-2025-47291:
    A bug was found in the containerd's CRI implementation where
    containerd, starting in version 2.0.1 and prior to version 2.0.5,
    doesn't put usernamespaced containers under the Kubernetes' cgroup
    hierarchy, therefore some Kubernetes limits are not honored. This
    may cause a denial of service of the Kubernetes node.

    https://www.cve.org/CVERecord?id=CVE-2025-47291

- CVE-2025-64329:
    Versions 2.0.0-beta.0 through 2.0.6 contain a bug in the CRI Attach
    implementation where a user can exhaust memory on the host due to
    goroutine leaks.

    https://www.cve.org/CVERecord?id=CVE-2025-64329

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 49e180d3d55fcf83f927fb7b5e168aa8ced28b15)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 4ec78897d9..0916c603bb 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
+sha256  2bbf9fedcf4ab31736fcb3ce224ef22610a87da9d53bbd8f6d205710fd849831  containerd-2.0.7-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 1f70a26ebf..baac19d406 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.2
+CONTAINERD_VERSION = 2.0.7
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
