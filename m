Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA37ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C126118B;
	Sat, 17 Sep 2022 15:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C126118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sc0gduiZAM0P; Sat, 17 Sep 2022 15:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5222F60674;
	Sat, 17 Sep 2022 15:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5222F60674
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43F811BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A65C4014A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A65C4014A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpcCUxN7bEx7 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D1040420
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82D1040420
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6C56F8455E; Sat, 17 Sep 2022 15:40:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:33:09 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7c9c61bd6e00f8fd4ec6d8f3055a79741e44de7a
X-Git-Newrev: 6b4df81b9fb91c42d1974d416ac0158ade925aca
X-Patchwork-Hint: ignore
Message-Id: <20220917154057.6C56F8455E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] boot/edk2: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b4df81b9fb91c42d1974d416ac0158ade925aca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
