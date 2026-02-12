Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56204EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2267941E52;
	Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unFxbITcm55f; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB3541EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011414;
	bh=hp3KWBtPN+nRajl7w9skgymFiaC1qf3DLRdaSfuRq0I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gmDPWZ8y/PS6nRiTtvu4ztv3nZzIpLOExTat3qU/TXnAKXd7k6tBkOA7J/XIPEJIR
	 CdKAPdMmc1GiHz93IErwE/K9On9i53b2koq++tkm36l9b58+HOJBqjqHQtM0tKbsOH
	 qiIyhy2G8KrVF83fk8ZFpoNTff0c4DBSBGiYa/gRntVPUqFM0L5UCwq4M5WICv+CG6
	 Wqekxp7fREgdBPzs+ZXVWGymVZo9EDMmr7ySjRRJupmNtkHMwWZ5ON3NYO+7Dr6cJU
	 lJnO6Ge4e29RDV4ggtLXE7rsTKy5CE3+Vv62VjWOPISaNz620Gd1YgyR3Iv/+pYDtc
	 eUwOKJSRf9taQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB3541EB8;
	Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01BD2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37AD41E45
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvirOB7hE0i8 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E77841E1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E77841E1D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 737BC86D67; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 411cc61bd5046b58454d0173285a178ce2664907
X-Git-Newrev: a95cba3ece344bb78a67974eab63ec0cec0142bd
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.737BC86D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 fix dependencies w/o virtual
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a95cba3ece344bb78a67974eab63ec0cec0142bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since its introduction in [1], by default the `generate-cyclonedx`
script doesn't include buildroot's virtual packages in its 'components'
list, unless using the `--virtual` argument.

References to virtual packages present in the 'show-info' output are
filtered out in the resulting dependencies.

This patch fix the default CycloneDX dependencies generation
without virtual packages to reference the packages that provide the
virtual package instead of just dropping the virtual package itself.

If we use the package `lbase64` that depends on the virtual package
`luainterpreter` as an example. The 'dependency' entry looks like the
following:

```
{
  "ref": "lbase64",
  "dependsOn": [
    "host-skeleton",
    "skeleton-init-common",
    "skeleton-init-sysv",
    "toolchain-external-bootlin"
  ]
}
```

The `luainterpreter` dependency is missing.

After applying this patch, package that provides the `luainterpreter` is
present:

```
{
  "ref": "lbase64",
  "dependsOn": [
    "host-skeleton",
    "lua",
    "skeleton-custom",
    "skeleton-init-sysv"
  ]
}
```

In the case of a virtual package provided by multiple packages all those
packages will be listed. This happens when generating an SBOM on the
entire Buildroot packages.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 67738a6e1d1574cc84888c32f9fb0c5bad03201e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 04ce8fc3a1..2b6c6d63d3 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -337,7 +337,25 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps(ref, show_info_dict, virtual=False):
+def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
+    """Retrieve the list of packages that provide a virtual package.
+
+    Args:
+        ref (str): The identifier of the virtual package.
+        show_info_dict (dict): The JSON output of the show-info
+            command, parsed into a Python dictionary.
+
+    Returns:
+        list: package list that provides the virtual package.
+    """
+    return [
+        name
+        for name, comp in show_info_dict.items()
+        if "provides" in comp and ref in comp["provides"]
+    ]
+
+
+def br2_parse_deps(ref, show_info_dict, virtual=False) -> list:
     """This function will collect all dependencies from the show-info output.
 
     The dependency on virtual package will collect the final dependency without
@@ -352,13 +370,15 @@ def br2_parse_deps(ref, show_info_dict, virtual=False):
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
-    deps = []
+    deps = set()
 
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-            deps.append(dep)
+        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
+            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
+        else:
+            deps.add(dep)
 
-    return deps
+    return list(deps)
 
 
 def main():
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
