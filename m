Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD96BFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A2184D8A;
	Fri, 24 Apr 2026 16:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XujqU-0kevAI; Fri, 24 Apr 2026 16:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4314284D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047950;
	bh=kY8wy0PwzbeNiDb0S8u70+777VVFolRsXy3XB+knCKY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNM2BqYPx0+hiWpzTasjfmGCnIpiMJNM7xHAVC0nAuUu13shSTmOBqUWU1rCoE8oS
	 lb/CD+YYeXRwLRrqa193DTgNClxrbcLQMuWt1jFxn4ChPZPqyAiYqcPpxTpGsjofn7
	 +AaCnL2XbAuqXMb7bkiq03SNAS6UkAIY0Szg90jkIBdCtklz/RqVPuG9DWjo0JDjlM
	 3LiFQIdObCo9qPYre5Z7VDfR1CGWM94wqerYQal1xhaKuWkk8osHnpqIVnLsX9ptmF
	 Z9eAhZ4hkvEw0Kgxaa/Gg4shdNHTGJDVKqoNzDNPU9eShbGHLtvqzUc3TT/PFnUdcz
	 RzaXpFnNUp1Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4314284D98;
	Fri, 24 Apr 2026 16:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BEDD24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B6984C77
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cia_hOsiDBdu for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6986C84C4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6986C84C4C
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12F5482B2F; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e0914c0ef7ad85b3f969788af8f0c49cf021c2b8
X-Git-Newrev: 953c7fb20d79be66a8fc99844c2b83d61361c7b1
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.12F5482B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/freetype: patch
 CVE-2026-23865
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/953c7fb20d79be66a8fc99844c2b83d61361c7b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following security vulnerability:

- CVE-2026-23865:
    An integer overflow in the tt_var_load_item_variation_store function
    of the Freetype library in versions 2.13.2 and 2.13.3 may allow for an
    out of bounds read operation when parsing HVAR/VVAR/MVAR tables in
    OpenType variable fonts. This issue is fixed in version 2.14.2.

For more information, see
  - https://www.cve.org/CVERecord?id=CVE-2026-23865
  - https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch

(cherry picked from commit 6c3933d14bc6b8622733f1ada788c168ba9f8775)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ck-for-overflow-in-array-size-computation.patch | 54 ++++++++++++++++++++++
 package/freetype/freetype.mk                       |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
new file mode 100644
index 0000000000..6951880854
--- /dev/null
+++ b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
@@ -0,0 +1,54 @@
+From fc85a255849229c024c8e65f536fe1875d84841c Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 3 Jan 2026 08:07:57 +0100
+Subject: [PATCH] [ttgxvar] Check for overflow in array size computation.
+
+Problem reported and analyzed by povcfe <povcfe2sec@gmail.com>.
+
+Fixes issue #1382.
+
+* src/truetype/ttgxvar.c (tt_var_load_item_variation_store): Do it.
+
+CVE: CVE-2026-23865
+Upstream: https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/truetype/ttgxvar.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 2ff40c9e8..96ddc04c8 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -609,6 +609,7 @@
+       FT_UShort  word_delta_count;
+       FT_UInt    region_idx_count;
+       FT_UInt    per_region_size;
++      FT_UInt    delta_set_size;
+ 
+ 
+       if ( FT_STREAM_SEEK( offset + dataOffsetArray[i] ) )
+@@ -666,7 +667,19 @@
+       if ( long_words )
+         per_region_size *= 2;
+ 
+-      if ( FT_NEW_ARRAY( varData->deltaSet, per_region_size * item_count ) )
++      /* Check for overflow (we actually test whether the     */
++      /* multiplication of two unsigned values wraps around). */
++      delta_set_size = per_region_size * item_count;
++      if ( per_region_size                                &&
++           delta_set_size / per_region_size != item_count )
++      {
++        FT_TRACE2(( "tt_var_load_item_variation_store:"
++                    " bad delta set array size\n" ));
++        error = FT_THROW( Array_Too_Large );
++        goto Exit;
++      }
++
++      if ( FT_NEW_ARRAY( varData->deltaSet, delta_set_size ) )
+         goto Exit;
+       if ( FT_Stream_Read( stream,
+                            varData->deltaSet,
+-- 
+GitLab
+
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad8cd00ec8..51b0471d4f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,6 +15,9 @@ FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
+# 0001-Check-for-overflow-in-array-size-computation.patch
+FREETYPE_IGNORE_CVES += CVE-2026-23865
+
 # harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
 # a circular dependency
 FREETYPE_CONF_OPTS = --without-harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
