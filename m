Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D73FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7CBD40779;
	Thu, 26 Feb 2026 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7vBr9TCN-Gr; Thu, 26 Feb 2026 20:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB064076E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138644;
	bh=AGUoO754/y2vkzgK6eVCpvB5fvVvbbQy3IkbIL8xDek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f0xfvTuU2I8ClvHkh9M1qG3CzbyFKG1/Kt/QP20v7QgiCAi+IpbaWg3CYgN6Z6RZd
	 BU4WsjYbJWzED48t3++N6bSe0urkB81gq31QZb2m29hnhRmOjtLYImC5BeARRf+EHx
	 d7B8Va80Z+2UJ8e/waVVL9ctmK0++ixddMlA3r3bvNd+LATO9bsVW4wGdM4iKfYvu3
	 AcF0aD9JGfRlJzB0qphyq1Mu6JL5cv/ScJEER4eMaJiwYDfacSTGKlIwzGn44bVO90
	 B8Sm47jeTZRdQ09Yg/yjwUdMO9In7ZU7go355CY8tw1hzKyT6jvPFVC8UyBqTPe2tz
	 6zMMf5ezxK9lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB064076E;
	Thu, 26 Feb 2026 20:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9BC7D8A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA2A260719
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o0Ih7AoY7aP for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D46060609
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D46060609
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 724848750D; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:20:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 75544817343920418b670e2b1579a09a557f88bf
X-Git-Newrev: 172b3a1643d66df31f3ccc9448304823b48a2292
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.724848750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jasper: add patch
 for CVE-2025-8836
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/172b3a1643d66df31f3ccc9448304823b48a2292
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-8836:
    A vulnerability was determined in JasPer up to 4.2.5. Affected by this
    issue is the function jpc_floorlog2 of the file
    src/libjasper/jpc/jpc_enc.c of the component JPEG2000 Encoder. The
    manipulation leads to reachable assertion. The attack needs to be
    approached locally. The exploit has been disclosed to the public and
    may be used.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2025-8836

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0003-Fixes-401.patch | 80 +++++++++++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |  3 ++
 2 files changed, 83 insertions(+)

diff --git a/package/jasper/0003-Fixes-401.patch b/package/jasper/0003-Fixes-401.patch
new file mode 100644
index 0000000000..9741d90eee
--- /dev/null
+++ b/package/jasper/0003-Fixes-401.patch
@@ -0,0 +1,80 @@
+From 79185d32d7a444abae441935b20ae4676b3513d4 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Sat, 2 Aug 2025 18:00:39 -0700
+Subject: [PATCH] Fixes #401.
+
+JPEG-2000 (JPC) Encoder:
+- Added some missing range checking on several coding parameters
+  (e.g., precint width/height and codeblock width/height).
+
+CVE: CVE-2025-8836
+Upstream: https://github.com/jasper-software/jasper/commit/79185d32d7a444abae441935b20ae4676b3513d4.patch
+[thomas: removed the binary blob, backport, adapt lines]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/jpc/jpc_enc.c   |  30 ++++++++++++++++++++++++------
+ src/libjasper/jpc/jpc_t2dec.c |   3 ++-
+ 3 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 data/test/other/poc_401.pnm
+
+diff --git a/src/libjasper/jpc/jpc_enc.c b/src/libjasper/jpc/jpc_enc.c
+index 041c030a..e910a863 100644
+--- a/src/libjasper/jpc/jpc_enc.c
++++ b/src/libjasper/jpc/jpc_enc.c
+@@ -474,18 +474,36 @@ static jpc_enc_cp_t *cp_create(const char *optstr, jas_image_t *image)
+ 			cp->tileheight = atoi(jas_tvparser_getval(tvp));
+ 			break;
+ 		case OPT_PRCWIDTH:
+-			prcwidthexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct width (%d)\n", i);
++				goto error;
++			}
++			prcwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_PRCHEIGHT:
+-			prcheightexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct height (%d)\n", i);
++				goto error;
++			}
++			prcheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKWIDTH:
+-			tccp->cblkwidthexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block width (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKHEIGHT:
+-			tccp->cblkheightexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block height (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_MODE:
+ 			if ((tagid = jas_taginfo_nonull(jas_taginfos_lookup(modetab,
+diff --git a/src/libjasper/jpc/jpc_t2dec.c b/src/libjasper/jpc/jpc_t2dec.c
+index de77623a..1eff88a0 100644
+--- a/src/libjasper/jpc/jpc_t2dec.c
++++ b/src/libjasper/jpc/jpc_t2dec.c
+@@ -337,7 +337,8 @@ static int jpc_dec_decodepkt(jpc_dec_t *dec, jas_stream_t *pkthdrstream, jas_str
+ 						const unsigned n = JAS_MIN((unsigned)numnewpasses, maxpasses);
+ 						mycounter += n;
+ 						numnewpasses -= n;
+-						if ((len = jpc_bitstream_getbits(inb, cblk->numlenbits + jpc_floorlog2(n))) < 0) {
++						if ((len = jpc_bitstream_getbits(inb,
++						  cblk->numlenbits + jpc_floorlog2(n))) < 0) {
+ 							jpc_bitstream_close(inb);
+ 							return -1;
+ 						}
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 527ad6fa8c..d499c8a7c2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -21,6 +21,9 @@ JASPER_IGNORE_CVES += CVE-2023-51257
 # 0002-Fixes-400.patch
 JASPER_IGNORE_CVES += CVE-2025-8835
 
+# 0003-Fixes-401.patch
+JASPER_IGNORE_CVES += CVE-2025-8836
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
