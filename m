Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946B1C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F864063B;
	Thu,  7 Aug 2025 17:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGfbHtaa8qeP; Thu,  7 Aug 2025 17:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721D34047A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 721D34047A;
	Thu,  7 Aug 2025 17:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 631F94C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0406840022
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBcFqadmq_m6 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D219400D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D219400D2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49E8786EE0; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:11:47 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d4cf1b5e114f00573f1a7eea7cb4ef221a3fad10
X-Git-Newrev: 2efe093f5a720625757c0bf7d278cd4057019b7f
X-Patchwork-Hint: ignore
Message-Id: <20250807171917.49E8786EE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libspdm: bump
 version to 3.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2efe093f5a720625757c0bf7d278cd4057019b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

For change log since 3.5.0, see:
https://github.com/DMTF/libspdm/releases

Following the upgrade of libopenssl to version 3.5.0 [1], the build
process for libspdm encountered issues due to the new openssl API.
It requires some modifications in the asn1.h file of libspdm.
This build error was addressed by a specific commit [2] in libspdm.

As Buildroot 2025.02 isn't impacted, this commit bumps libspdm to the
latest libspdm version to fix the build error.

This commit also updates the license hash, after a year update in:
https://github.com/DMTF/libspdm/commit/e8a35c8d0dfe5edb2bbafaa07ebf74b097824364

[1]: https://gitlab.com/buildroot.org/buildroot/-/commit/9868ca6ec98afa28a94aea50cc940db7df860396
[2]: https://github.com/DMTF/libspdm/commit/88797f83daf6654d6381e3539abe1670763f2ac1

Fixes:
https://autobuild.buildroot.org/results/87b8805975ef132a58c40e622e2e023199f6ee2a/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
[Julien:
 - add link to change log
 - fix LICENSE.md hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a01c07f5729232f205757c54ac68aca57c16205d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libspdm/libspdm.hash | 4 ++--
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index e29c5994a3..86358dad62 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b8a556be64120bab9c321964e67b90f5e6adb59abf3992c5c7937f37a4e7c8f  libspdm-3.5.0.tar.gz
-sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
+sha256  e7aefb9bc546bbd3ff10d707a6f05213cfb2e679354438ea0d1b5c483b5daa85  libspdm-3.8.0.tar.gz
+sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 9d8da2a3c6..4d29429811 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.5.0
+LIBSPDM_VERSION = 3.8.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
