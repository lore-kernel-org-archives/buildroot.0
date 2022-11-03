Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76315C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1335281F09;
	Thu,  3 Nov 2022 14:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1335281F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfEf_foMOJND; Thu,  3 Nov 2022 14:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 953BE81EFF;
	Thu,  3 Nov 2022 14:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 953BE81EFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 671BA1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4117A405AA
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4117A405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScLX9gPem6ct for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:44:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3245140571
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3245140571
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:44:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 3AF78D4A00
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:34:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B00320008;
 Thu,  3 Nov 2022 14:34:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oqbIP-00B0oi-5u; Thu, 03 Nov 2022 15:34:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:34:13 +0100
Message-Id: <20221103143414.2624696-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/multipath-tools: security bump to
 version 0.9.3
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2022-41974: Authorization bypass
- CVE-2022-41973: Symlink attack

For more details, see the writeup:
https://blog.qualys.com/vulnerabilities-threat-research/2022/10/25/leeloo-multipath-authorization-bypass-and-symlink-attack-in-multipathd-cve-2022-41974-and-cve-2022-41973

Update README.md hash after license-unrelated changes:

git shortlog 0.9.0..0.9.3 -- README.md
Konstantin Kharlamov (1):
      README.md: mention libreadline and libedit optional deps

Xose Vazquez Perez (4):
      multipath-tools: update devel repo info in README.md
      multipath-tools: add ALUA info to README.md
      multipath-tools: add basic info on how to use multipath-tools with NVMe devices
      multipath-tools: add more info for NetApp RDAC arrays

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/multipath-tools/multipath-tools.hash | 4 ++--
 package/multipath-tools/multipath-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index df0d24fb74..6f893d37ce 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  d6d1d819a53d076a91828ede42d9786451a471c4b71ca3fd25d04ad5413e3f95  multipath-tools-0.9.0.tar.gz
+sha256  7d5af5d86e43b757e253d1ba244aa8a9c09bfbb1677a72accb799b1bfcc0a9ac  multipath-tools-0.9.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  fb0a5d2008c609fec129d2ffd01dd7f65f0e3868bcf465b6fda76e25ff896ce9  README.md
+sha256  1e6095ac219062b8ddb2416d2a3cc40560619cd6b3ba609f5602bbd320413be0  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index f3ce3ca8b8..ec5d853644 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.0
+MULTIPATH_TOOLS_VERSION = 0.9.3
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
