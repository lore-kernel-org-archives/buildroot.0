Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D7C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED2340914;
	Wed, 26 Oct 2022 19:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED2340914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LPSeUuxiXX2; Wed, 26 Oct 2022 19:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B2540905;
	Wed, 26 Oct 2022 19:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B2540905
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1CA1BF982
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 189D860D7B
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189D860D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAOfva3NtIMv for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1CCC60BF7
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CCC60BF7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9166587166; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:51:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 682224d6f6e80e78ff61f3545a7ae5d7a15ba887
X-Git-Newrev: 33400378d05cf078314ed0fa9612fa5ab13f7fa6
X-Patchwork-Hint: ignore
Message-Id: <20221026195154.9166587166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: disable package for
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

commit: https://git.buildroot.net/buildroot/commit/?id=33400378d05cf078314ed0fa9612fa5ab13f7fa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189fs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189fs/Config.in b/package/rtl8189fs/Config.in
index ae69b79235..78eeed1a4f 100644
--- a/package/rtl8189fs/Config.in
+++ b/package/rtl8189fs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189FS
 	bool "rtl8189fs"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189fs.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189FS
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189fs needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
