Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E90C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AD761476;
	Wed,  7 Feb 2024 18:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0F0orHDIWNb; Wed,  7 Feb 2024 18:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1573061478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1573061478;
	Wed,  7 Feb 2024 18:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3DB01BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0C6D81AF6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7zfI6uRiDM6 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C75681AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C75681AF3
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAC7C87694; Wed,  7 Feb 2024 18:49:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 19:48:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29524958d52db07f749aef9d405ef06dee47ba22
X-Git-Newrev: b5d83b4b649ee1e77811d9bf8ca6398725f6cce1
X-Patchwork-Hint: ignore
Message-Id: <20240207184901.EAC7C87694@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: drop README.md from license
 files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5d83b4b649ee1e77811d9bf8ca6398725f6cce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch drops the file README.md from the license files. Indeed, the
licensing terms apply to third-party libraries that uuu links to, and
even though they are bundled in the source tree of uuu|mfgtools, they
are not used by Buildroot as we use the ones we build. Therefore, the
actual license file of the package is the file LICENSE.

Moreover, this also leads to simplifying the bump to new versions.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uuu/uuu.hash | 1 -
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index c231d5d729..e45cbb8680 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,3 @@
 # locally computed
 sha256  6e65fc028afacc94b805ae376e3da3864dcb2570d425037820e716207ab70373  uuu_source-uuu_1.5.165.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  1b3d030a1824d633f75194743bd92bc1ed2d9a4bf1915bc11e49bf4c0c54012d  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 80d5e1937a..5800277b10 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -8,7 +8,7 @@ UUU_VERSION = 1.5.165
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-UUU_LICENSE_FILES = LICENSE README.md
+UUU_LICENSE_FILES = LICENSE
 HOST_UUU_DEPENDENCIES = \
 	host-bzip2 \
 	host-libusb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
