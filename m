Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99251C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37EEF60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37EEF60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED4FD400B5;
	Wed,  4 Aug 2021 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3fWKQQfmMaM; Wed,  4 Aug 2021 21:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D5B400F8;
	Wed,  4 Aug 2021 21:27:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 203581BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1084260595
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLrhLtvMVlgS for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4809600C4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 924E482A68; Wed,  4 Aug 2021 21:27:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:41:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e9dc4395e80233037bab60533a3658f1ef3c1eff
X-Git-Newrev: b0a9055da358d737c45a4c93969b6b851ef037c5
X-Patchwork-Hint: ignore
Message-Id: <20210804212704.924E482A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/binutils: update
 or1k patches for plt link version with upstream
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b0a9055da358d737c45a4c93969b6b851ef037c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Actual patches are stubs suggested but now they are available as upstream.
So let's substitute them since they make part of a or1k patchset and next
patch will add the others.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
(cherry picked from commit e5978dae8527ec7a6714920f3ae5112e2cbffa41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch   | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch   | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 8 files changed, 236 insertions(+), 140 deletions(-)

diff --git a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 824c9ce3e5..0000000000
--- a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 93cf62b662499e560812145dd989056fcf14f00e Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 2f200b197b..ae508540f5 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2535,11 +2535,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..a67d12789e
--- /dev/null
+++ b/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From 788cda9f9447e0fe67e582e8fb5adafd678d08b2 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 2f200b197b8..1f2c88b0b3a 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2535,11 +2535,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..bc0ef2b224
--- /dev/null
+++ b/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From 651c3617a04a1d1f78e89623b81be7ba32ff59a5 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 31ef758a926..58246875546 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2535,11 +2535,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..81fb6b8518
--- /dev/null
+++ b/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From baf313f84b106a5a29f01796afd857e69abf8b08 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 7c02d004cc7..bbfa2bfe614 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2568,11 +2568,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..85931ff661
--- /dev/null
+++ b/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From b5fdaa85790dff45fd2c3fd15405c16dbc50a074 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 65938e51378..4f82cc4c667 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
