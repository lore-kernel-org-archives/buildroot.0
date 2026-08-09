Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AE2C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 08:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0EB880DF8;
	Sun,  9 Aug 2026 08:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxNrtycii89d; Sun,  9 Aug 2026 08:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFCFC80B39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786264558;
	bh=FKwR1L31bGO2ZTsVC1NQzIgk2F4T7fsI7+UcnB/niPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xj3BDaSTc8T/g+z8laG2lNlHX7S/bQSS/7DpEHEnYbmwy3CusFAFMLocLuQsERbxz
	 HYjrxQcAdWk0Ocpwv0LK5Zf7krk67b06sNRvhT6PcbVzxdZilHIQumh8+SwHqZwpn8
	 5A8ty/orjXEFwRJAOpRajEySB2+Nxwd66gFzx7HrFPp/1JVkfmTCYWGNnISosRXVYh
	 7O/aqHzoRYNFkY/tJOiA4OHti2CA8qdvxoxrXipVyb+u13NsfLBgQJNCi/rmFaxJix
	 aw+DvMUuebsxct0Ex2AFZTRgDk1/GXpIvOO9YpW8VOiVyJ/qAPWiNi5izCRXyURcdB
	 oFSK7wQLSUJCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFCFC80B39;
	Sun,  9 Aug 2026 08:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A53A23F
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 977B94052A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-pnogMZzc1h for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 08:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0AC403C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0AC403C7
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32A258D201; Sun,  9 Aug 2026 08:35:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 10:35:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a60ae04dbd27dde7b036eb2d09efe0c6943d8040
X-Git-Newrev: 11bf0dc202c46c0cc3b9a5357b28fb649a886362
X-Patchwork-Hint: ignore
Message-Id: <20260809083508.32A258D201@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: 15.3.0: add GCC patch to fix
 mips/glibc build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11bf0dc202c46c0cc3b9a5357b28fb649a886362
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a build error with glibc:

programs/locfile.c: In function 'align_locale_data':
programs/locfile.c:584:1: internal compiler error:
 in mips_load_store_insns, at config/mips/mips.cc:3137

by backporting an upstream fix which is already included in gcc 16.1.

The build error does not occur with gcc 14.x.

Fixes:
https://autobuild.buildroot.org/results/b925a444bb3ef03354224ac643b0b3160c4c5e8a/

The oldest recorded build error dates back to July 2025:
https://autobuild.buildroot.net/results/cb1/cb156fb938de26dd5dfe7fc48a1e061efa0284c7/

so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mization-123833-Use-of-insn-attributes-in.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch b/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch
new file mode 100644
index 0000000000..81b43a5757
--- /dev/null
+++ b/package/gcc/15.3.0/0003-PR-rtl-optimization-123833-Use-of-insn-attributes-in.patch
@@ -0,0 +1,85 @@
+From 654c733fa3f10531f3fd6b6d89e39f28c0075bd6 Mon Sep 17 00:00:00 2001
+From: Roger Sayle <roger@nextmovesoftware.com>
+Date: Sat, 7 Feb 2026 07:50:41 +0000
+Subject: [PATCH] PR rtl-optimization/123833: Use of insn attributes in
+ insn_costs corrupts recog_data.
+
+Thanks again to Jeff Law and Andrew Pinski.  Here's a revised patch that
+addresses the true underlying cause of PR 128333.  recog.cc's cancel_changes
+was not correctly updating the recog_data cache, which leads to strange
+(incorrect) behavior in fwprop and ifcvt.
+
+2026-02-07  Roger Sayle  <roger@nextmovesoftware.com>
+	    Andrew Pinski  <andrew.pinski@oss.qualcomm.com>
+	    Jeff Law  <jeffrey.law@oss.qualcomm.com>
+
+gcc/ChangeLog
+	PR rtl-optimization/123833
+	* recog.cc (cancel_changes): Update the recog_data cache if it
+	holds the instruction being changed.
+
+gcc/testsuite
+	PR rtl-optimization/123833
+	* gcc.target/mips/pr123833.c: New test case.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=654c733fa3f10531f3fd6b6d89e39f28c0075bd6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/recog.cc                             |  6 +++++-
+ gcc/testsuite/gcc.target/mips/pr123833.c | 26 ++++++++++++++++++++++++
+ 2 files changed, 31 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/mips/pr123833.c
+
+diff --git a/gcc/recog.cc b/gcc/recog.cc
+index 48f6b45ec6d..f37e548d6ab 100644
+--- a/gcc/recog.cc
++++ b/gcc/recog.cc
+@@ -608,7 +608,11 @@ cancel_changes (int num)
+       else
+ 	*changes[i].loc = changes[i].old;
+       if (changes[i].object && !MEM_P (changes[i].object))
+-	INSN_CODE (changes[i].object) = changes[i].old_code;
++	{
++	  INSN_CODE (changes[i].object) = changes[i].old_code;
++	  if (recog_data.insn == changes[i].object)
++	    recog_data.insn = nullptr;
++	}
+     }
+   num_changes = num;
+ }
+diff --git a/gcc/testsuite/gcc.target/mips/pr123833.c b/gcc/testsuite/gcc.target/mips/pr123833.c
+new file mode 100644
+index 00000000000..4d0c9e8eaec
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/mips/pr123833.c
+@@ -0,0 +1,26 @@
++/* { dg-do compile } */
++/* { dg-options "-O1 -mabi=64 -mhard-float" } */
++
++typedef short int16_t;
++typedef signed char int8_t;
++typedef long long int64_t;
++typedef unsigned char uint8_t;
++typedef unsigned long long uint64_t;
++
++#define BS_VEC(type, num) type __attribute__((vector_size(num * sizeof(type))))
++BS_VEC(int8_t, 2) backsmith_pure_0(int64_t);
++uint64_t backsmith_pure_4(int16_t BS_ARG_0)
++{
++    BS_VEC(int16_t, 16)
++    BS_VAR_0 = __builtin_convertvector(
++        __builtin_shufflevector(backsmith_pure_0(0), backsmith_pure_0(0), 0, 2,
++                                2, 3, 2, 1, 2, 3, 0, 2, 0, 0, 2, 2, 0, 1),
++        BS_VEC(int16_t, 16));
++    for (;;)
++    {
++        if (__builtin_ctzg((uint8_t)BS_VAR_0[3], BS_ARG_0))
++            for (;;);
++        return 0;
++    }
++}
++
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
