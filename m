Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7E606A329
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pa9rWQKm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D6B80BF7;
	Wed,  4 Nov 2026 17:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZbbzmbdM3EY; Wed,  4 Nov 2026 17:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87FCE80BDF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812857;
	b=W7qHRaD2dNtQOzq7+Hf+4qQkjwqL79xcgPNHRnZ4EKSh8q2dP6HQ9vA0im96+ETHSMQY
	 zpF3OBkDlsLSVYomkaAYQo4qZSseCsn+qVpZvrf6eHtf3Z5Ho9t+CaE0uXa/a4IaoOvXG
	 vwu69yzOcgvbp9WmA3Ljdd9E0eYeAwD7IUlsx3LirixoA5rHUOPhDxxApG/PSPUteBnN1
	 pdgPATcg5K/ri3YR3mU5ighjAWsP0EStAfWZJCIaUsF6pHXcXMTHVSSlbksz5vQ3rVRN9
	 IWqGdYpNrj/2h61CDJpcEFKs6hpFZz3fysBtebsHOqigbrKmfSPnZZxVMiZsTyWYmvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3w8CB3NrsiPCQKDJGRXEiajRo5CwVGVBStQfywqGOW4=;
	b=O+ilNfJek0BMNxitJaANXiAo2407Lxdygt7pJsTZ+oo8b1woGlI7AxHDh3QWBxt1FcR/
	 drdFxhEPrkWfjh70zYH3EffUejzr22+i1rs2glgDJQ7D89c2c2cGlM089NCjttxBwvOfg
	 1zi9Y5u1mgYYpY30V+BW1iBl3jbFVN3XybnaSgSuOFyAfhfUdUlQUJ0S06r7IG+SyaloS
	 eqtSBcwO6ktl12KxvrsXLUxWaV+3XhSzGVqwiYVfLG2RBuz8RfAOjyeQIiPIJTmF0WJ3n
	 uo66FaME313m6IWFGRuiSL5/ELtnbXLLZRGZD2acbyMS3xAQIUqWBGOlNziCWhHoFDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812857;
	bh=3w8CB3NrsiPCQKDJGRXEiajRo5CwVGVBStQfywqGOW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pa9rWQKmXL4gF58daGy6xyh7ZP5hkYvYXHD9mR4tD8mV3adM9BWYUq4JYd82QjPUO
	 Fdtvim8hiG79AhdcwHiwOPfD2RasE80i+yYDjmJtHBSwHEBDaTL7rYCIZeU8y955BM
	 YzXzthz3ggh5jss0Gh2sD590urXJHFWDWKM67PbNpQ/4VwJS9e6TKBC/vmCoEvWOOF
	 16kjPT2Wmz/8HoNj7Ig/zkawZVznlmlY8vKKRU+7dtOknBD56pLMw/3NSb3XCsVPi3
	 6JVJ07/e7+T22/9V8LMeGKDOEovnEpgaMwfoVcp4jOn4+CyOFpplx9dKh43UF979I2
	 5pTNyO4NeihJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FCE80BDF;
	Wed,  4 Nov 2026 17:20:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47780411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B89080BDF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8efiZcHdt3MB for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7964180BDB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7964180BDB
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACF679DCF7; Wed,  4 Nov 2026 17:19:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:20:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ccb6c7977ab3294e1a32c1d9a010ff6fd9b10a3
X-Git-Newrev: edc1b9f1ec0857bd32d9bec1d36a7276cf43405b
X-Patchwork-Hint: ignore
Message-Id: <20261104171924.ACF679DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/edc1b9f1ec0857bd32d9bec1d36a7276cf43405b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libheif/releases/tag/v1.23.7

v1.23.7 is a security and bugfix release. It is ABI- and API-compatible
with v1.23.6 and is a drop-in replacement.

Fourteen of the fixed issues are rated high, so all users are advised to
upgrade.

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-xwcv-cp39-m2w4)
CVE-2026-XXXXX (GHSA-jx54-6rm6-2cgj)
CVE-2026-XXXXX (GHSA-fpr5-xpfr-vcq3)
CVE-2026-XXXXX (GHSA-35mc-3887-rr37)
CVE-2026-XXXXX (GHSA-hpg4-g2gc-pq42)
CVE-2026-XXXXX (GHSA-9rpf-2x22-78m9)
CVE-2026-XXXXX (GHSA-48p4-gj45-w9v6)
CVE-2026-XXXXX (GHSA-2g6j-vhr6-6wrj)
CVE-2026-XXXXX (GHSA-7qm8-hj35-269r)
CVE-2026-XXXXX (GHSA-hhg3-fxg7-3gxw)
CVE-2026-XXXXX (GHSA-73j7-gvm9-x8q6)
CVE-2026-XXXXX (GHSA-74mj-m37q-h3q9)
CVE-2026-XXXXX (GHSA-rcqc-842v-m26h)
CVE-2026-XXXXX (GHSA-pfcm-ffqg-84hx)
CVE-2026-XXXXX (GHSA-gff5-3vgr-p8h2)
(GHSA-r9cg-w542-g7hj)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 44e9c54781..d9f3d41470 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
-sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.7
+sha256  f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475  libheif-1.23.7.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 179c952566..f53cdca4a2 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.6
+LIBHEIF_VERSION = 1.23.7
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
