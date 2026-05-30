Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D94CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 768A24598A;
	Tue,  9 Jun 2026 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdKb-qISMBcn; Tue,  9 Jun 2026 13:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF3C459F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010307;
	bh=2xIICu3fWIh+06Ry4KM4fYKFpF1itpQfDhg55c5zlI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J1Po4PIUKRzt2ALrS4tGS/zIzm9RVPzce9EKUBlJxfUkYT3MrII303qGdu3EuvCLr
	 EIFlQO2ZJF4i0OCK5v6lNjeJiD3cAcZc2yLW9gP2jaz0rbdGddzyseMIuPbaJtLhIy
	 NqSisfEhSwlWbfLG0815NMFRy33gnBDmw9gLbcnA1Fd0cDLnDejoGQ75d0Il+Uyq5d
	 tcQI/uIPzFF1XsdAdipUhdxKaPOgdDGzpeL7uiWFNmNGQ+mVyZOuZjnEs6TOffd3pJ
	 g0HTpMSwIXwzdzSK7/wOG56XfoPovJ48J8DOGIlTJnRlNAifn78/kjYZVf/57Wxzqk
	 u+EYM8JNn9l7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF3C459F4;
	Tue,  9 Jun 2026 13:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E432EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01254272C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJRNjmNlDFfH for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2B35426F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B35426F6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEC2787E7E; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44c7f9b2dd16ca3d78318a4036cc7237bcfcf2c8
X-Git-Newrev: 27ebca4af2cce6a24fdd9b9f1f8ce280f4c381c0
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.EEC2787E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add build fixes for gcc
 16.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/27ebca4af2cce6a24fdd9b9f1f8ce280f4c381c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Backport patch from binutils 2.46 to fix build errors with gcc 16.x on
or1k.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch | 61 ++++++++++++++++++++++
 ...or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch | 61 ++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch b/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
new file mode 100644
index 0000000000..f4121ee80f
--- /dev/null
+++ b/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
@@ -0,0 +1,61 @@
+From d320649e1805e5330a09b103d4ca890a12815f56 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 18 Nov 2025 12:09:54 +0800
+Subject: [PATCH] or1k: Mark undefined TLS symbol as STT_TLS
+
+Update or1k_apply_fix to handle all TLS relocations.
+
+	PR gas/33426
+	* config/tc-or1k.c (or1k_apply_fix): Handle all TLS relocations.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d320649e1805e5330a09b103d4ca890a12815f56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gas/config/tc-or1k.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gas/config/tc-or1k.c b/gas/config/tc-or1k.c
+index f5a20b94fa7..798cf6d6acc 100644
+--- a/gas/config/tc-or1k.c
++++ b/gas/config/tc-or1k.c
+@@ -354,22 +354,28 @@ or1k_apply_fix (struct fix *f, valueT *t, segT s)
+ 
+   switch (f->fx_r_type)
+     {
++    case BFD_RELOC_OR1K_TLS_DTPMOD:
++    case BFD_RELOC_OR1K_TLS_DTPOFF:
+     case BFD_RELOC_OR1K_TLS_GD_HI16:
++    case BFD_RELOC_OR1K_TLS_GD_LO13:
+     case BFD_RELOC_OR1K_TLS_GD_LO16:
+     case BFD_RELOC_OR1K_TLS_GD_PG21:
+-    case BFD_RELOC_OR1K_TLS_GD_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_AHI16:
++    case BFD_RELOC_OR1K_TLS_IE_HI16:
++    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_LO16:
++    case BFD_RELOC_OR1K_TLS_IE_PG21:
+     case BFD_RELOC_OR1K_TLS_LDM_HI16:
++    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDM_LO16:
+     case BFD_RELOC_OR1K_TLS_LDM_PG21:
+-    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDO_HI16:
+     case BFD_RELOC_OR1K_TLS_LDO_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_HI16:
+-    case BFD_RELOC_OR1K_TLS_IE_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_PG21:
+-    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_LE_AHI16:
+     case BFD_RELOC_OR1K_TLS_LE_HI16:
+     case BFD_RELOC_OR1K_TLS_LE_LO16:
++    case BFD_RELOC_OR1K_TLS_LE_SLO16:
++    case BFD_RELOC_OR1K_TLS_TPOFF:
+       S_SET_THREAD_LOCAL (f->fx_addsy);
+       break;
+     default:
+-- 
+2.43.7
+
diff --git a/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch b/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
new file mode 100644
index 0000000000..f4121ee80f
--- /dev/null
+++ b/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
@@ -0,0 +1,61 @@
+From d320649e1805e5330a09b103d4ca890a12815f56 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 18 Nov 2025 12:09:54 +0800
+Subject: [PATCH] or1k: Mark undefined TLS symbol as STT_TLS
+
+Update or1k_apply_fix to handle all TLS relocations.
+
+	PR gas/33426
+	* config/tc-or1k.c (or1k_apply_fix): Handle all TLS relocations.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d320649e1805e5330a09b103d4ca890a12815f56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gas/config/tc-or1k.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gas/config/tc-or1k.c b/gas/config/tc-or1k.c
+index f5a20b94fa7..798cf6d6acc 100644
+--- a/gas/config/tc-or1k.c
++++ b/gas/config/tc-or1k.c
+@@ -354,22 +354,28 @@ or1k_apply_fix (struct fix *f, valueT *t, segT s)
+ 
+   switch (f->fx_r_type)
+     {
++    case BFD_RELOC_OR1K_TLS_DTPMOD:
++    case BFD_RELOC_OR1K_TLS_DTPOFF:
+     case BFD_RELOC_OR1K_TLS_GD_HI16:
++    case BFD_RELOC_OR1K_TLS_GD_LO13:
+     case BFD_RELOC_OR1K_TLS_GD_LO16:
+     case BFD_RELOC_OR1K_TLS_GD_PG21:
+-    case BFD_RELOC_OR1K_TLS_GD_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_AHI16:
++    case BFD_RELOC_OR1K_TLS_IE_HI16:
++    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_LO16:
++    case BFD_RELOC_OR1K_TLS_IE_PG21:
+     case BFD_RELOC_OR1K_TLS_LDM_HI16:
++    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDM_LO16:
+     case BFD_RELOC_OR1K_TLS_LDM_PG21:
+-    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDO_HI16:
+     case BFD_RELOC_OR1K_TLS_LDO_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_HI16:
+-    case BFD_RELOC_OR1K_TLS_IE_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_PG21:
+-    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_LE_AHI16:
+     case BFD_RELOC_OR1K_TLS_LE_HI16:
+     case BFD_RELOC_OR1K_TLS_LE_LO16:
++    case BFD_RELOC_OR1K_TLS_LE_SLO16:
++    case BFD_RELOC_OR1K_TLS_TPOFF:
+       S_SET_THREAD_LOCAL (f->fx_addsy);
+       break;
+     default:
+-- 
+2.43.7
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
