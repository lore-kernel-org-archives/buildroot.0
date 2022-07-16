Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B673C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1139A847A4;
	Sat, 16 Jul 2022 15:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1139A847A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRlka9lxfFYP; Sat, 16 Jul 2022 15:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E82A84785;
	Sat, 16 Jul 2022 15:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E82A84785
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D23E1BF964
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6802081469
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6802081469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7adZCb6_-e2 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:37:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 725D181440
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725D181440
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 461758392C; Sat, 16 Jul 2022 15:24:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 17:37:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5deea4be64a62e9b5fb4f0085b14d712e3921ac9
X-Git-Newrev: dbc2d3a8275441581de567424dc4bdb7507251c1
X-Patchwork-Hint: ignore
Message-Id: <20220716152406.461758392C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.28.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbc2d3a8275441581de567424dc4bdb7507251c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-35409: Buffer overread in DTLS ClientHello parsing.

https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/advisories/mbedtls-security-advisory-2022-07.md
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 80ae173aff..38182fe119 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0:
-sha256  6519579b836ed78cc549375c7c18b111df5717e86ca0eeff4cb64b2674f424cc  mbedtls-2.28.0.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.1:
+sha256  6797a7b6483ef589deeab8d33d401ed235d7be25eeecda1be8ddfed406d40ff4  mbedtls-2.28.1.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 8745ff33f4..af87d62b30 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.0
+MBEDTLS_VERSION = 2.28.1
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
