Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C367C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E3741D4B;
	Fri, 28 Jan 2022 21:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWv4cHPMB4xc; Fri, 28 Jan 2022 21:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B38041D12;
	Fri, 28 Jan 2022 21:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457C81BF5DC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 305AC40253
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YH1GPFv_FHPm for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E45C4014C
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:08:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6148182B52; Fri, 28 Jan 2022 21:01:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:06:46 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3fe6230ee2c92c0322f2a26e61a00b0b9a2f33be
X-Git-Newrev: cd140f26cc5a80b24cb60b6a19d8ed0921a7d06e
X-Patchwork-Hint: ignore
Message-Id: <20220128210105.6148182B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/containerd:
 security bump to version 1.5.9
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
Content-Type: multipart/mixed; boundary="===============9171518997751711119=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9171518997751711119==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd140f26cc5a80b24cb60b6a19d8ed0921a7d06e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

CVE-2021-43816: "Unprivileged pod using `hostPath` can side-step active LSM when
it is SELinux"

Containers launched through containerd’s CRI implementation on Linux systems
which use the SELinux security module and containerd versions since v1.5.0 can
cause arbitrary files and directories on the host to be relabeled to match the
container process label through the use of specially-configured bind mounts in a
hostPath volume. This relabeling elevates permissions for the container,
granting full read/write access over the affected files and directories.
Kubernetes and crictl can both be configured to use containerd’s CRI
implementation.

https://github.com/advisories/GHSA-mvff-h3cj-wj9c
https://github.com/containerd/containerd/releases/tag/v1.5.9

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 935bd589a356f51e5c97d111877bd2052f0c9da5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index f1a6709554..d5aafe2e70 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a41ab8d39393c9456941b477c33bb1b221a29b635f1c9a99523aab2f5e74f790  containerd-1.5.8.tar.gz
+sha256  40c9767af3e87f2c36adf2f563f0a8374e80b30bd2b7aa80058c85912406cef4  containerd-1.5.9.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index cd975db274..8976e12f1a 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.5.8
+CONTAINERD_VERSION = 1.5.9
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE

--===============9171518997751711119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9171518997751711119==--
