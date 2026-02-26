Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27775FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F10F06064C;
	Thu, 26 Feb 2026 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJRRSIzpKCce; Thu, 26 Feb 2026 20:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DD160723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138656;
	bh=qv6ZPxp+2ZA1wClHL2j9anFwS3CRGMsnJ0vbSe6HXls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=liEvVmAM2UgZF5Hent2Vd3BUBfzR0BTh2eWqUfjjVXokRgQGxwEDPltm4/aojP+zW
	 JCyDB4kyTXuudIAfMc5+cySvFLdn+QCluumXRPFYcPBsQk8Pe0M9WBsQ+HTaBoRsal
	 A/8vW0WkqdqQlvt/6RO5MJaIPOlEGskZQeqyyTZ8IpvGAsoWTynI2bu64WI27dcpZ1
	 pJIihXSf75YQfCzhDSk3PMi9UDhSZltY/zeRyPHm2u+xrtjI7y+rNxxBIic2NV1XMn
	 +nPoYpjxpHPKaK2PJssP6WL3ODlaBYaXJJaZgjYUyIjuKbkLF4FrZ+8zLhqjnyobBf
	 BIVbsqZkPQUsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DD160723;
	Thu, 26 Feb 2026 20:44:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C2F23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A78980E00
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_WBxLvIco0g for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95BA880DF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95BA880DF2
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C6CE8750E; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:20:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 172b3a1643d66df31f3ccc9448304823b48a2292
X-Git-Newrev: d15dddfc5fc81ecb9919042aa01259cd36309cf7
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.7C6CE8750E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jasper: add patch
 for CVE-2025-8837
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d15dddfc5fc81ecb9919042aa01259cd36309cf7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-8837:
    A vulnerability was identified in JasPer up to 4.2.5. This affects the
    function jpc_dec_dump of the file src/libjasper/jpc/jpc_dec.c of the
    component JPEG2000 File Handler. The manipulation leads to use after
    free. An attack has to be approached locally. The exploit has been
    disclosed to the public and may be used.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8837
  - https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0004-Fixes-402-403.patch | 63 +++++++++++++++++++++++++++++++++
 package/jasper/jasper.mk                |  3 ++
 2 files changed, 66 insertions(+)

diff --git a/package/jasper/0004-Fixes-402-403.patch b/package/jasper/0004-Fixes-402-403.patch
new file mode 100644
index 0000000000..d7d777d9cd
--- /dev/null
+++ b/package/jasper/0004-Fixes-402-403.patch
@@ -0,0 +1,63 @@
+From 8308060d3fbc1da10353ac8a95c8ea60eba9c25a Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 5 Aug 2025 20:46:48 -0700
+Subject: [PATCH] Fixes #402, #403.
+
+JPEG-2000 (JPC) Decoder:
+- Added the setting of several pointers to null in some cleanup code
+  after the pointed-to memory was freed.  This pointer nulling is not
+  needed normally, but it is needed when certain debugging logs are
+  enabled (so that the debug code understands that the memory associated
+  with the aforementioned pointers has been freed).
+
+CVE: CVE-2025-8837
+Upstream: https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a
+[thomas: removed the binary blob, adapt line]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/jpc/jpc_dec.c |  13 ++++++++-----
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
+index 125a29ba..7e44f052 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -1107,23 +1107,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
+ 
+ 	if (tile->cp) {
+ 		jpc_dec_cp_destroy(tile->cp);
+-		//tile->cp = 0;
++		tile->cp = 0;
+ 	}
+ 	if (tile->tcomps) {
+ 		jas_free(tile->tcomps);
+-		//tile->tcomps = 0;
++		tile->tcomps = 0;
+ 	}
+ 	if (tile->pi) {
+ 		jpc_pi_destroy(tile->pi);
+-		//tile->pi = 0;
++		tile->pi = 0;
+ 	}
+ 	if (tile->pkthdrstream) {
+ 		jas_stream_close(tile->pkthdrstream);
+-		//tile->pkthdrstream = 0;
++		tile->pkthdrstream = 0;
+ 	}
+ 	if (tile->pptstab) {
+ 		jpc_ppxstab_destroy(tile->pptstab);
+-		//tile->pptstab = 0;
++		tile->pptstab = 0;
+ 	}
+ 
+ 	tile->state = JPC_TILE_DONE;
+@@ -2259,6 +2259,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec)
+ 	const jpc_dec_tile_t *tile;
+ 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
+ 	  ++tileno, ++tile) {
++		if (!tile->tcomps) {
++			continue;
++		}
+ 		assert(!dec->numcomps || tile->tcomps);
+ 		unsigned compno;
+ 		const jpc_dec_tcomp_t *tcomp;
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index d499c8a7c2..90c8e0c9a9 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -24,6 +24,9 @@ JASPER_IGNORE_CVES += CVE-2025-8835
 # 0003-Fixes-401.patch
 JASPER_IGNORE_CVES += CVE-2025-8836
 
+# 0004-Fixes-402-403.patch
+JASPER_IGNORE_CVES += CVE-2025-8837
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
