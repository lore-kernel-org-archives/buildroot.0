Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BAAC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84FE98423E;
	Fri,  2 May 2025 11:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMhu3Uc0hALV; Fri,  2 May 2025 11:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC1184237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC1184237;
	Fri,  2 May 2025 11:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 124A7229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8873419D0
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuX_ynNnS1im for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6D141DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F6D141DE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A49864AE; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 358908b8e9cef0a2a0af40a9df41b606a6406597
X-Git-Newrev: 2715339ec69ffd43ab26ef377fe2cdce2d3d5b20
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.02A49864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iproute2:
 backport NULL dereference fix
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2945255038427078505=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2945255038427078505==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2715339ec69ffd43ab26ef377fe2cdce2d3d5b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This will be part of 6.15.0 release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: fix check-package error by adding "Upstream:" tag in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6bcefa73b1aeefcca81fd4ca2e33f5bf1d3ce9e3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ULL-Dereference-when-no-entries-specified.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch b/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
new file mode 100644
index 0000000000..9b5e727fe3
--- /dev/null
+++ b/package/iproute2/0001-nstat-NULL-Dereference-when-no-entries-specified.patch
@@ -0,0 +1,36 @@
+From 866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30 Mon Sep 17 00:00:00 2001
+From: ZiAo Li <23110240084@m.fudan.edu.cn>
+Date: Wed, 9 Apr 2025 23:03:30 +0800
+Subject: [PATCH] nstat: NULL Dereference when no entries specified
+
+The NULL Pointer Dereference vulnerability happens in load_ugly_table(), misc/nstat.c, in the latest version of iproute2.
+The vulnerability can be triggered by:
+1. db is set to NULL at struct nstat_ent *db = NULL;
+2. n is set to NULL at n = db;
+3. NULL dereference of variable n happens at sscanf(p+1, "%llu", &n->val) != 1
+
+Signed-off-by: ZiAo Li <23110240084@m.fudan.edu.cn>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=866e1d107b7de68ca1fcd1d4d5ffecf9d96bff30
+---
+ misc/nstat.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/misc/nstat.c b/misc/nstat.c
+index fce3e9c1..b2e19bde 100644
+--- a/misc/nstat.c
++++ b/misc/nstat.c
+@@ -218,6 +218,10 @@ static void load_ugly_table(FILE *fp)
+ 			p = next;
+ 		}
+ 		n = db;
++		if (n == NULL) {
++			fprintf(stderr, "Error: Invalid input – line has ':' but no entries. Add values after ':'.\n");
++			exit(-2);
++		}
+ 		nread = getline(&buf, &buflen, fp);
+ 		if (nread == -1) {
+ 			fprintf(stderr, "%s:%d: error parsing history file\n",
+-- 
+2.49.0
+

--===============2945255038427078505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2945255038427078505==--
