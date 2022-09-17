Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE59ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6632A843E6;
	Sat, 17 Sep 2022 15:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6632A843E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZ7pNV8fIs8x; Sat, 17 Sep 2022 15:41:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92591843AA;
	Sat, 17 Sep 2022 15:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92591843AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165AF1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E62D2842CC
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E62D2842CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id egVAI5dhZ5nb for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05590842C0
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05590842C0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E9C65844EA; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:33:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1a24f9e7335cad70e72ab1d2b5efa1590616ca2d
X-Git-Newrev: 252f784276e04498d16747442861127e475d9eaf
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.E9C65844EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/edk2: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=252f784276e04498d16747442861127e475d9eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo: EDK2_LICENSE_FILE -> EDK2_LICENSE_FILES
added by commit 1074a37e783b023bd0491ba4f4f7acab7f289e1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 889a7917b170f9e9c1bb32b3601824c313354d77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 2b12de53cb..5cbd9d152e 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -8,7 +8,7 @@ EDK2_VERSION = edk2-stable202102
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause
-EDK2_LICENSE_FILE = License.txt
+EDK2_LICENSE_FILES = License.txt
 EDK2_CPE_ID_VENDOR = tianocore
 EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
