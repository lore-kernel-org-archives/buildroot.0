Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C5C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C5941740;
	Mon,  5 Feb 2024 11:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C5941740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui4dySGhp0VO; Mon,  5 Feb 2024 11:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0970D40BFD;
	Mon,  5 Feb 2024 11:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0970D40BFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE0B31BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87014418AB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87014418AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jS4AkJJSi6tY for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:13:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B350C418A3
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B350C418A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FAA27F98A; Mon,  5 Feb 2024 11:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:13:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 094fb84320ab99ab508879b4f1230ea81bf00da8
X-Git-Newrev: efa955ac415e2b50f63710e4fc1de8fd3e0dc099
X-Patchwork-Hint: ignore
Message-Id: <20240205111326.9FAA27F98A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: drop libnl dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efa955ac415e2b50f63710e4fc1de8fd3e0dc099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl is not needed to build frr since the addition of the package in
commit 26d82d006ba15777d19892b327bde343d82a9ff5

No mention of libnl found in https://github.com/FRRouting/frr or
https://docs.frrouting.org/projects/dev-guide/en/latest/building.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/frr/Config.in | 1 -
 package/frr/frr.mk    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index c2e9577a27..f6c058e6df 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_FRR
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
 	help
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 19f346fd7b..a4b4bccaf9 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -12,7 +12,7 @@ FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
-FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
+FRR_DEPENDENCIES = host-frr readline json-c libyang \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
