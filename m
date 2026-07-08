Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5D2C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C816069C;
	Fri, 10 Jul 2026 13:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUJXiWJ-L513; Fri, 10 Jul 2026 13:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C25606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690977;
	bh=JJDOinqOZiUSwi5yW1X2Q0LBpx4NgJOceucPJd2lAxg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JOFLqDFEfT+Jl+m20fhUzb7Vt7F8QYJKd3HAOqrt0/IovkJNQtvW9l1y9la2ogoSS
	 B4Gy/rVpohwJuW8YccG4F8EHjf+cfUF8jnnGciOZfTfV6oTcVqlRFefOkO59z3bFt1
	 Zsq6Ac1khOeJWaggrpKpvGkCnKBm4H9XqWfu9qjxm3l8e+awbkisve5a5THoP1buTi
	 gK8Wy4mF3MksHqaDfoi9RTcRKjUmQFiGTz1D/f9Oso7DznSJkdF79xvG1r4dolCeIF
	 uV9PsEXWI6rFv4e8pj9a1KlPB+lNOzwZgVOuwRkk8nXF5bZkIi2SZURhLPtwyp8NMq
	 E7ptd3Dzy+/vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C25606FA;
	Fri, 10 Jul 2026 13:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F828FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8563F40903
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKliwGdgQoni for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8644076A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E8644076A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6F8588675; Fri, 10 Jul 2026 13:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:48:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b4daa210f49ddfc90b4ea794751b7a2b7fe3a0c
X-Git-Newrev: 24626159e68fc32e2c972f5bdcb1a21f381d7781
X-Patchwork-Hint: ignore
Message-Id: <20260710134216.C6F8588675@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openjpeg: add
 upstream patch for CVE-2026-6192
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/24626159e68fc32e2c972f5bdcb1a21f381d7781
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-6192:
    A vulnerability was identified in uclouvain openjpeg up to 2.5.4. This
    impacts the function opj_pi_initialise_encode in the library
    src/lib/openjp2/pi.c. The manipulation leads to integer overflow. The
    attack must be carried out locally. The exploit is publicly available
    and might be used. The identifier of the patch is
    839936aa33eb8899bbbd80fda02796bb65068951. It is suggested to install a
    patch to address this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-6192
  - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 353007cf40f3fc68e1cb2b8878d30f5cdc40ac6a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...leading-to-insufficient-memory-allocation.patch | 35 ++++++++++++++++++++++
 package/openjpeg/openjpeg.mk                       |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
new file mode 100644
index 0000000000..de5c925ec0
--- /dev/null
+++ b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
@@ -0,0 +1,35 @@
+From 839936aa33eb8899bbbd80fda02796bb65068951 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Apr 2026 13:25:27 +0200
+Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
+ integer overflow leading to insufficient memory allocation
+
+Fixes #1619
+
+CVE: CVE-2026-6192
+Upstream: https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/openjp2/pi.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
+index 15ac33142..4abb87af2 100644
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
+     l_current_pi = l_pi;
+ 
+     /* memory allocation for include*/
+-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
+-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
+-                            sizeof(OPJ_INT16));
++    l_current_pi->include = NULL;
++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
++                                sizeof(OPJ_INT16));
++    }
+     if (!l_current_pi->include) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index bc5d8143a6..7ded900856 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
+# 0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
+OPENJPEG_IGNORE_CVES += CVE-2026-6192
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
