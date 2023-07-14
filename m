Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA79BEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668E66146E;
	Fri, 14 Jul 2023 10:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668E66146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLWEVkwU9iQF; Fri, 14 Jul 2023 10:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60FD6143F;
	Fri, 14 Jul 2023 10:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60FD6143F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E23F1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 854CE6146E
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854CE6146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoTDZ8IUe6fO for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:23:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A873761409
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A873761409
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89E0987072; Fri, 14 Jul 2023 10:23:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:20:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1a2bfa429ebeb061059a00fdb6c2f9def494c78
X-Git-Newrev: a9fa704025d025433651223fea5e8b1983520187
X-Patchwork-Hint: ignore
Message-Id: <20230714102314.89E0987072@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: fix coding style in
 Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9fa704025d025433651223fea5e8b1983520187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/rtl8822cs/Config.in:10: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/rtl8822cs/Config.in:11: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

As reported by:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4653997920

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8822cs/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
index ee5f09928d..c827291ae4 100644
--- a/package/rtl8822cs/Config.in
+++ b/package/rtl8822cs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_RTL8822CS
 	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
-          Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
-          repository)
+	  Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
+	  repository)
 
           https://github.com/jethome-ru/rtl88x2cs/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
