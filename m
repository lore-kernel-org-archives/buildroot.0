Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16599FD45EC
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6C361767;
	Wed, 25 Feb 2026 21:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFvldjSeq8lV; Wed, 25 Feb 2026 21:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8419E60FF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772054116;
	bh=3hAQquTNGUDV+mI2PvnmzkOdyJanaPkxjJhr4a5Hg9E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a0Y3Y8JDbej82zpzYPJjruV/cH1hgPWLWmhZPCIl1Fp+4EJ0kiwXd1AFtCnnwSq6H
	 6q+8dNqmCjG5HcPw9rAXb5p9RQJhe9Frt6kZAQOUTphFXuTn0/IyPNDw4FAM/Xu34C
	 F1sTFF3MqJgg7AMMjN8UtRbNQN2tZJHKeLkmzZo7nx/PUpGd7fU+zJU+RPqIIl4XK9
	 UY7BsIL9oZxorMw+RPiHjEgzKTuACCle9BKpxMKVBOuYkV5iaSCy2obwMKrdccXEYE
	 LIFhVVEFUokwMsOl3VRgSUsCbEYuYJnvanZDHzo+RgF9Uwpb6v98mpwdYMDB+xkc/t
	 MX/EDH4Bxmuiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8419E60FF7;
	Wed, 25 Feb 2026 21:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2484204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D411F60FF7
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSSeB49GY1x2 for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 21:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6C8607E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6C8607E8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:15:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A979B874BA; Wed, 25 Feb 2026 21:15:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 22:11:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49e180d3d55fcf83f927fb7b5e168aa8ced28b15
X-Git-Newrev: b28f9363c5afbf0782fad6ca5faf71fdd89ee15c
X-Patchwork-Hint: ignore
Message-Id: <20260225211514.A979B874BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/patch: add patches for
 CVE-2018-6952 & CVE-2019-20633
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b28f9363c5afbf0782fad6ca5faf71fdd89ee15c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
