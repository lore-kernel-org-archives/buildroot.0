Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC34CCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90AC26F5C3;
	Sat, 30 May 2026 13:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsBhqOAavTWl; Sat, 30 May 2026 13:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 694A26F57C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149273;
	bh=KUGGL/xtOux951sCn/rkU0vbchiwV6JjCGVand+glV8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f1NB7U+HCGA1vT6l2iaY6+1sTeCJRoxlAhlKobABEb+3h2qzqK3pvmR9kDPRjJUgI
	 ecPKTSnBwZVJrPzStZmYYYAqkEmvghH/5+Eb3kwwiPzme4VrGbuwyJwyH9Vawv/E26
	 Ij5U45rqfy3dussct2EirH5eqDdjg31WD3yNP4tDfPeVJRSRHb8aceUpw3Sw5p7VaU
	 hu5fxOlrZSv1/iWeb8HYwh9ueJtMSaN0iicMBGsUi0Vm4qwnsSAH8hZaI2FOKtxu5J
	 lKCvwJ6sEH5IV6xVdneoFDtD4UQJ7/HP6g6XfyxxX01KadZO+89C9iE3VIXWEBDLiS
	 1bxmc89nwoAsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694A26F57C;
	Sat, 30 May 2026 13:54:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AACE4218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C4F98066B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7edXBIMHu823 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3C18805E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C18805E4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B867B8750B; Sat, 30 May 2026 13:54:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:54:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 929e7cb0056854061325ea4c7bf85405723dca3b
X-Git-Newrev: cc41cc3fcdce839227c0d64e469b6e3fe43884bd
X-Patchwork-Hint: ignore
Message-Id: <20260530135417.B867B8750B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: remove indirect
 dependencies from root component
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc41cc3fcdce839227c0d64e469b6e3fe43884bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit dc4af8bfa979 ("utils/generate-cyclonedx: use direct dependencies")
removes indirect dependencies from any listed component, as required by
CycloneDX. The root component, however, still includes indirect dependencies,
as it just takes the components from the show-info output.

Fix this by collecting all component dependencies, and then filter the root
component dependencies to include direct dependencies only.

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
