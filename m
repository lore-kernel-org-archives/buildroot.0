Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D76C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4141841F7C;
	Mon,  6 Nov 2023 21:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4141841F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mP3OizEknkKV; Mon,  6 Nov 2023 21:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 874AA41F4F;
	Mon,  6 Nov 2023 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 874AA41F4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D87D1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05DB782085
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05DB782085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZH8vJEMnoVYX for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F16B81FAE
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F16B81FAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A61A86ADB; Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:42:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ccbe5f598a199f7defa6d22e2abfbf22dc14943
X-Git-Newrev: 718a800828cc16131322e5c618c8dde42a8c8123
X-Patchwork-Hint: ignore
Message-Id: <20231106214647.2A61A86ADB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: add KVMTOOL_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=718a800828cc16131322e5c618c8dde42a8c8123
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:kvmtool_project:kvmtool is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/9B4C8068-B4EB-487F-958A-353BD3F494D1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvmtool/kvmtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index df6ae7e0f1..9c58e44876 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -17,6 +17,7 @@ KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 KVMTOOL_LICENSE = GPL-2.0
 KVMTOOL_LICENSE_FILES = COPYING
+KVMTOOL_CPE_ID_VENDOR = kvmtool_project
 
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
