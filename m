Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F0BC25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 23:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BE841517;
	Sun, 22 Jan 2023 23:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BE841517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wh0XO-6gjNxs; Sun, 22 Jan 2023 23:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C2F4151F;
	Sun, 22 Jan 2023 23:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C2F4151F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA9CE1BF3CA
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 23:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D3081E58
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 23:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D3081E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkU22vgmL4Up for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 23:49:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE7C81E56
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDE7C81E56
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 23:49:37 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id E68A620254;
 Sun, 22 Jan 2023 18:43:18 -0500 (EST)
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 00:43:07 +0100
Message-Id: <20230122234309.2111129-1-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674430999;
 bh=5zURQyZXG3ZZ2Xou/PtTGtcXaYtObMyiL1OaNgqu2/U=;
 h=From:To:Cc:Subject:Date:From;
 b=QIpUib60IztwaW84oUe5OHbPey9+/zW+kBYgt8qzNcTIfIRkLxBq3KK1Xs473LCml
 LahMZb2p9ZtL8LqaETDHozhGop7H6fzc1ZUF6HES41MkAFz2SE2dc7bY6QdkO8f8sB
 IAAMqREiuUAiZtjj1JRql1RWolGkecIh8UDzi1YTaVpZtbMs3ygPh+7OI8K9NEoreY
 xIdzzLN7veb5qGr1ZPAn1OkGrpqOJNLO5JJK/N2elu1/2hMrgXb1+okw01gt8JkyZF
 miL2iOMzuNPG8eSn9E54jmfGCuC3XrWaJ8YKKftEbz2ergCt07TLBEbpbGqzsxkGu1
 3TcWRKe1+3CEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=QIpUib60
Subject: [Buildroot] [PATCH 1/2] support/scripts/graph-depends cleanup
 done_deps global
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
From: Steve Hay via buildroot <buildroot@buildroot.org>
Reply-To: Steve Hay <me@stevenhay.com>
Cc: Steve <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Steve <me@stevenhay.com>

Signed-off-by: Steve Hay <me@stevenhay.com>
---
 support/scripts/graph-depends | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index a66fb28f41..3e3373950f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -197,12 +197,11 @@ def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
     outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
 
-done_deps = []
-
-
 # Print the dependency graph of a package
 def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                   arrow_dir, draw_graph, depth, max_depth, pkg, colors):
+                   arrow_dir, draw_graph, depth, max_depth, pkg, colors, done_deps=None):
+    if done_deps is None:
+        done_deps = []
     if pkg in done_deps:
         return
     done_deps.append(pkg)
@@ -234,7 +233,7 @@ def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exc
                 if draw_graph:
                     outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
                 print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
-                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
+                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors, done_deps)
 
 
 def parse_args():
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
