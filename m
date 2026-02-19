Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0EEE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 118FC80E42;
	Thu, 19 Feb 2026 17:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5HfmmcG0Iig; Thu, 19 Feb 2026 17:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F89811EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521882;
	bh=3FZl1/zg+v2yxcxQhPLDGZXTDmxEtSDZRSpLGCpJzOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MD2k9SUUNawQux1EwneZ41bO0hluPi/napRgm2POHUKchWG3Kt1ea98QAPy5Li5xR
	 0bZI4RXJcMh6Tkx04G2I7kCehVAZwVzsBJLwf68foR+FHpYesfz3SwxLyBXXZNoHvh
	 5pkq7VG61HpbgrXobleJbkZb2QuVDXKawpSHyqAMj7+rWm4gYcQw6EUydqDRYMRDV6
	 bGPtv1Z94f8ISTcGADvJQlDHr7EVGez/uMGMJ9+8rHfsUU/wfHJB3jSXRGShGh7qfs
	 h/RbnhwO5PwaCgwiX+oUT14+JNEj8puHCkcs/V4F903TUlOAgghP2xX45qnAxy7c6D
	 vfPOqcw/j0/wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F89811EE;
	Thu, 19 Feb 2026 17:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2A91CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5775940CFA
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z064pHmy69Px for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F03740D07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F03740D07
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D0FA82205; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:17:00 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 324d857a56c7f51b9d3eef8fa25f04454bae374e
X-Git-Newrev: 304b9fd3ffe7e1aba06ff899529db16c82ad2f5a
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.8D0FA82205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/304b9fd3ffe7e1aba06ff899529db16c82ad2f5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Since the introduction of CMake 4 in several distributions such as
Alpine [1] or Arch [2], build errors started occurring for cmake
packages that included calls to cmake_minimum_required() or
cmake_policy() with a version older than 3.5 (see [3]).

This patch enforce building host-cmake when the host system provides
CMake 4 or newer.

This patch is only meant for LTS maintenance branches in which
the host-cmake was kept to a version less than 4.x. This is to avoid
too many unnecessary package updates and patches.

If a package fail to build on the master branch because of this error
it should be fixed instead.

[1] https://gitlab.alpinelinux.org/alpine/aports/-/commit/21fe3cb10d65862648a7a65cc258899bfcae9b11
[2] https://gitlab.archlinux.org/archlinux/packaging/packages/cmake/-/commit/b634e8ded6d2d887450586f14f404f72518b97b9
[3] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/check-host-cmake.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..c7aa16f48d 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,9 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+major_max="4"
+minor_max="0"
+
 shift
 
 for candidate; do
@@ -32,6 +35,12 @@ for candidate; do
     major="${version%.*}"
     minor="${version#*.}"
 
+    if [ ${major} -gt ${major_max} ]; then
+        continue
+    elif [ ${major} -eq ${major_max} -a ${minor} -ge ${minor_max} ]; then
+        continue
+    fi
+
     if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
         exit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
