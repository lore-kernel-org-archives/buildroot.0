Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749FECDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A4D401D8;
	Fri, 13 Oct 2023 18:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A4D401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EMp1wKE2Ab0; Fri, 13 Oct 2023 18:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF4641490;
	Fri, 13 Oct 2023 18:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF4641490
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC32B1BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C517A81E22
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C517A81E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP2_1vEa6ZLc for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2744281B8A
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2744281B8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15A7484C49; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:09:29 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a2cbf289d452d621fc089343105346625fb77bb6
X-Git-Newrev: 93800e3256640daf1f7571a0c80af481614edf9a
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.15A7484C49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/mbedtls: security
 bump to version 2.28.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=93800e3256640daf1f7571a0c80af481614edf9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the following security issue:

CVE-2023-43615: Buffer overread in TLS stream cipher suites
https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2023-10-1/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 26762e30090585e8c64333d3ffe4249e7a0b0f43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 2 +-
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 6aa6d0235d..d0cd0b2105 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
 # From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
-sha256  578c4dcd15bbff3f5cd56aa07cd4f850fc733634e3d5947be4f7157d5bfd81ac  mbedtls-2.28.4.tar.gz
+sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 62eda6ec99..1b941e04f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.4
+MBEDTLS_VERSION = 2.28.5
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
