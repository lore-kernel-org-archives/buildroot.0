Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714C6C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0955840155;
	Sat, 24 Sep 2022 21:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0955840155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98Z72h3Eb6N3; Sat, 24 Sep 2022 21:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BEE540146;
	Sat, 24 Sep 2022 21:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BEE540146
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 299F71BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0620140146
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0620140146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z89-Ik5TtXR9 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BA8740123
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BA8740123
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1998E8539E; Sat, 24 Sep 2022 21:40:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:39:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6664ade080ac74469b213c34d40def5f0f581f7
X-Git-Newrev: 7677520a0d52e98fc2097df1c6f2c4aa46fce757
X-Patchwork-Hint: ignore
Message-Id: <20220924214014.1998E8539E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/forge: add FORGE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7677520a0d52e98fc2097df1c6f2c4aa46fce757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:digitalbazaar:forge is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adigitalbazaar%3Aforge

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/forge/forge.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/forge/forge.mk b/package/forge/forge.mk
index 9a811b4929..0b81295a15 100644
--- a/package/forge/forge.mk
+++ b/package/forge/forge.mk
@@ -9,6 +9,7 @@ FORGE_SITE = https://registry.npmjs.org/node-forge/-
 FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
 FORGE_LICENSE = BSD-3-Clause, GPL-2.0, vendored dependencies licenses probably not listed
 FORGE_LICENSE_FILES = LICENSE
+FORGE_CPE_ID_VENDOR = digitalbazaar
 
 # Install .min.js as .js
 define FORGE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
