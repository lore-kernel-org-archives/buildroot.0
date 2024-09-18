Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F4CDD549
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6051C401EB;
	Wed, 18 Sep 2024 16:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hx_mlE8ivQYl; Wed, 18 Sep 2024 16:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE654118F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE654118F;
	Wed, 18 Sep 2024 16:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2686E1BF97A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15F9384519
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcPi_JdIA5vd for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1968B84446
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1968B84446
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0431F81524; Wed, 18 Sep 2024 16:50:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 18:43:19 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0717afbd5ffdb5eda106bb1561d39071b994ee80
X-Git-Newrev: 22208c646bb1255fea3462edb14cdc4c5ab12f29
X-Patchwork-Hint: ignore
Message-Id: <20240918165043.0431F81524@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libcuefile: fix
 build failure due to implicit declaration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22208c646bb1255fea3462edb14cdc4c5ab12f29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes:
- http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0d23b47393e0133b76437a274f724c16a7d7e2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libcuefile/0002-libcuefile-fedora-c99.patch    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
new file mode 100644
index 0000000000..3f76dd315c
--- /dev/null
+++ b/package/libcuefile/0002-libcuefile-fedora-c99.patch
@@ -0,0 +1,27 @@
+From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Thu, 27 Apr 2023 17:24:58 -0400
+Subject: [PATCH] Fix C99 compatibility issue
+
+Related to:
+
+  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
+  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
+
+See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
+Signed-off-by: DJ Delorie <dj@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch
+---
+diff -rup a/src/cue_parse.c b/src/cue_parse.c
+--- a/src/cue_parse.c	2011-06-18 07:28:43.000000000 -0400
++++ b/src/cue_parse.c	2023-04-27 16:10:13.314263314 -0400
+@@ -1513,6 +1513,8 @@ void yyerror (char *s)
+ 	fprintf(stderr, "%d: %s\n", cue_lineno, s);
+ }
+ 
++void cue_delete_buffer(void);
++
+ Cd *cue_parse (FILE *fp)
+ {
+ 	cue_yyin = fp;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
