Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB20C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEEE4031E;
	Mon, 13 Nov 2023 21:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEEE4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65TjEVBu6NMQ; Mon, 13 Nov 2023 21:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAC33402AB;
	Mon, 13 Nov 2023 21:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC33402AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0F71BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 893484018F
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893484018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHuLfrz_LtNg for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:49:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BE4E40199
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE4E40199
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0845D870F6; Mon, 13 Nov 2023 21:49:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:48:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b368f78a4ee9bd720b0e94ad423c7bcd1ec88c1a
X-Git-Newrev: bcd879d5e2bda7e570084be7d6009cd1ff4aeafd
X-Patchwork-Hint: ignore
Message-Id: <20231113214926.0845D870F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.141
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcd879d5e2bda7e570084be7d6009cd1ff4aeafd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Increase default timeout to 10s (1.5.140)
- Hot Fixed for SPDS crash for some images (1.5.141)

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.140
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.141

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 2d7a8dc760..20816b5081 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  16eea2446160976e20d2f20257cecf7490979431f17971af374e81bba8d5fa98  uuu_source-uuu_1.5.139.tar.gz
+sha256  6972c7a1e76d60a22212913a8867b737104410c2a47ad88c8af460bd4885ec09  uuu_source-uuu_1.5.141.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 218001cde4..93c748ee46 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.139
+UUU_VERSION = 1.5.141
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
