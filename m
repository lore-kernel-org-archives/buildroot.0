Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C219C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A8D408E8;
	Wed, 26 Oct 2022 19:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A8D408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7ZzMPzzmCBV; Wed, 26 Oct 2022 19:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C3AC408A7;
	Wed, 26 Oct 2022 19:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3AC408A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC7A1BF982
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67716405E9
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67716405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNowuSe8hJuf for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9813740547
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9813740547
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C9787165; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:51:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7630d0dde3b6284160bbe16474dad4fdc0b6a4fd
X-Git-Newrev: 682224d6f6e80e78ff61f3545a7ae5d7a15ba887
X-Patchwork-Hint: ignore
Message-Id: <20221026195154.87C9787165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: disable package for
 s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=682224d6f6e80e78ff61f3545a7ae5d7a15ba887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189es/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
index 2e3474e5e1..11dd225436 100644
--- a/package/rtl8189es/Config.in
+++ b/package/rtl8189es/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189ES
 	bool "rtl8189es"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189es.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189ES
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189es needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
