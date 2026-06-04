Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1EECD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54CF60B27;
	Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VbQ_LiyenFs; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFF360B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663119;
	bh=aXuM5jTG/pIUri862WK9SZ6oh5WQO4TqqR9gWVZULAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gq1F/9WNsHouwUftgdCERk/Q9lB65ZoyV5OwcyrSasl1TrszobOsO0Dcp2C4h33M3
	 xv9Yynv98miptsQVvAVlwtOkGGrAzWKZBKcj2sqaERY3s1g7SdVhOyoa3p6jX4p6qw
	 f0nunAHrE8fmyYcSF8WQktTQ8tYq53Fzwo6onijjCOnXfzAvDfYHlGZQgyfF35hHTn
	 gGfBQSs8hGn4sImmORltu+Sde4oBHvk4sQzhA8E6l0CfZaiAhlRt/Y8r75mBAQoLlC
	 fFUBQed7TARJbVdzR4PsfKmFDdhMmMEi/FPNmu748R3P+d7+Ihux6kUhlnIAl59x41
	 9xd7QPeI8quLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFF360B52;
	Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D51388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 401A481E4D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhYqoF7JKeVC for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C45A81EA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C45A81EA0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4717487B3A; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc790abf4e331b8f9e5bc50b8c7c35b5e1e124c8
X-Git-Newrev: 3ab4686f6f2d617415de4369d74ece65246b5e98
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.4717487B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 generate externalReferences with source-distribution
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ab4686f6f2d617415de4369d74ece65246b5e98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BSI TR-03183-2 5.4.2 [1] lists source code URIs under "Additional data fields
for each component", and as such "MUST additionally be provided, if it exists".

If a http or https source download URI is available from show-info, extract
it and include it as an externalReference of type "source-distribution" in the
CycloneDX output.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e4f0fb126d01663162d0e46f69ce0df942e92b16)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py | 26 ++++++++++++
 utils/generate-cyclonedx                           | 47 ++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 54250058a0..a036d23d7d 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -140,3 +140,29 @@ class TestGenerateCycloneDX(unittest.TestCase):
 
         foo_deps = next(d for d in result["dependencies"] if d["ref"] == "package-foo")
         self.assertEqual(foo_deps["dependsOn"], ["package-bar", "skeleton-baz"])
+
+    def test_external_references(self):
+        info = self._make_show_info()
+        info["package-foo"]["downloads"] = [
+            {
+                "source": "foo-1.2.tar.gz",
+                "uris": [
+                    "https+https://sources.buildroot.net/foo",
+                    "http|https+https://mirror.example.org/foo",
+                ],
+            },
+        ]
+
+        result = self._run_script(show_info=info)
+        foo = self._find_component(result, "package-foo")
+
+        self.assertIn("externalReferences", foo)
+        self.assertEqual(
+            foo["externalReferences"],
+            [
+                {
+                    "type": "source-distribution",
+                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
+                },
+            ],
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index f4d5afd847..a3b7293f9a 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -14,6 +14,8 @@ import gzip
 import json
 import os
 from pathlib import Path
+from typing import Iterator
+import urllib.parse
 import urllib.request
 import subprocess
 import sys
@@ -261,6 +263,50 @@ def cyclonedx_patches(patch_list: list[str]):
     }
 
 
+def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
+    """Parse download URIs into (schemes, url) tuples.
+
+    Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
+    Buildroot schemes with the stripped URL, excluding
+    sources.buildroot.net mirrors.
+
+    Args:
+        uris (list): Array of URI strings from the show-info output.
+    Yields:
+        tuple[list[str], str]: (schemes, url) for each usable URI.
+    """
+    for uri in uris:
+        scheme, _, stripped_uri = uri.partition("+")
+        if stripped_uri:
+            parsed = urllib.parse.urlparse(stripped_uri)
+            if parsed.hostname != "sources.buildroot.net":
+                yield scheme.split("|"), stripped_uri
+
+
+def cyclonedx_external_refs(comp):
+    """Create CycloneDX external references for a component.
+
+    Args:
+        comp (dict): The component information from the show-info output.
+    Returns:
+        dict: External reference information in CycloneDX format, or empty dict
+    """
+    SOURCE_DIST_SCHEMES = {"http", "https"}
+
+    refs = []
+    for download in comp.get("downloads", []):
+        source = download.get("source")
+        for schemes, uri in parse_uris(download.get("uris", [])):
+            if set(schemes) & SOURCE_DIST_SCHEMES and source:
+                refs.append({
+                    "type": "source-distribution",
+                    "url": f"{uri}/{source}",
+                })
+    if refs:
+        return {"externalReferences": refs}
+    return {}
+
+
 def cyclonedx_component(name, comp):
     """Translate a component from the show-info output, to a component entry in CycloneDX format.
 
@@ -284,6 +330,7 @@ def cyclonedx_component(name, comp):
         **({
             "cpe": comp["cpe-id"],
         } if "cpe-id" in comp else {}),
+        **cyclonedx_external_refs(comp),
         **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
         "properties": [{
             "name": "BR_TYPE",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
