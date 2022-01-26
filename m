Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660E5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F189284D96;
	Wed, 26 Jan 2022 21:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-xe9eYKwTlV; Wed, 26 Jan 2022 21:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DFAA84D94;
	Wed, 26 Jan 2022 21:23:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39E161BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27579409F5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JO4Jlx4OB79X for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:23:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29170403A4
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:23:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BBFC582127; Wed, 26 Jan 2022 21:16:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:22:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e15bd8e51ba1b72a59140c84e59971d71086431
X-Git-Newrev: 935bd589a356f51e5c97d111877bd2052f0c9da5
X-Patchwork-Hint: ignore
Message-Id: <20220126211606.BBFC582127@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.9
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
Content-Type: multipart/mixed; boundary="===============2101859977336706920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2101859977336706920==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=935bd589a356f51e5c97d111877bd2052f0c9da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============2101859977336706920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2101859977336706920==--
