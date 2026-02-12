Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3E6EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC9D641E5D;
	Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYnQNWcZj-1B; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFC141E21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011330;
	bh=Wlq83i/f7C3nic5rb9TnNegp3EO79i45C1XfQj23iTU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U5C7cBG6LPKK/kVPC4NogNulkvkfx/9JruBupOei3NqwfsGoE+YSYsndYyIwFnpMs
	 XPUW0ZQbwJBszdYg9M42omoULNG+M8iK7+DjgOvG6F9KNAG2dQSdBFt7cwE7/x7sEG
	 ma8rrlsE00laz6+88u+AvPGzxeknfzL16AG2A55Pfny7e6yNL1YpdcgP//JZO3zdWy
	 TQDaowNbKZen2UqVszG57kFOsOtWBoLtuqRDh0qwjmJ7SJ77EtsEwnx3xtRZpRcGFI
	 H4LGrDSkdRrfWN0Pc2KXeZNeTUujZDsNxkGhMyCtIdSljlb5XrX9XoSnm4GHzr7RWY
	 blXOIoaNcxGvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFC141E21;
	Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FF2931F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54B2240407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eO_Hg2k5WPSR for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 810B74035F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810B74035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 546B283B01; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:15 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b0ea0d5395c7b59a9625d9c96ee230eb7da08bee
X-Git-Newrev: 8e7e67e1e30415eecaf016759e3abdb7e0abc67f
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.546B283B01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 use direct dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e7e67e1e30415eecaf016759e3abdb7e0abc67f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since the introduction of the `generate-cyclonedx` script in [1] the
dependencies were 'recursive'. This means that the dependencies of a
package dependency were included.

The CycloneDX spec [2] states that only direct dependencies needs to be
included.

This patch drop the recursive dependencies.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] https://cyclonedx.org/docs/1.6/json/#dependencies

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc4af8bfa979beb147cdbd7523b5ade26095a0d5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e864edf181..04ce8fc3a1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -337,10 +337,9 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
-    """Parse dependencies from the show-info output. This function will
-    recursively collect all dependencies, and return a list where each dependency
-    is stated at most once.
+def br2_parse_deps(ref, show_info_dict, virtual=False):
+    """This function will collect all dependencies from the show-info output.
+
     The dependency on virtual package will collect the final dependency without
     including the virtual one.
 
@@ -350,18 +349,14 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
         show_info_dict (dict): The JSON output of the show-info
             command, parsed into a Python dictionary.
 
-    Kwargs:
-        deps (list): A list, to which dependencies will be appended. If set to None,
-            a new empty list will be created. Defaults to None.
-
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
+    deps = []
+
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-                deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+            deps.append(dep)
 
     return deps
 
@@ -429,7 +424,7 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
