Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3768ACD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BF960BC8;
	Fri,  5 Jun 2026 12:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NNQApAgz4z4; Fri,  5 Jun 2026 12:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C05160E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663239;
	bh=K/37UiRaTBCtlCJSkDZOGHQZxFGJNrcg8zRSm4KYgmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UwiC4L2aS3ZWmfk6xeUBpcIpWC0j6Q7U0kngpQ+nVy5xBhBfBqDDq/avFMq+utNb0
	 LU60Wnp2YtoQ6SvbgOKcPB1is0sGbPkVlumHmV/ZB/tKRR2sVq8oFB/h8tC+s55RQ+
	 Wc7yt3Gdu/O/EXppnUG33RyDPL7yzod0ZPl6Bhs4YK0QCMS4+nXdLK9jsXVihFqqT3
	 9tn324KcXYzBu8lmoKOBDAtQ4rGhvZT5B9Iw4mrrUe4f/MDO1zTIz88W0rt/Bwi6B7
	 i8mAigs4NYOCOLyTu7jQkyxo2mgWZvQ76KJJ0iP61rmf0JCRA41NflTFFYNlIhOr7B
	 5kMOjK0+ulgTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C05160E9D;
	Fri,  5 Jun 2026 12:40:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEDC3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE7C8202E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnqjfLt3_wXZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF1C082018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF1C082018
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E911087B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:30 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 063a47f2aa341511738c6f1e0b6eb2a3f4380396
X-Git-Newrev: 6ba3a069699ca6e8bc5692b22984dea0f8f58423
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.E911087B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
 remove indirect dependencies from root component
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ba3a069699ca6e8bc5692b22984dea0f8f58423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit dc4af8bfa979 ("utils/generate-cyclonedx: use direct dependencies")
removes indirect dependencies from any listed component, as required by
CycloneDX. The root component, however, still includes indirect dependencies,
as it just takes the components from the show-info output.

Fix this by collecting all component dependencies, and then filter the root
component dependencies to include direct dependencies only.

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit cc41cc3fcdce839227c0d64e469b6e3fe43884bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py  |  3 +++
 utils/generate-cyclonedx                            | 21 ++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index ddad92598b..54250058a0 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -129,6 +129,9 @@ class TestGenerateCycloneDX(unittest.TestCase):
         bar_deps = next(d for d in result["dependencies"] if d["ref"] == "package-bar")
         self.assertEqual(bar_deps["dependsOn"], ["package-foo"])
 
+        project_deps = next(d for d in result["dependencies"] if d["ref"] == "buildroot")
+        self.assertEqual(project_deps["dependsOn"], ["host-tool", "package-foo"])
+
     def test_virtual(self):
         result = self._run_script(["--virtual"])
 
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 35198a47cf..f4d5afd847 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -385,6 +385,25 @@ def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     return list(deps)
 
 
+def br2_root_deps(show_info_dict, virtual=False) -> list:
+    """Retrieve the list of direct dependencies of the root component.
+
+    This function returns all components that are not a dependency of any
+    other component.
+
+    Args:
+        show_info_dict (dict): The JSON output of the show-info command.
+        virtual (bool): Whether to resolve virtual dependencies to their providers.
+
+    Returns:
+        list: List of direct dependencies of the root component.
+    """
+    indirect = set()
+    for ref in show_info_dict:
+        indirect.update(br2_parse_deps(ref, show_info_dict, virtual))
+    return [ref for ref in show_info_dict if ref not in indirect]
+
+
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
@@ -447,7 +466,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name, br2_root_deps(filtered_show_info_dict, args.virtual)),
             *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
