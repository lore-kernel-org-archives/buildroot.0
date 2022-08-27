Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5ABECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93C060BF7;
	Sat, 27 Aug 2022 07:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93C060BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9EM-RrmjtFo; Sat, 27 Aug 2022 07:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F52160BB8;
	Sat, 27 Aug 2022 07:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F52160BB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1AB1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16FE60BF3
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16FE60BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tgf2L2koTqFr for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DAA260BDD
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAA260BDD
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5A54C879A7; Sat, 27 Aug 2022 07:36:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:50:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cd25766163c35b74ba27f08b552bbb92d6bb406
X-Git-Newrev: 889a7917b170f9e9c1bb32b3601824c313354d77
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.5A54C879A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=889a7917b170f9e9c1bb32b3601824c313354d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo: EDK2_LICENSE_FILE -> EDK2_LICENSE_FILES
added by commit 1074a37e783b023bd0491ba4f4f7acab7f289e1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
