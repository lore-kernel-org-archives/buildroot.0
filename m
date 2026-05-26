Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5DBCD5BB4
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 05:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1AD540DDC;
	Tue, 26 May 2026 05:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdSMm3i7tfgE; Tue, 26 May 2026 05:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC8A40E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779774748;
	bh=psX9qs9mxXtL8LhvpW7fzTdqp87BplFeoG9bM2F9F84=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KG4V5975NfA5QHPSPblHKaZhvdrnktoyp26xBruzb+fcD4fZtIu0H3xCBpl+RBvTi
	 9mXMhDLMH2HTFNfjGMCZNIFD9tSUDrcCogjG93Vj6TFUFLZ5ZnDRHoRrNR+ZJrtTPX
	 OmaYq6gcmBTtAw8reVYCgG+kD2BfBDKsmTTvBNneg2Kb7dIulOYwQClnjXawhUeeZN
	 DZw31XyLLA/zNcAMWp5uRYLAdPDrwNZeZiynomNq5VgqnKLvbU/VKi4SILlfM2qx0/
	 xQpUlelE6KakdAPliPUz1xCnSc/hsQfI465jjOqdbxmqE6bUcxzwHZQO16qYmcHWxm
	 vRzHS5QkgSq2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC8A40E55;
	Tue, 26 May 2026 05:52:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38A6D21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6974052B
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8_x95uX9wde for <buildroot@buildroot.org>;
 Tue, 26 May 2026 05:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E2640529
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E2640529
 for <buildroot@buildroot.org>; Tue, 26 May 2026 05:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 717A986E98; Tue, 26 May 2026 05:52:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 07:49:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ddacc46e4bf6934e33c993963a3782022d16ca1
X-Git-Newrev: 74aed5e8619cd4674e12659ce16798851486e7ff
X-Patchwork-Hint: ignore
Message-Id: <20260526055215.717A986E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: security bump version to
 1.25.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74aed5e8619cd4674e12659ce16798851486e7ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://nlnetlabs.nl/projects/unbound/download/

Used new signing key to verify the source tarball:
https://nlnetlabs.nl/signing-keys/

Fixes CVE-2026-33278, CVE-2026-42944, CVE-2026-42959, CVE-2026-32792,
CVE-2026-40622, CVE-2026-41292, CVE-2026-42534, CVE-2026-42923,
CVE-2026-42960, CVE-2026-44390 and CVE-2026-44608.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 8 ++++----
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 19966d889e..46b88900e6 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
-# with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
-sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
+# with key: 231018690C4D903EF419146AA144323DEAACDF45
+sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index b435839020..fab6e67455 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.24.2
+UNBOUND_VERSION = 1.25.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
