Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB78C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C28406E6;
	Wed, 26 Aug 2026 20:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X34D8bZikuSC; Wed, 26 Aug 2026 20:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787776401;
	bh=uDbrQqWJ6813rlbghe/Wnnqs45kVT8UACsvLOM/t7dk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PgVFRtmM7lyj6WZUDh7t5J0Anpay5jRfAlGtHEQTGQGq3+GrbYbN/fNrW/mHQ8DTR
	 svQcN/HDMh5JZ4emZAG2hwW5dwgan6Anik6QTLeMZS1IPtJrfmyVcv1/vF9yeoehkn
	 BXcuE/yHGa7YTKSbXZR1nJ6+eiDLIgTHbMROCR1IZfvuVGMckC/LQk4r/9MCC5GPPf
	 4O7yc70GKbxhvDT0DKzm43UOqmHnfzcxZRS4KYVQtI3GfOJq85nbeClbHy4r5AsVUh
	 0sKssOCWrLAZxduNkqO7RiXaAl8a1xvBC/449HVFvLEAe8Zf7QVoaKFaAC5xXaxqIK
	 e/J3d0cTHKthQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E05940804;
	Wed, 26 Aug 2026 20:33:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9299323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFC414027C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwq1yU-GJtOM for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B189140247
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C6AA91FFB; Wed, 26 Aug 2026 20:32:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 20:37:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 198317785a89ed7fd398fda7ab8ede7dfb4871c7
X-Git-Newrev: 6f5d678c371196410082864b78e47ae0e8475f41
X-Patchwork-Hint: ignore
Message-Id: <20260826203222.8C6AA91FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to v22.23.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288736728507705079=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1288736728507705079==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f5d678c371196410082864b78e47ae0e8475f41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:

- https://github.com/nodejs/node/releases/tag/v22.23.2
- https://github.com/nodejs/node/releases/tag/v22.23.1
- https://github.com/nodejs/node/releases/tag/v22.22.1
- https://github.com/nodejs/node/releases/tag/v22.22.2
- https://github.com/nodejs/node/releases/tag/v22.22.3

It fixes the following vulnerabilities:

- (CVE-2026-56846) http2: retain header memory in session accounting (Matteo Collina) – High
- (CVE-2026-56848) http2: defer rst stream while in scope (Matteo Collina) – High
- (CVE-2026-58043) permission: avoid granting radix split nodes (RafaelGSS) – High
- (CVE-2026-56850) https: distinguish PFX object-array agent keys (RafaelGSS) – Medium
- (CVE-2026-58040) https: bind identity checks to session reuse (Matteo Collina) – Medium
- (CVE-2026-58042) dns: handle large resolveAny address replies (RafaelGSS) – Medium
- (CVE-2026-58045) zlib: throw on out-of-bounds write buffers (RafaelGSS) – Medium
- (CVE-2026-56847) permission: enforce fs write permission for trace events (RafaelGSS) – Low
- (CVE-2026-58039) permission: check final report output path (RafaelGSS) – Low
- (CVE-2026-58044) http: reject requests exceeding max header count (Matteo Collina) – Low

The LICENSE was changed in 22.22.1, see [1].

[1] https://github.com/nodejs/node/commit/9cafec084e4856e2f03d06523eaeec0c8ba352b2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nodejs/nodejs.hash | 15 ++++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index c3372f443c..bf7a8358ba 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,9 @@
-# From https://nodejs.org/dist/v22.22.0/SHASUMS256.txt.asc
-sha256  1bf1eb9ee63ffc4e5d324c0b9b62cf4a289f44332dfef9607cea1a0d9596ba6f  node-v22.22.0-linux-arm64.tar.xz
-sha256  a8b4f15f6e1f371422f1f7abcca4c46bd7abc1c732c274bc5cb108b841c1f0ff  node-v22.22.0-linux-armv7l.tar.xz
-sha256  d83b9957431cc18e1fc143a4b99f89cde7b8a18f53ef392231b4336afd058865  node-v22.22.0-linux-ppc64le.tar.xz
-sha256  9aa8e9d2298ab68c600bd6fb86a6c13bce11a4eca1ba9b39d79fa021755d7c37  node-v22.22.0-linux-x64.tar.xz
-sha256  4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683  node-v22.22.0.tar.xz
+# From https://nodejs.org/dist/v22.23.2/SHASUMS256.txt.asc
+sha256  fff4078c5def658577f92c88db7db3bc0072924bfb93fe52c1e744a54e94abb8  node-v22.23.2-linux-arm64.tar.xz
+sha256  ef8f26a3de19acd8c23548e6c3cfc2052610b0e67abb5fd64dbd92c8b1c1245b  node-v22.23.2-linux-armv7l.tar.xz
+sha256  e2ba10110ad34096c051fe47134fcd12175ecc48e7e879d7d4c78b70cf66442c  node-v22.23.2-linux-ppc64le.tar.xz
+sha256  d60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307  node-v22.23.2-linux-x64.tar.xz
+sha256  bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb  node-v22.23.2.tar.xz
+
 # Locally calculated
-sha256  e991d81497a85bb24fc6bffae0a3637a6accd6c6bc5ce1f2c5698bd555cf9d49  LICENSE
+sha256  c738ae413cf561f174e34f6961f8ca458aae2369a73640dda6234c629b98bcc4  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9f01d60baa..1147245504 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.22.0
+NODEJS_COMMON_VERSION = 22.23.2
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 

--===============1288736728507705079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1288736728507705079==--
