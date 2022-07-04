Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34470C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 16:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23F54163D;
	Mon,  4 Jul 2022 16:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23F54163D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVM4mwNuFSq2; Mon,  4 Jul 2022 16:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83129415CC;
	Mon,  4 Jul 2022 16:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83129415CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 300391BF373
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1938982A8F
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1938982A8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLHUJ4jVI_hU for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 16:54:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4303A82A7F
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 16:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4303A82A7F
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5C0FD82275; Mon,  4 Jul 2022 16:41:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 18:54:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 026f35d9e7294bdf51aa11932f74c9c4cf257250
X-Git-Newrev: 7d58c413940438262a94e8ed53a0784c53f869b2
X-Patchwork-Hint: ignore
Message-Id: <20220704164138.5C0FD82275@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: add host-openssl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d58c413940438262a94e8ed53a0784c53f869b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 776385d645b37cfc43479b37e106244aa9ab2e85:

CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
OPENSSL_CRYPTO_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
OPENSSL_SSL_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu

Fixes:
 - http://autobuild.buildroot.org/results/2f05bc67112a59eba8f59ff707e43d76e41dbad1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uuu/uuu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index d1d7824018..9bf9ff123b 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -9,6 +9,6 @@ UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
 
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
