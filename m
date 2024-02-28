Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF541C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8164260E4D;
	Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuDGfijA_R91; Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70C560E6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70C560E6B;
	Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B42A1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786BE60E4D
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJaeyhsGu0k3 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A1060E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A1060E6B
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFE0587BD5; Wed, 28 Feb 2024 16:43:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 14:42:02 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e51bb2ced96c8826dcdce7ea46338d63a1ada2bf
X-Git-Newrev: 0e54bc8af8b3e4bfd6f88dc7360e36180c7c68cc
X-Patchwork-Hint: ignore
Message-Id: <20240228164337.BFE0587BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/falcosecurity-libs: drop FALCOSECURITY_LIBS_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e54bc8af8b3e4bfd6f88dc7360e36180c7c68cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

FALCOSECURITY_LIBS_CPE_ID_VENDOR is plain wrong since the addition of
the package in commit a15e35c4ebc52f29f65372c8e86cefa874aa4aaf, indeed
falco:falcosecurity-libs is not a valid CPE ID:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:falco:falcosecurity-libs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b36995c2c205fc46824c556f8c97d461c1c6bb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/falcosecurity-libs/falcosecurity-libs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 92d5c61832..4245f9581a 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -8,7 +8,6 @@ FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
 FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
 FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
 FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
-FALCOSECURITY_LIBS_CPE_ID_VENDOR = falco
 
 FALCOSECURITY_LIBS_DEPENDENCIES = \
 	c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
