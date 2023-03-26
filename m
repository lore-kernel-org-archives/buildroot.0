Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B842C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D56D941619;
	Sun, 26 Mar 2023 20:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D56D941619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTFoupnr5_ox; Sun, 26 Mar 2023 20:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B73F841675;
	Sun, 26 Mar 2023 20:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73F841675
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEA2E1BF870
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D7C41682
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D7C41682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-CfKShsa4Ru for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC98040999
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC98040999
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC27A82D99; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 21:59:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48311b11e0d46b4b8e5ca08da63f4a7d9bc3a55a
X-Git-Newrev: 0472287484e5914f7437cfd9f05524ab38b810fe
X-Patchwork-Hint: ignore
Message-Id: <20230326200116.AC27A82D99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protozero: fix double space in
 Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=0472287484e5914f7437cfd9f05524ab38b810fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protozero/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protozero/Config.in b/package/protozero/Config.in
index 19048dfe8d..e6347e6f7f 100644
--- a/package/protozero/Config.in
+++ b/package/protozero/Config.in
@@ -16,5 +16,5 @@ config BR2_PACKAGE_PROTOZERO
 
 	  https://github.com/mapbox/protozero
 
-comment "protozero needs a toolchain w/ C++,  gcc >= 4.7"
+comment "protozero needs a toolchain w/ C++, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
