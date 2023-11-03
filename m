Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C711C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42DB9707CD;
	Fri,  3 Nov 2023 09:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42DB9707CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77Fg7XaZV2tT; Fri,  3 Nov 2023 09:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBDB707E4;
	Fri,  3 Nov 2023 09:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBDB707E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBEFD1BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5099852AB
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5099852AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb6lD38qoZVQ for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC7CE85122
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7CE85122
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3984865A1; Fri,  3 Nov 2023 09:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:25:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72de7890233026f020de4aba3e8e86c156e55773
X-Git-Newrev: ba1176b23b655474d3dc4c9f48768497c6ffee4d
X-Patchwork-Hint: ignore
Message-Id: <20231103093143.D3984865A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtbocfg: bump to version 0.1.0
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
Content-Type: multipart/mixed; boundary="===============4866794702512091171=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4866794702512091171==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba1176b23b655474d3dc4c9f48768497c6ffee4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with kernel >= 6.6 thanks
to
https://github.com/ikwzm/dtbocfg/commit/36e9dad7bdedc43b9c63aa48c3fc48ffc4d2b2dd:

/home/thomas/autobuild/instance-3/output-1/build/dtbocfg-0.0.9/./dtbocfg.c: In function ‘dtbocfg_overlay_item_create’:
/home/thomas/autobuild/instance-3/output-1/build/dtbocfg-0.0.9/./dtbocfg.c:68:19: error: too few arguments to function ‘of_overlay_fdt_apply’
   68 |         ret_val = of_overlay_fdt_apply(overlay->dtbo,overlay->dtbo_size, &ovcs_id);
      |                   ^~~~~~~~~~~~~~~~~~~~

https://github.com/ikwzm/dtbocfg/compare/v0.0.9...v0.1.0

Fixes:
 - http://autobuild.buildroot.org/results/e5bae7fa5558801c39f53a4a15ac550c3855322e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtbocfg/dtbocfg.hash | 2 +-
 package/dtbocfg/dtbocfg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtbocfg/dtbocfg.hash b/package/dtbocfg/dtbocfg.hash
index 7db69f9e59..df1817f7aa 100644
--- a/package/dtbocfg/dtbocfg.hash
+++ b/package/dtbocfg/dtbocfg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  faa53aefd7f7636c65e2b56bec223d2bc7676354e3ad9b5c1691aca349b9bbb8  dtbocfg-0.0.9.tar.gz
+sha256  f1667de4250b744bb4a11dfc5f85d8b1f960da7d396c9f230f5b4d12224f524f  dtbocfg-0.1.0.tar.gz
 sha256  e57cb9f2ed607cd95bf1b64371325c505c1ac8fe640a8c9933e7fe7637a38567  LICENSE
diff --git a/package/dtbocfg/dtbocfg.mk b/package/dtbocfg/dtbocfg.mk
index 68beb1a45e..df5f692bc1 100644
--- a/package/dtbocfg/dtbocfg.mk
+++ b/package/dtbocfg/dtbocfg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTBOCFG_VERSION = 0.0.9
+DTBOCFG_VERSION = 0.1.0
 DTBOCFG_SITE = $(call github,ikwzm,dtbocfg,v$(DTBOCFG_VERSION))
 DTBOCFG_LICENSE = BSD-2-Clause
 DTBOCFG_LICENSE_FILES = LICENSE

--===============4866794702512091171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4866794702512091171==--
