Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F082CCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19D14149A;
	Mon, 17 Nov 2025 20:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SHE4gl8XKHE; Mon, 17 Nov 2025 20:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242EA41465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242EA41465;
	Mon, 17 Nov 2025 20:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9118D158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61DCD818C0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63ZDdBMq_Hmx for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDEB48187F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDEB48187F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFADE81E81; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:47:29 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 875a2c9e8ef91b4e245213d67ff1d8933da9a576
X-Git-Newrev: 8a4770581fea0352ff8ea47580b2c15a1b6e0e37
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.AFADE81E81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/mbedtls: security
 bump to v3.6.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a4770581fea0352ff8ea47580b2c15a1b6e0e37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

For more details on the version bump, see:
 - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5

Fixes the following vulnerabilities:

- CVE-2025-54764

    Mbed TLS before 3.6.5 allows a local timing attack against certain
    RSA operations, and direct calls to mbedtls_mpi_mod_inv or
    mbedtls_mpi_gcd.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-54764
  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-ssbleed-mstep/

- CVE-2025-59438

    Mbed TLS through 3.6.4 has an Observable Timing Discrepancy.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-59438
  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-invalid-padding-error/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1a25f0c37283ad0db34cb85b237a8f8a12243758)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 8b82313c07..b86c66af3e 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4:
-sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
+sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index b46bbe888a..c1aa9f0850 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.4
+MBEDTLS_VERSION = 3.6.5
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
