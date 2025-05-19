Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C736C54754
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED9B40E2C;
	Mon, 19 May 2025 16:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9ReRta6cO1Q; Mon, 19 May 2025 16:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495D540CD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495D540CD8;
	Mon, 19 May 2025 16:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C884C204
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95828120F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZvgiJK-NAiP for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D0E581186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D0E581186
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87BE48745E; Mon, 19 May 2025 16:42:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:40:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 37a715969f778322861a577ab345d364b2df8d97
X-Git-Newrev: fcf8bdc62aa419991273ff120d408273c8f85f1e
X-Patchwork-Hint: ignore
Message-Id: <20250519164229.87BE48745E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iftop: fix build with
 gcc-15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fcf8bdc62aa419991273ff120d408273c8f85f1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iftop/0003-iftop-function-args.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/iftop/0003-iftop-function-args.patch b/package/iftop/0003-iftop-function-args.patch
new file mode 100644
index 0000000000..7ef38bf0bb
--- /dev/null
+++ b/package/iftop/0003-iftop-function-args.patch
@@ -0,0 +1,18 @@
+Fix gcc-15.x build
+
+Upstream: https://src.fedoraproject.org/rpms/iftop/c/d098f91f0f590c1cab264bf77851d4018c430d9f?branch=rawhide
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -up iftop-1.0pre4/cfgfile.h.fargs iftop-1.0pre4/cfgfile.h
+--- iftop-1.0pre4/cfgfile.h.fargs	2014-01-05 19:47:53.000000000 +0100
++++ iftop-1.0pre4/cfgfile.h	2025-05-15 18:09:05.849754901 +0200
+@@ -13,7 +13,7 @@ typedef struct {
+     int value;
+ } config_enumeration_type;
+ 
+-int read_config();
++int read_config(char *f, int whinge);
+ 
+ char *config_get_string(const char *directive);
+ int config_get_bool(const char *directive);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
