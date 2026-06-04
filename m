Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A18ACD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2306F41225;
	Fri,  5 Jun 2026 12:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oYGAlu0rk8z; Fri,  5 Jun 2026 12:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FD14123F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663207;
	bh=sxiMp50Z4n4mL4xLm141FySdviW6EMIvATberIJCEgE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=emv0hJTHaEmYSaS8Em7Jjo8iBs0pSPsUVziH6K+N/7PU/JxgGjSnhvoiqlPHPLOYu
	 TaVvmQsemh4BUm3DmczOIqchUMmEVewbA0WKJ4Vtjp6gQVch5W52cPDJtpC9J1zyDD
	 Yc5QLXT7pc7kCpyQKECN6pUsrL1IeDCMxKMlWB32kwKc72htAjAC+I+SvpBqpNSuGL
	 9/bmmHFv13uLmrdN8iIPvpdvHECI3pY1yQ8cJ05OEpa9YU8cFQ/8zL2qg+9PEseAgm
	 1cytWroSyRS8l9AGO5/XT3duLJUFNqc4yoT+0EXOWa2CisEsEsprXXibiWq6bEFjpx
	 Q287Sq99R+quw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FD14123F;
	Fri,  5 Jun 2026 12:40:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07630F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADA2241099
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orUtcbKTfbVP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC8CC4100C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8CC4100C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D63FC87B3B; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:24 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cd2659ba042f89d287becec8f837b95b78be684a
X-Git-Newrev: 063a47f2aa341511738c6f1e0b6eb2a3f4380396
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.D63FC87B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing/utils:
 add basic tests for utils/generate-cyclonedx
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/063a47f2aa341511738c6f1e0b6eb2a3f4380396
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Introduce unit-tests for the generate-cyclonedx script, covering basic
script invocation, patch CVE extraction and virtual packages.

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
[Arnout: fix check-package errors]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 929e7cb0056854061325ea4c7bf85405723dca3b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py | 139 +++++++++++++++++++++
 .../0001-cve_upstream.patch                        |  14 +++
 2 files changed, 153 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
new file mode 100644
index 0000000000..ddad92598b
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -0,0 +1,139 @@
+"""Unit tests for utils/generate-cyclonedx."""
+
+import json
+import os
+import subprocess
+import tempfile
+import unittest
+from pathlib import Path
+
+import infra
+
+PATCH = "support/testing/tests/utils/test_generate_cyclonedx/0001-cve_upstream.patch"
+SCHEMA_LICENSES = ["MIT", "Apache-2.0", "GPL-3.0-only"]
+
+
+class TestGenerateCycloneDX(unittest.TestCase):
+    def setUp(self):
+        # Provide a fake SPDX schema so the script never hits the network.
+        self.schema_dir = tempfile.TemporaryDirectory()
+        self.addCleanup(self.schema_dir.cleanup)
+
+        cyclonedx_dir = Path(self.schema_dir.name) / "cyclonedx"
+        cyclonedx_dir.mkdir(parents=True)
+        schema_path = cyclonedx_dir / "spdx-1.6.schema.json"
+        schema_path.write_text(json.dumps({"enum": SCHEMA_LICENSES}))
+
+        self.env = os.environ.copy()
+        self.env["BR2_DL_DIR"] = self.schema_dir.name
+        self.script = infra.basepath("utils/generate-cyclonedx")
+        self.cwd = infra.basepath()
+
+    def _make_show_info(self) -> dict:
+        return {
+            "package-foo": {
+                "name": "foo",
+                "version": "1.2",
+                "type": "target",
+                "virtual": False,
+                "licenses": "MIT",
+                "cpe-id": "cpe:2.3:a:example:foo:1.2:*:*:*:*:*:*:*",
+                "patches": [PATCH],
+                "provides": ["package-virtual"],
+                "dependencies": ["skeleton-baz", "package-bar"],
+                "ignore_cves": ["CVE-2025-0001"],
+                "package_dir": "package/package-foo",
+            },
+            "skeleton-baz": {
+                "name": "skeleton-baz",
+                "version": "0.1",
+                "type": "target",
+                "virtual": False,
+                "licenses": "Apache-2.0",
+                "dependencies": [],
+                "package_dir": "package/skeleton-baz",
+            },
+            "package-bar": {
+                "name": "bar",
+                "version": "0.2",
+                "type": "target",
+                "virtual": False,
+                "licenses": "MIT",
+                "ignore_cves": ["CVE-2025-0002"],
+                "dependencies": ["package-virtual"],
+                "package_dir": "package/package-bar",
+            },
+            "host-tool": {
+                "name": "host-tool",
+                "version": "0.3",
+                "type": "host",
+                "virtual": False,
+                "licenses": "GPL-3.0-only",
+                "dependencies": [],
+                "package_dir": "package/host-tool",
+            },
+            "package-virtual": {
+                "name": "virtual-provider",
+                "virtual": True,
+                "type": "target",
+                "dependencies": ["package-foo"],
+                "package_dir": "package/package-virtual",
+            },
+        }
+
+    def _run_script(self, extra_args=(), show_info=None):
+        data = show_info if show_info is not None else self._make_show_info()
+        completed = subprocess.run(
+            [self.script, *extra_args],
+            cwd=self.cwd,
+            env=self.env,
+            input=json.dumps(data),
+            text=True,
+            capture_output=True,
+            check=True,
+        )
+        return json.loads(completed.stdout)
+
+    def _find_component(self, result: dict, name: str) -> dict:
+        for component in result["components"]:
+            if component["bom-ref"] == name:
+                return component
+        self.fail(f"component {name} missing")
+
+    def test_default(self):
+        result = self._run_script()
+
+        self.assertEqual(len(result["components"]), 4)
+        self.assertIn("vulnerabilities", result)
+        vulnerabilities = {v["id"]: v for v in result["vulnerabilities"]}
+        self.assertEqual(len(vulnerabilities), 2)
+        self.assertEqual(vulnerabilities["CVE-2025-0001"]["analysis"]["state"], "resolved_with_pedigree")
+        self.assertEqual(vulnerabilities["CVE-2025-0002"]["analysis"]["state"], "in_triage")
+
+        foo = self._find_component(result, "package-foo")
+        patch = foo["pedigree"]["patches"][0]
+        self.assertIn("text", patch["diff"])
+        self.assertIn("content", patch["diff"]["text"])
+
+        host = self._find_component(result, "host-tool")
+        self.assertEqual(host["properties"][0]["value"], "host")
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertIn("skeleton-baz", names)
+        self.assertIn("package-bar", names)
+        self.assertNotIn("package-virtual", names)
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
+
+        bar_deps = next(d for d in result["dependencies"] if d["ref"] == "package-bar")
+        self.assertEqual(bar_deps["dependsOn"], ["package-foo"])
+
+    def test_virtual(self):
+        result = self._run_script(["--virtual"])
+
+        names = {c["bom-ref"] for c in result["components"]}
+        self.assertEqual(names, {"package-foo", "skeleton-baz", "host-tool", "package-virtual", "package-bar"})
+
+        foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
+        self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
diff --git a/support/testing/tests/utils/test_generate_cyclonedx/0001-cve_upstream.patch b/support/testing/tests/utils/test_generate_cyclonedx/0001-cve_upstream.patch
new file mode 100644
index 0000000000..75d8830203
--- /dev/null
+++ b/support/testing/tests/utils/test_generate_cyclonedx/0001-cve_upstream.patch
@@ -0,0 +1,14 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+
+CVE: CVE-2025-0001
+Upstream: https://patches.example/foo.patch
+
+Signed-off-by: the contributor
+
+diff --git a/foo.txt b/foo.txt
+index 0000001..0000002 100644
+--- a/foo.txt
++++ b/foo.txt
+@@
+-foo
++bar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
