Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F47C25B50
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A26060FBB;
	Mon, 23 Jan 2023 20:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A26060FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdjMRh5FENjU; Mon, 23 Jan 2023 20:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD18160FB5;
	Mon, 23 Jan 2023 20:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD18160FB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A41A11BF28C
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD4560F4E
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 20:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD4560F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4HkhJIKWf8N for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 20:32:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C097560AA7
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C097560AA7
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 20:32:43 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id E729C22CD5;
 Mon, 23 Jan 2023 15:32:41 -0500 (EST)
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 21:32:11 +0100
Message-Id: <20230123203214.3745265-1-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1674505962;
 bh=pevhahmggGZHPRaskeSSqbWwpoA1rBRjLguf4wdV3jc=;
 h=From:To:Cc:Subject:Date:From;
 b=W93YjyXni1npshU+vVMkCJe8BmBxENq1e5hSDckFt5l30hvJ2f0HxDkfCyDtBPVuS
 CHkNf903oa9rHjlRCGD4eJaIgSH+l/OgeedoHn69gXxqCy3UuY8pxkOSXxYB1bkb0F
 kg3ap+v5k0jb4h+9rdC/v7zUmf2tAAQ2hrxnsqz2wQGO6MFxTeJVN6Nuxw4H7Z2p+Y
 ygdMxRvufO/pbcrCHl+TFYdiEii3O71kID28TK/5a4elbEgLwrng0ChMTmtvlRLS9H
 0+2pJ/r5dHyNthYAgf2TlrKWuJzbQ15Y9nZFoivXB+afg4VPwZv8ADaVyOqGVn0X0b
 mDu1MFl2B9dPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=W93YjyXn
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
Cc: Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit is cleanup to remove the global done_deps to allow multiple function calls to the DFS search.

Signed-off-by: Steve Hay <me@stevenhay.com>

---
Changes v1 -> v2:
  - Revised author to be full name. (Suggested by Yann)
  - Added a more detailed description of the patch. (Suggested by Yann)
  - Resolution of Yann's comment is that specificying [] (mutable) as default will create a static
    list associated with the function instead of creating a new empty list at each function
    invocation. The existing implementation of specifying None (immutable) and handling default
    case (None) in the function body is idiomatically correct for Python.
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
