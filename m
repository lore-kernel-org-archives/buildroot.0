Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EC7CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4F4341C68;
	Mon,  4 May 2026 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6iBcySzS7ZC; Mon,  4 May 2026 14:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B40741C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906120;
	bh=vZDMBtYp7VwiqneJ/LFKdqI7azDNsewrlO3Knu6sS/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hr2LnR/4S7fQiKgI6npXeXKY2eLwyMpSSwIop+/5+5NFYh2sVmTsx/CQ+zKekXB08
	 uxW7qOX34Xp3qcNgC3IBkRh4SgIQxtIWK7iNTeFo+/+SKxkfree0vmlh/lLQaxvnV+
	 Qts5dQFPojCAfuoKXBHAlM0bDiiLaHD1GtfNx3kqLKN0sdXbM1mWmRCSLlKKI/H8BG
	 WaPXLeBs1pSVRnDiuqBXlyUBgktO/1KQndGCN3EWKEOpBFbnB6Z7mnrKplNEqjef7j
	 sJyGT16befyv2NdBLyuR116ENeXfOaZ3izGgq/jvHl3MyYpHyOZe6AhkGcdqrZC6+Y
	 scAIFRn3hXrKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B40741C7D;
	Mon,  4 May 2026 14:48:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A1D925D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43E4141B31
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uzlm6keTHa_c for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0BC41C70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E0BC41C70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2584C84364; Mon,  4 May 2026 14:48:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:48:11 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9678db2cc59a271b0f8d1e23a9c78daa1f0a6289
X-Git-Newrev: b9ff9c9957ceafe6f91c1ded99abeecda9a4a3fe
X-Patchwork-Hint: ignore
Message-Id: <20260504144834.2584C84364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mbedtls: security
 bump to v3.6.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9ff9c9957ceafe6f91c1ded99abeecda9a4a3fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

For more information about the release, see:

- https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6
- https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.5..mbedtls-3.6.6

Fixes the following vulnerabilities:

- CVE-2025-66442
    In Mbed TLS through 4.0.0, there is a compiler-induced timing side
    channel (in RSA and CBC/ECB decryption) that only occurs with LLVM's
    select-optimize feature. TF-PSA-Crypto through 1.0.0 is also affected.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2025-66442
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-compiler-induced-constant-time-violations/

- CVE-2026-25833:
    Mbed TLS 3.5.0 to 3.6.5 fixed in 3.6.6 and 4.1.0 has a buffer overflow
    in the x509_inet_pton_ipv6() function

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25833
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-inet-pton/

- CVE-2026-25834:
    Mbed TLS v3.3.0 up to 3.6.5 and 4.0.0 allows Algorithm Downgrade.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25834
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-sigalg-injection/

- CVE-2026-25835:
    Mbed TLS before 3.6.6 and TF-PSA-Crypto before 1.1.0 misuse seeds in a
    Pseudo-Random Number Generator (PRNG).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25835
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-rng-cloning/

- CVE-2026-34871:
    An issue was discovered in Mbed TLS before 3.6.6 and 4.x before 4.1.0
    and TF-PSA-Crypto before 1.1.0. There is a Predictable Seed in a
    Pseudo-Random Number Generator (PRNG).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34871
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-dev-random/

- CVE-2026-34872:
    An issue was discovered in Mbed TLS 3.5.x and 3.6.x through 3.6.5 and
    TF-PSA-Crypto 1.0. There is a lack of contributory behavior in FFDH
    due to improper input validation. Using finite-field Diffie-Hellman,
    the other party can force the shared secret into a small set of values
    (lack of contributory behavior). This is a problem for protocols that
    depend on contributory behavior (which is not the case for TLS). The
    attack can be carried by the peer, or depending on the protocol by an
    active network attacker (person in the middle).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34872
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-peerkey-checks/

- CVE-2026-34873:
    An issue was discovered in Mbed TLS 3.5.0 through 4.0.0. Client
    impersonation can occur while resuming a TLS 1.3 session.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34873
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-client-impersonation-while-resuming-tls13-session/

- CVE-2026-34874:
    An issue was discovered in Mbed TLS through 3.6.5 and 4.x through
    4.0.0. There is a NULL pointer dereference in distinguished name
    parsing that allows an attacker to write to address 0.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34874
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-null-pointer-dereference-x509/

- CVE-2026-34875:
    An issue was discovered in Mbed TLS through 3.6.5 and TF-PSA-Crypto
    1.0.0. A buffer overflow can occur in public key export for FFDH keys.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34875
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ffdh-buffer-overflow/

- CVE-2026-34876:
    An issue was discovered in Mbed TLS 3.x before 3.6.6. An out-of-bounds
    read vulnerability in mbedtls_ccm_finish() in library/ccm.c allows
    attackers to obtain adjacent CCM context data via invocation of the
    multipart CCM API with an oversized tag_len parameter. This is caused
    by missing validation of the tag_len parameter against the size of the
    internal 16-byte authentication buffer. The issue affects the public
    multipart CCM API in Mbed TLS 3.x, where mbedtls_ccm_finish() can be
    invoked directly by applications. In Mbed TLS 4.x versions prior to
    the fix, the same missing validation exists in the internal
    implementation; however, the function is not exposed as part of the
    public API. Exploitation requires application-level invocation of the
    multipart CCM API.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34876
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-ccm-finish-boundary-check/

- CVE-2026-34877:
    An issue was discovered in Mbed TLS versions from 2.19.0 up to 3.6.5,
    Mbed TLS 4.0.0. Insufficient protection of serialized SSL context or
    session structures allows an attacker who can modify the serialized
    structures to induce memory corruption, leading to arbitrary code
    execution. This is caused by Incorrect Use of Privileged APIs.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-34877
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-serialized-data/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e1c7f198dc537ebc1e2abc992c8e3a475e19b2cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index b86c66af3e..f1be074e08 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
-sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
+sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index c1aa9f0850..e8bb0a71b9 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.5
+MBEDTLS_VERSION = 3.6.6
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
