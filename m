Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74F5C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B226408E1;
	Wed, 26 Oct 2022 19:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B226408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9ueEZFDRPtk; Wed, 26 Oct 2022 19:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761DC40905;
	Wed, 26 Oct 2022 19:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761DC40905
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44C211BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B251408A7
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B251408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5v9GhIYLqAV for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D301240338
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D301240338
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE9D687166; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:51:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 895692594f9aac04dfede06067eca794533869d8
X-Git-Newrev: 1e18cc291bbb1c16401abb1b2b661e4e150092f3
X-Patchwork-Hint: ignore
Message-Id: <20221026195154.BE9D687166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821au: disable package for
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e18cc291bbb1c16401abb1b2b661e4e150092f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8821au/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 87c191b22a..3d7bbf643d 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8821au needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8821AU
 	bool "rtl8821au"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8821au wifi driver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
