Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87EC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE9856FBBB;
	Fri, 28 Feb 2025 17:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R06GKvRmlHzu; Fri, 28 Feb 2025 17:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E91D70817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E91D70817;
	Fri, 28 Feb 2025 17:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08907711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D92F2406E6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EK1bUi5jRU9t for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4852842644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4852842644
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 405838283C; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 09:51:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c29f6393ab37d0c8816d70bf21b118ed778f790d
X-Git-Newrev: 75c594d4468430067fbe1a9c81aefd80b4c2a064
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.405838283C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: fix pending
 CVEs
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8643350990633255788=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8643350990633255788==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=75c594d4468430067fbe1a9c81aefd80b4c2a064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds patches, which were all backported from upstream, or
submitted upstream, and that fix various CVEs. To facilitate the
backporting work, we took the backports from openembedded-core.

CVE-2021-42380: this one is not marked by NVD as affecting 1.36.1, but
its fix was merged after 1.36.1, so it seems like the NVD data is
incorrect. Therefore, no need for a BUSYBOX_IGNORE_CVES entry. Patch
is upstream, backport taken from openembedded-core.

CVE-2023-42363, CVE-2023-42364, CVE-2023-42365: patches are upstream,
backports taken from openembedded-core.

CVE-2023-42366: patch has been submitted upstream but not merged,
patch taken from openembedded-core.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-after-realloc-CVE-2021-42380-closes-1560.patch | 154 ++++++++++++++++
 ...012-awk-fix-use-after-free-CVE-2023-42363.patch |  70 +++++++
 .../0013-awk-fix-precedence-of-relative-to.patch   | 203 +++++++++++++++++++++
 ...wk-fix-ternary-operator-and-precedence-of.patch | 102 +++++++++++
 .../0015-awk.c-fix-CVE-2023-42366-bug-15874.patch  |  43 +++++
 package/busybox/busybox.mk                         |  10 +
 6 files changed, 582 insertions(+)

diff --git a/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch b/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
new file mode 100644
index 0000000000..f0f33b11ff
--- /dev/null
+++ b/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
@@ -0,0 +1,154 @@
+From 7c73cdaa80faf0046b07c970321557ff04f7da64 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 26 May 2023 19:36:58 +0200
+Subject: [PATCH] awk: fix use-after-realloc (CVE-2021-42380), closes 15601
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2021-42380
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
+Upstream: https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ editors/awk.c       | 26 ++++++++++++++++-----
+ testsuite/awk.tests | 55 +++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 75 insertions(+), 6 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 728ee8685..2af823808 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -555,7 +555,7 @@ struct globals {
+ 	const char *g_progname;
+ 	int g_lineno;
+ 	int nfields;
+-	int maxfields; /* used in fsrealloc() only */
++	unsigned maxfields;
+ 	var *Fields;
+ 	char *g_pos;
+ 	char g_saved_ch;
+@@ -1931,9 +1931,9 @@ static void fsrealloc(int size)
+ {
+ 	int i, newsize;
+ 
+-	if (size >= maxfields) {
+-		/* Sanity cap, easier than catering for overflows */
+-		if (size > 0xffffff)
++	if ((unsigned)size >= maxfields) {
++		/* Sanity cap, easier than catering for over/underflows */
++		if ((unsigned)size > 0xffffff)
+ 			bb_die_memory_exhausted();
+ 
+ 		i = maxfields;
+@@ -2891,6 +2891,7 @@ static var *evaluate(node *op, var *res)
+ 		uint32_t opinfo;
+ 		int opn;
+ 		node *op1;
++		var *old_Fields_ptr;
+ 
+ 		opinfo = op->info;
+ 		opn = (opinfo & OPNMASK);
+@@ -2899,10 +2900,16 @@ static var *evaluate(node *op, var *res)
+ 		debug_printf_eval("opinfo:%08x opn:%08x\n", opinfo, opn);
+ 
+ 		/* execute inevitable things */
++		old_Fields_ptr = NULL;
+ 		if (opinfo & OF_RES1) {
+ 			if ((opinfo & OF_REQUIRED) && !op1)
+ 				syntax_error(EMSG_TOO_FEW_ARGS);
+ 			L.v = evaluate(op1, TMPVAR0);
++			/* Does L.v point to $n variable? */
++			if ((size_t)(L.v - Fields) < maxfields) {
++				/* yes, remember where Fields[] is */
++				old_Fields_ptr = Fields;
++			}
+ 			if (opinfo & OF_STR1) {
+ 				L.s = getvar_s(L.v);
+ 				debug_printf_eval("L.s:'%s'\n", L.s);
+@@ -2921,8 +2928,15 @@ static var *evaluate(node *op, var *res)
+ 		 */
+ 		if (opinfo & OF_RES2) {
+ 			R.v = evaluate(op->r.n, TMPVAR1);
+-			//TODO: L.v may be invalid now, set L.v to NULL to catch bugs?
+-			//L.v = NULL;
++			/* Seen in $5=$$5=$0:
++			 * Evaluation of R.v ($$5=$0 expression)
++			 * made L.v ($5) invalid. It's detected here.
++			 */
++			if (old_Fields_ptr) {
++				//if (old_Fields_ptr != Fields)
++				//	debug_printf_eval("L.v moved\n");
++				L.v += Fields - old_Fields_ptr;
++			}
+ 			if (opinfo & OF_STR2) {
+ 				R.s = getvar_s(R.v);
+ 				debug_printf_eval("R.s:'%s'\n", R.s);
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index bbf0fbff1..ddc51047b 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -485,4 +485,59 @@ testing 'awk assign while test' \
+ 	"" \
+ 	"foo"
+ 
++# User-supplied bug (SEGV) example, was causing use-after-realloc
++testing 'awk assign while assign' \
++	"awk '\$5=\$\$5=\$0'; echo \$?" \
++	"\
++─ process timing ────────────────────────────────────┬─ ─ process timing ────────────────────────────────────┬─ overall results ────┐ results ────┐
++│ run time : │        run time : 0 days, 0 hrs, 0 min, 56 sec      │  cycles done : 0     │ days, 0 hrs, 0 min, 56 sec │ cycles done : 0 │
++│ last new find │   last new find : 0 days, 0 hrs, 0 min, 1 sec       │ corpus count : 208   │ 0 days, 0 hrs, 0 min, 1 sec │ corpus count : 208 │
++│last saved crash : │last saved crash : none seen yet                     │saved crashes : 0     │ seen yet │saved crashes : 0 │
++│ last saved hang │ last saved hang : none seen yet                     │  saved hangs : 0     │ none seen yet │ saved hangs : 0 │
++├─ cycle progress ─────────────────────┬─ ├─ cycle progress ─────────────────────┬─ map coverage┴──────────────────────┤ coverage┴──────────────────────┤
++│ now processing : │  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │ (88.5%) │ map density : 0.30% / 0.52% │                                                                                                                                                                          │  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │
++│ runs timed out │  runs timed out : 0 (0.00%)          │ count coverage : 2.18 bits/tuple    │ 0 (0.00%) │ count coverage : 2.18 bits/tuple │
++├─ stage progress ─────────────────────┼─ ├─ stage progress ─────────────────────┼─ findings in depth ─────────────────┤ in depth ─────────────────┤
++│ now trying : │  now trying : havoc                  │ favored items : 43 (20.67%)         │ │ favored items : 43 (20.67%) │
++│ stage execs : │ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │ (8.51%) │ new edges on │ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │ 52 (25.00%) │
++│ total execs : │ total execs : 179k                   │ total crashes : 0 (0 saved)         │ │ total crashes : 0 (0 saved) │                                                                                                                                                                      │ total execs : 179k                   │ total crashes : 0 (0 saved)         │
++│ exec speed : │  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │ │ total tmouts : 0 (0 saved) │                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                     │  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │
++├─ fuzzing strategy yields ├─ fuzzing strategy yields ────────────┴─────────────┬─ item geometry ───────┤ item geometry ───────┤
++│ bit flips : │   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │ 4/638, 5/618 │ levels : │   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │ │
++│ byte flips : │  byte flips : 0/81, 0/71, 0/52                     │   pending : 199       │ 0/71, 0/52 │ pending : 199 │
++│ arithmetics : 11/4494, │ arithmetics : 11/4494, 0/1153, 0/0                 │  pend fav : 35        │ 0/0 │ pend fav : 35 │
++│  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │ known ints : │  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │ 0/1986, 0/2288 │ own finds : 207 │
++│ dictionary : 0/0, │  dictionary : 0/0, 0/0, 0/0, 0/0                   │  imported : 0         │ 0/0, 0/0 │ imported : 0 │
++│havoc/splice : 142/146k, 23/7616 │havoc/splice : 142/146k, 23/7616                    │ stability : 100.00%   │ stability : 100.00% │
++│py/custom/rq : unused, unused, │py/custom/rq : unused, unused, unused, unused       ├───────────────────────┘ unused ├───────────────────────┘
++│ trim/eff : 57.02%/26, │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%] │ [cpu000:100%]
++└────────────────────────────────────────────────────┘^C    └────────────────────────────────────────────────────┘^C
++0
++" \
++	"" \
++	"\
++─ process timing ────────────────────────────────────┬─ overall results ────┐
++│        run time : 0 days, 0 hrs, 0 min, 56 sec      │  cycles done : 0     │
++│   last new find : 0 days, 0 hrs, 0 min, 1 sec       │ corpus count : 208   │
++│last saved crash : none seen yet                     │saved crashes : 0     │
++│ last saved hang : none seen yet                     │  saved hangs : 0     │
++├─ cycle progress ─────────────────────┬─ map coverage┴──────────────────────┤
++│  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │
++│  runs timed out : 0 (0.00%)          │ count coverage : 2.18 bits/tuple    │
++├─ stage progress ─────────────────────┼─ findings in depth ─────────────────┤
++│  now trying : havoc                  │ favored items : 43 (20.67%)         │
++│ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │
++│ total execs : 179k                   │ total crashes : 0 (0 saved)         │
++│  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │
++├─ fuzzing strategy yields ────────────┴─────────────┬─ item geometry ───────┤
++│   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │
++│  byte flips : 0/81, 0/71, 0/52                     │   pending : 199       │
++│ arithmetics : 11/4494, 0/1153, 0/0                 │  pend fav : 35        │
++│  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │
++│  dictionary : 0/0, 0/0, 0/0, 0/0                   │  imported : 0         │
++│havoc/splice : 142/146k, 23/7616                    │ stability : 100.00%   │
++│py/custom/rq : unused, unused, unused, unused       ├───────────────────────┘
++│    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
++└────────────────────────────────────────────────────┘^C"
++
+ exit $FAILCOUNT
+-- 
+2.47.1
+
diff --git a/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch b/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch
new file mode 100644
index 0000000000..92a6c36d01
--- /dev/null
+++ b/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch
@@ -0,0 +1,70 @@
+From 20a91edce02adc258038a2e9bf5bda0fe27a5050 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 20 May 2024 17:55:28 +0200
+Subject: [PATCH] awk: fix use after free (CVE-2023-42363)
+
+function                                             old     new   delta
+evaluate                                            3377    3385      +8
+
+Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-42363
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
+Upstream: https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ editors/awk.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 2af823808..d45724d59 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2910,19 +2910,14 @@ static var *evaluate(node *op, var *res)
+ 				/* yes, remember where Fields[] is */
+ 				old_Fields_ptr = Fields;
+ 			}
+-			if (opinfo & OF_STR1) {
+-				L.s = getvar_s(L.v);
+-				debug_printf_eval("L.s:'%s'\n", L.s);
+-			}
+ 			if (opinfo & OF_NUM1) {
+ 				L_d = getvar_i(L.v);
+ 				debug_printf_eval("L_d:%f\n", L_d);
+ 			}
+ 		}
+-		/* NB: Must get string/numeric values of L (done above)
+-		 * _before_ evaluate()'ing R.v: if both L and R are $NNNs,
+-		 * and right one is large, then L.v points to Fields[NNN1],
+-		 * second evaluate() reallocates and moves (!) Fields[],
++		/* NB: if both L and R are $NNNs, and right one is large,
++		 * then at this pint L.v points to Fields[NNN1], second
++		 * evaluate() below reallocates and moves (!) Fields[],
+ 		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
+ 		 * (Seen trying to evaluate "$444 $44444")
+ 		 */
+@@ -2942,6 +2937,16 @@ static var *evaluate(node *op, var *res)
+ 				debug_printf_eval("R.s:'%s'\n", R.s);
+ 			}
+ 		}
++		/* Get L.s _after_ R.v is evaluated: it may have realloc'd L.v
++		 * so we must get the string after "old_Fields_ptr" correction
++		 * above. Testcase: x = (v = "abc", gsub("b", "X", v));
++		 */
++		if (opinfo & OF_RES1) {
++			if (opinfo & OF_STR1) {
++				L.s = getvar_s(L.v);
++				debug_printf_eval("L.s:'%s'\n", L.s);
++			}
++		}
+ 
+ 		debug_printf_eval("switch(0x%x)\n", XC(opinfo & OPCLSMASK));
+ 		switch (XC(opinfo & OPCLSMASK)) {
+-- 
+2.47.1
+
diff --git a/package/busybox/0013-awk-fix-precedence-of-relative-to.patch b/package/busybox/0013-awk-fix-precedence-of-relative-to.patch
new file mode 100644
index 0000000000..596036d8fc
--- /dev/null
+++ b/package/busybox/0013-awk-fix-precedence-of-relative-to.patch
@@ -0,0 +1,203 @@
+From 47ff44735c0cd05efd899fb3486aca77e65fbe15 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 30 May 2023 16:42:18 +0200
+Subject: [PATCH] awk: fix precedence of = relative to ==
+
+Discovered while adding code to disallow assignments to non-lvalues
+
+function                                             old     new   delta
+parse_expr                                           936     991     +55
+.rodata                                           105243  105247      +4
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 59/0)               Total: 59 bytes
+
+CVE: CVE-2023-42364 CVE-2023-42365
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
+Upstream: https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ editors/awk.c       | 66 ++++++++++++++++++++++++++++++---------------
+ testsuite/awk.tests |  5 ++++
+ 2 files changed, 50 insertions(+), 21 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index d45724d59..5962c3f6a 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -337,7 +337,9 @@ static void debug_parse_print_tc(uint32_t n)
+ #undef P
+ #undef PRIMASK
+ #undef PRIMASK2
+-#define P(x)      (x << 24)
++/* Smaller 'x' means _higher_ operator precedence */
++#define PRECEDENCE(x) (x << 24)
++#define P(x)      PRECEDENCE(x)
+ #define PRIMASK   0x7F000000
+ #define PRIMASK2  0x7E000000
+ 
+@@ -360,7 +362,7 @@ enum {
+ 	OC_MOVE = 0x1f00,       OC_PGETLINE = 0x2000,   OC_REGEXP = 0x2100,
+ 	OC_REPLACE = 0x2200,    OC_RETURN = 0x2300,     OC_SPRINTF = 0x2400,
+ 	OC_TERNARY = 0x2500,    OC_UNARY = 0x2600,      OC_VAR = 0x2700,
+-	OC_DONE = 0x2800,
++	OC_CONST = 0x2800,      OC_DONE = 0x2900,
+ 
+ 	ST_IF = 0x3000,         ST_DO = 0x3100,         ST_FOR = 0x3200,
+ 	ST_WHILE = 0x3300
+@@ -440,9 +442,9 @@ static const uint32_t tokeninfo[] ALIGN4 = {
+ #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
+ #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
+ 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
+-	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(74),        OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
+-	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
+-	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
++	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
++	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
++	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
+ 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
+ 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
+ #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
+@@ -1290,7 +1292,7 @@ static uint32_t next_token(uint32_t expected)
+ 			save_tclass = tc;
+ 			save_info = t_info;
+ 			tc = TC_BINOPX;
+-			t_info = OC_CONCAT | SS | P(35);
++			t_info = OC_CONCAT | SS | PRECEDENCE(35);
+ 		}
+ 
+ 		t_tclass = tc;
+@@ -1350,9 +1352,8 @@ static node *parse_expr(uint32_t term_tc)
+ {
+ 	node sn;
+ 	node *cn = &sn;
+-	node *vn, *glptr;
++	node *glptr;
+ 	uint32_t tc, expected_tc;
+-	var *v;
+ 
+ 	debug_printf_parse("%s() term_tc(%x):", __func__, term_tc);
+ 	debug_parse_print_tc(term_tc);
+@@ -1363,11 +1364,12 @@ static node *parse_expr(uint32_t term_tc)
+ 	expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP | term_tc;
+ 
+ 	while (!((tc = next_token(expected_tc)) & term_tc)) {
++		node *vn;
+ 
+ 		if (glptr && (t_info == TI_LESS)) {
+ 			/* input redirection (<) attached to glptr node */
+ 			debug_printf_parse("%s: input redir\n", __func__);
+-			cn = glptr->l.n = new_node(OC_CONCAT | SS | P(37));
++			cn = glptr->l.n = new_node(OC_CONCAT | SS | PRECEDENCE(37));
+ 			cn->a.n = glptr;
+ 			expected_tc = TS_OPERAND | TS_UOPPRE;
+ 			glptr = NULL;
+@@ -1379,24 +1381,42 @@ static node *parse_expr(uint32_t term_tc)
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+ 			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
+-			    || ((t_info == vn->info) && t_info == TI_COLON)
++			    || (t_info == vn->info && t_info == TI_COLON)
+ 			) {
+ 				vn = vn->a.n;
+ 				if (!vn->a.n) syntax_error(EMSG_UNEXP_TOKEN);
+ 			}
+ 			if (t_info == TI_TERNARY)
+ //TODO: why?
+-				t_info += P(6);
++				t_info += PRECEDENCE(6);
+ 			cn = vn->a.n->r.n = new_node(t_info);
+ 			cn->a.n = vn->a.n;
+ 			if (tc & TS_BINOP) {
+ 				cn->l.n = vn;
+-//FIXME: this is the place to detect and reject assignments to non-lvalues.
+-//Currently we allow "assignments" to consts and temporaries, nonsense like this:
+-// awk 'BEGIN { "qwe" = 1 }'
+-// awk 'BEGIN { 7 *= 7 }'
+-// awk 'BEGIN { length("qwe") = 1 }'
+-// awk 'BEGIN { (1+1) += 3 }'
++
++				/* Prevent:
++				 * awk 'BEGIN { "qwe" = 1 }'
++				 * awk 'BEGIN { 7 *= 7 }'
++				 * awk 'BEGIN { length("qwe") = 1 }'
++				 * awk 'BEGIN { (1+1) += 3 }'
++				 */
++				/* Assignment? (including *= and friends) */
++				if (((t_info & OPCLSMASK) == OC_MOVE)
++				 || ((t_info & OPCLSMASK) == OC_REPLACE)
++				) {
++					debug_printf_parse("%s: MOVE/REPLACE vn->info:%08x\n", __func__, vn->info);
++					/* Left side is a (variable or array element)
++					 * or function argument
++					 * or $FIELD ?
++					 */
++					if ((vn->info & OPCLSMASK) != OC_VAR
++					 && (vn->info & OPCLSMASK) != OC_FNARG
++					 && (vn->info & OPCLSMASK) != OC_FIELD
++					) {
++						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
++					}
++				}
++
+ 				expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP;
+ 				if (t_info == TI_PGETLINE) {
+ 					/* it's a pipe */
+@@ -1432,6 +1452,8 @@ static node *parse_expr(uint32_t term_tc)
+ 		/* one should be very careful with switch on tclass -
+ 		 * only simple tclasses should be used (TC_xyz, not TS_xyz) */
+ 		switch (tc) {
++			var *v;
++
+ 		case TC_VARIABLE:
+ 		case TC_ARRAY:
+ 			debug_printf_parse("%s: TC_VARIABLE | TC_ARRAY\n", __func__);
+@@ -1452,14 +1474,14 @@ static node *parse_expr(uint32_t term_tc)
+ 		case TC_NUMBER:
+ 		case TC_STRING:
+ 			debug_printf_parse("%s: TC_NUMBER | TC_STRING\n", __func__);
+-			cn->info = OC_VAR;
++			cn->info = OC_CONST;
+ 			v = cn->l.v = xzalloc(sizeof(var));
+-			if (tc & TC_NUMBER)
++			if (tc & TC_NUMBER) {
+ 				setvar_i(v, t_double);
+-			else {
++			 } else {
+ 				setvar_s(v, t_string);
+-				expected_tc &= ~TC_UOPPOST; /* "str"++ is not allowed */
+ 			}
++			expected_tc &= ~TC_UOPPOST; /* NUM++, "str"++ not allowed */
+ 			break;
+ 
+ 		case TC_REGEXP:
+@@ -3107,6 +3129,8 @@ static var *evaluate(node *op, var *res)
+ 
+ 		/* -- recursive node type -- */
+ 
++		case XC( OC_CONST ):
++			debug_printf_eval("CONST ");
+ 		case XC( OC_VAR ):
+ 			debug_printf_eval("VAR\n");
+ 			L.v = op->l.v;
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index ddc51047b..a78fdcd98 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -540,4 +540,9 @@ testing 'awk assign while assign' \
+ │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
+ └────────────────────────────────────────────────────┘^C"
+ 
++testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
++	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
++	'0\n1\n2\n1\n3\n' \
++	'' ''
++
+ exit $FAILCOUNT
+-- 
+2.47.1
+
diff --git a/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch b/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch
new file mode 100644
index 0000000000..78f21481cc
--- /dev/null
+++ b/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch
@@ -0,0 +1,102 @@
+From 173164c6b2f2ad17dd14d3a43e5bff47abde7199 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 21 May 2024 14:46:08 +0200
+Subject: [PATCH] awk: fix ternary operator and precedence of =
+
+Adjust the = precedence test to match behavior of gawk, mawk and
+FreeBSD.  awk 'BEGIN {print v=3==3; print v}' should print two '1'.
+
+To fix this, and to unbreak the ternary conditional operator, we restore
+the precedence of = in the token list, but override this with a lower
+priority when the assignment is on the right side of a compare.
+
+This fixes commit 0256e00a9d07 (awk: fix precedence of = relative to ==) [1]
+
+CVE: CVE-2023-42364 CVE-2023-42365
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+[1] https://bugs.busybox.net/show_bug.cgi?id=15871#c6
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
+Upstream: https://git.busybox.net/busybox/commit/?id=38335df9e9f45378c3407defd38b5b610578bdda
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ editors/awk.c       | 18 ++++++++++++++----
+ testsuite/awk.tests |  9 +++++++--
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 5962c3f6a..9467f4644 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -442,9 +442,10 @@ static const uint32_t tokeninfo[] ALIGN4 = {
+ #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
+ #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
+ 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
+-	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
+-	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
+-	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
++#define TI_ASSIGN (OC_MOVE|VV|P(74))
++	OC_COMPARE|VV|P(39)|5,   TI_ASSIGN,               OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
++	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
++	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
+ 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
+ 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
+ #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
+@@ -1376,11 +1377,19 @@ static node *parse_expr(uint32_t term_tc)
+ 			continue;
+ 		}
+ 		if (tc & (TS_BINOP | TC_UOPPOST)) {
++			int prio;
+ 			debug_printf_parse("%s: TS_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
+ 			/* for binary and postfix-unary operators, jump back over
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+-			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
++			/* Let assignment get higher priority when used on right
++			 * side in compare. i.e: 2==v=3 */
++			if (t_info == TI_ASSIGN && (vn->a.n->info & OPCLSMASK) == OC_COMPARE) {
++				prio = PRECEDENCE(38);
++			} else {
++				prio = (t_info & PRIMASK);
++			}
++			while ((prio > (vn->a.n->info & PRIMASK2))
+ 			    || (t_info == vn->info && t_info == TI_COLON)
+ 			) {
+ 				vn = vn->a.n;
+@@ -1412,6 +1421,7 @@ static node *parse_expr(uint32_t term_tc)
+ 					if ((vn->info & OPCLSMASK) != OC_VAR
+ 					 && (vn->info & OPCLSMASK) != OC_FNARG
+ 					 && (vn->info & OPCLSMASK) != OC_FIELD
++					 && (vn->info & OPCLSMASK) != OC_COMPARE
+ 					) {
+ 						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
+ 					}
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index a78fdcd98..d2706dea9 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -540,9 +540,14 @@ testing 'awk assign while assign' \
+ │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
+ └────────────────────────────────────────────────────┘^C"
+ 
+-testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
++testing "awk = has higher precedence than == on right side" \
+ 	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
+-	'0\n1\n2\n1\n3\n' \
++	'0\n1\n2\n1\n1\n' \
++	'' ''
++
++testing 'awk ternary precedence' \
++	"awk 'BEGIN { a = 0 ? \"yes\": \"no\"; print a }'" \
++	'no\n' \
+ 	'' ''
+ 
+ exit $FAILCOUNT
+-- 
+2.47.1
+
diff --git a/package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch b/package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
new file mode 100644
index 0000000000..15b2cfdf00
--- /dev/null
+++ b/package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -0,0 +1,43 @@
+From 54e64812090f58cffca08fcf11d2dbc471c964e1 Mon Sep 17 00:00:00 2001
+From: Valery Ushakov <uwe@stderr.spb.ru>
+Date: Wed, 24 Jan 2024 22:24:41 +0300
+Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
+
+Make sure we don't read past the end of the string in next_token()
+when backslash is the last character in an (invalid) regexp.
+a fix and issue reported in bugzilla
+
+https://bugs.busybox.net/show_bug.cgi?id=15874
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+CVE: CVE-2023-42366
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Thomas: https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
+Upstream: http://lists.busybox.net/pipermail/busybox/2024-May/090766.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ editors/awk.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index 9467f4644..947195333 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+ 					s[-1] = bb_process_escape_sequence((const char **)&pp);
+ 					if (*p == '\\')
+ 						*s++ = '\\';
+-					if (pp == p)
++					if (pp == p) {
++						if (*p == '\0')
++							syntax_error(EMSG_UNEXP_EOS);
+ 						*s++ = *p++;
+-					else
++					} else
+ 						p = pp;
+ 				}
+ 			}
+-- 
+2.47.1
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 942875ee0e..d61fed9879 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,16 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# 0012-awk-fix-use-after-free-CVE-2023-42363.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42363
+
+# 0013-awk-fix-precedence-of-relative-to.patch
+# 0014-awk-fix-ternary-operator-and-precedence-of.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42364 CVE-2023-42365
+
+# 0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 

--===============8643350990633255788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8643350990633255788==--
