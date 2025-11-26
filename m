Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D409D116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535E641430;
	Thu, 27 Nov 2025 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWzZWr3y9YtS; Thu, 27 Nov 2025 20:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C9C4087E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C9C4087E;
	Thu, 27 Nov 2025 20:36:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FA72A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78928843D1
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZSjW67ev41b for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D97843D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D97843D2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60D8F835FB; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:44:40 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c0aae487d004d469b388d2361470d89ee7b9d4fb
X-Git-Newrev: fe97314c2f117f8ccf4d9c96dbacca97aa2557d8
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.60D8F835FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/enscript: Fix
 build with gcc 15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe97314c2f117f8ccf4d9c96dbacca97aa2557d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/7fd/7fdda216e2ec57b9bcc1d2613b6546db35a29749/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8ea6c20cecbb51054aeef110ac3c05daca9fcb08)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/enscript/0002-enscript-c23.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/enscript/0002-enscript-c23.patch b/package/enscript/0002-enscript-c23.patch
new file mode 100644
index 0000000000..707674935d
--- /dev/null
+++ b/package/enscript/0002-enscript-c23.patch
@@ -0,0 +1,19 @@
+Fix build with gcc 15.x
+
+Upstream: https://savannah.gnu.org/bugs/?66845
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/compat/regex.c b/compat/regex.c
+index c6907f3..87f2840 100644
+--- a/compat/regex.c
++++ b/compat/regex.c
+@@ -336,7 +336,7 @@ typedef char boolean;
+ #define false 0
+ #define true 1
+ 
+-static int re_match_2_internal ();
++static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
+ 
+ /* These are the command codes that appear in compiled regular
+    expressions.  Some opcodes are followed by argument bytes.  A
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
