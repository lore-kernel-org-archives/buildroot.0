Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94ECCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED5B6142B;
	Fri, 29 May 2026 08:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4aX8NB-_MGb; Fri, 29 May 2026 08:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 780A36142D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043180;
	bh=/E8cM0ikzTzNkV/cp8AFJw6qtqunV/zRqpVDhYzI+2U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GGb75PRUcr52r7s1vrWQ23cQpDlWzFDIvi3moLMlddbKxUk/2zcfc5ysetu0fFC40
	 96BMNUTfnR3O8FgLfPf02NbF9H279hosl09NC98kCYQPCR1Eq4kqkaOo8vF0FR9Imu
	 zXfSmnfYAmsFzwcpvgpXwuK613kyH9B8Ly5jnMk8LjZ0tM/TL2WJ4kJ8faxqBSfo62
	 sy1KhG4ApUocCkKPANULBi0oGyS0vOa2tjZCKGRT/OPasy8XSs1mYkTzJxJW1d/aFE
	 bTGq5qkjzDUsUa6iJsxTw3mEXjydV41vV0dXpVv2YHZiHn/zvG9viioLkM7cWILMzo
	 4XL4iB0mqY5Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780A36142D;
	Fri, 29 May 2026 08:26:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F2E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B03E41F5F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FLU0KudB0Qm for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15BA41F88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E15BA41F88
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8129887334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:55:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b1ba7f0c8d715f509a88a237fa498a332731d054
X-Git-Newrev: bf837fbf829b76516962bfc63135c7ebac383e91
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.8129887334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.31
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
Content-Type: multipart/mixed; boundary="===============3492461046541677335=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3492461046541677335==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf837fbf829b76516962bfc63135c7ebac383e91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.31

- CVE-2025-14179:
    In PHP versions, the PDO Firebird driver improperly handles NUL
    bytes when preparing SQL queries. During token-by-token query
    construction, a string token containing a NUL byte is copied via
    strncat(), which stops at the NUL byte, dropping the closing quote
    and causing subsequent SQL tokens to be interpreted as part of the
    string.
    This allows SQL injection when attacker-controlled values are quoted
    via PDO::quote() and embedded in SQL statements.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-w476-322c-wpvm
  - https://www.cve.org/CVERecord?id=CVE-2025-14179

- CVE-2026-6722:
    In PHP versions, the SOAP extension's object deduplication mechanism
    stores pointers to PHP objects in a global map without incrementing
    their reference counts. When an apache:Map node contains duplicate
    keys, processing the second entry overwrites the first in the
    temporary result map, freeing the original PHP object while its
    stale pointer remains in the map. A subsequent href reference to the
    freed node can copy the dangling pointer into the result. As PHP
    string allocations can reclaim the freed memory region, an attacker
    with control over the SOAP request body can exploit this
    use-after-free to achieve remote code execution.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-85c2-q967-79q5
  - https://www.cve.org/CVERecord?id=CVE-2026-6722

- CVE-2026-6735:
    In PHP, due to improper sanitation of user data, it allows an
    attacker to compose an URL, which will cause the target to execute
    arbitrary JavaScript code (XSS) on the target's machine when the
    target is viewing the PHP-FPM status page.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-7qg2-v9fj-4mwv
  - https://www.cve.org/CVERecord?id=CVE-2026-6735

- CVE-2026-7258:
    In PHP, some functions, including urldecode(), pass signed char to
    ctype functions (like isxdigit()). On the systems with default
    signed char and optimized table-lookup ctype functions - such as
    NetBSD - this can lead to accessing array with negative offset,
    which can trigger a denial of service.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-m8rr-4c36-8gq4
  - https://www.cve.org/CVERecord?id=CVE-2026-7258

- CVE-2026-7259:
    In PHP, a mismatch between encoding lists in Oniguruma and mbfl
    leads to  a NULL pointer dereference, resulting in a segmentation
    fault and denial of service. The vulnerability is exploitable when
    user-controlled input can influence the encoding passed
    to mb_regex_encoding().

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-wm6j-2649-pv75
  - https://www.cve.org/CVERecord?id=CVE-2026-7259

- CVE-2026-7261:
    In PHP, when SoapServer is configured with SOAP_PERSISTENCE_SESSION,
    the handler object is persisted across requests via session storage.
    However, in the case SOAP requests results in an error, the
    persistance is handled incorrectly, resulting in freeing the object
    while keeping a pointer to it, which may lead to use-after-free.
    This may lead to memory corruption, information disclosure, or
    process crashes, with confidentiality, integrity, and availability
    impact on the vulnerable system.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-m33r-qmcv-p97q
  - https://www.cve.org/CVERecord?id=CVE-2026-7261

- CVE-2026-7262:
    In PHP, when a SOAP server has a typemap configured, the decoding
    process contains a mistake which checks the wrong variable in case
    of missing value element.  This leads to dereferences a NULL
    pointer, causing a segmentation fault. This allows a remote
    unauthenticated attacker to crash the PHP SOAP server process,
    resulting in denial of service.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-hmxp-6pc4-f3vv
  - https://www.cve.org/CVERecord?id=CVE-2026-7262

- CVE-2026-7568:
    In PHP versions 8.2.* before 8.2.31, 8.3.* before 8.3.31, 8.4.* before
    8.4.21, and 8.5.* before 8.5.6, the metaphone() function in
    ext/standard/metaphone.c uses a signed int variable to track the
    current position within the input string. If a string longer than
    2,147,483,647 bytes is passed, a signed integer overflow occurs,
    resulting in undefined behavior. This can lead to an out-of-bounds
    read, causing a segmentation fault or access to unrelated memory, and
    may affect the availability of the PHP process.

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-96wq-48vp-hh57
  - https://www.cve.org/CVERecord?id=CVE-2026-7568

(cherry picked from 952aa90078dcba233b5b9723f4855ade4a695b4c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index dc5f0e7a3c..978987ee46 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  67f084d36852daab6809561a7c8023d130ca07fc6af8fb040684dd1414934d48  php-8.3.30.tar.xz
+sha256  66410cee07f4b2baeb0843140bb2a2b52ef930b5cf9b3d6e6d158b33aae8fa37  php-8.3.31.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d184186cee..7d9cd3cb11 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.30
+PHP_VERSION = 8.3.31
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES

--===============3492461046541677335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3492461046541677335==--
