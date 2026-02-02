Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19CCE73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72AF66079F;
	Mon,  2 Feb 2026 08:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5918T3pJfOw; Mon,  2 Feb 2026 08:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93797607A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021295;
	bh=w6C+UgewWy7nF7szEZYgTS/WiHfkXyyUcm3kscxdvTQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MqFUSfXwvg2TBO7ZEIZ2IpuMEg2wytQHE0x1160hfCp7XPS1Zvt5X+DkAoRE8YMCC
	 7vdDPZxUoSOUsRQ09T28OTjC1buc4IGIX3Qg+y/qCNhcZ6xNa7WccSj7pEpmkjmSuV
	 FO6Kz3xA0XdU7dfHfDN7XrzeKPGGKQ2XmWUQQHfOXJU8WvUj+wOMfamoB2gpqWm6aY
	 FaiaIrjGzUr45Hn+3Kx1Q267EoLdC4luDYVn7RlwzcqNYRtuoGhe8rjo3GPQgG+zkM
	 vsT5pqPU/l+biPbFHVNtECfW7f338bcsV+sinBw4NxfbS39qqz2SbztS/jZX21q7Wz
	 HimEF6wNk3ljQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93797607A2;
	Mon,  2 Feb 2026 08:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A938834E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94F4E407DA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsffcNK78piy for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECD240746
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CECD240746
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B94C08625D; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:26:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 189a983c7d8f1d24310bd9e142dbc950f86863b8
X-Git-Newrev: dc4af8bfa979beb147cdbd7523b5ade26095a0d5
X-Patchwork-Hint: ignore
Message-Id: <20260202083451.B94C08625D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: use direct
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc4af8bfa979beb147cdbd7523b5ade26095a0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
