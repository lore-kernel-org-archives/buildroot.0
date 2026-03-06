Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7A8FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25D341F44;
	Fri,  6 Mar 2026 19:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4riFjtsBBOSZ; Fri,  6 Mar 2026 19:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6141841E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826748;
	bh=NRmFHuNF871o0SgmoPrBcRsW43FPtyOeH+cbO3Wa+K4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JGnJsaxWILby9jzf6iJ51k1ExPN+esAg2iXi6n+BLZKrRzye9TT/yPDxpl0d1IDb3
	 8lrqQxbwrGapeB4QdWkwqiFgP7qxwdVeenEa5uFpSmYBGclLdg/2xwpX36MphfKZym
	 jAG42r9db7BVev/zrtpDTSw4EwphwOq3v6RcN6zMr2KpkdRfwv9SwMkyz+MgfXSJbA
	 MRy837M5clOVOvPa5/2BVnAB2HBppj3Mcr+GTUDsg7IR2Zy9AMAFhKsHd4j/+gqIRJ
	 J9V5+7757oGkJwSyOQ3PFbg7cyV6wRTl5mc3Rd95r7Jk88EPhTdxKGgGOTaxecWFMP
	 6sUhFnwpRGo6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6141841E5C;
	Fri,  6 Mar 2026 19:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2116539B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A63041E77
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgvPQBRPni7q for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F5040310
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F5040310
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F2CB83582; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:44:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d5a067ef22adb4edc4ee765a762e56a748576572
X-Git-Newrev: 4bfacb70abdeecf8d763921f9493b4f43ec8b1ce
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.7F2CB83582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/patch: add
 patches for CVE-2018-6952 & CVE-2019-20633
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4bfacb70abdeecf8d763921f9493b4f43ec8b1ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2018-6952:
    A double free exists in the another_hunk function in pch.c in GNU
    patch through 2.7.6.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2018-6952
  - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300

- CVE-2019-20633:
    GNU patch through 2.7.6 contains a free(p_line[p_end]) Double Free
    vulnerability in the function another_hunk in pch.c that can cause a
    denial of service via a crafted patch file. NOTE: this issue exists
    because of an incomplete fix for CVE-2018-6952.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2019-20633
  - https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b28f9363c5afbf0782fad6ca5faf71fdd89ee15c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0006-Fix-swapping-fake-lines-in-pch-swap.patch | 33 ++++++++++++++++++++++
 ...lid-memory-access-in-context-format-diffs.patch | 30 ++++++++++++++++++++
 package/patch/patch.mk                             |  6 ++++
 3 files changed, 69 insertions(+)

diff --git a/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
new file mode 100644
index 0000000000..6fd63dff53
--- /dev/null
+++ b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
@@ -0,0 +1,33 @@
+From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 17 Aug 2018 13:35:40 +0200
+Subject: Fix swapping fake lines in pch_swap
+
+* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
+blank line in the middle of a context-diff hunk: that empty line stays
+in the middle of the hunk and isn't swapped.
+
+Fixes: https://savannah.gnu.org/bugs/index.php?53133
+CVE: CVE-2018-6952
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/pch.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index e92bc64..a500ad9 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2115,7 +2115,7 @@ pch_swap (void)
+     }
+     if (p_efake >= 0) {			/* fix non-freeable ptr range */
+ 	if (p_efake <= i)
+-	    n = p_end - i + 1;
++	    n = p_end - p_ptrn_lines;
+ 	else
+ 	    n = -i;
+ 	p_efake += n;
+-- 
+cgit v1.2.3
+
diff --git a/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
new file mode 100644
index 0000000000..5ffe3699ef
--- /dev/null
+++ b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
@@ -0,0 +1,30 @@
+From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 19:10:02 +0200
+Subject: Avoid invalid memory access in context format diffs
+
+* src/pch.c (another_hunk): Avoid invalid memory access in context format
+diffs.
+
+CVE: CVE-2019-20633
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/pch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pch.c b/src/pch.c
+index a500ad9..cb54e03 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1327,6 +1327,7 @@ another_hunk (enum diff difftype, bool rev)
+ 		  ptrn_prefix_context = context;
+ 		ptrn_suffix_context = context;
+ 		if (repl_beginning
++		    || p_end <= 0
+ 		    || (p_end
+ 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
+ 		  {
+-- 
+cgit v1.2.3
+
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 6f83d2418c..9272449159 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -23,6 +23,12 @@ PATCH_IGNORE_CVES += CVE-2018-20969 CVE-2019-13638
 # 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
 PATCH_IGNORE_CVES += CVE-2019-13636
 
+# 0006-Fix-swapping-fake-lines-in-pch-swap.patch
+PATCH_IGNORE_CVES += CVE-2018-6952
+
+# 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
+PATCH_IGNORE_CVES += CVE-2019-20633
+
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
