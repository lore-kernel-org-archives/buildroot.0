Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200BFCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F9A40F9E;
	Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHuhHvW7MCyU; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC3DC40FC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663118;
	bh=ZII04c/G4qApNl1q36lwMwh1KkV/KbdAjIS6YSVsphE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Em/NVM9RoY2K0gmEGVgtGnT8VKRazHaC4OMEIlzFe1PxC5pAZmLqt9NUDSNZBrLvn
	 xWwWrjZSKXZckDiC9Gk7W4lG9WcMoo/DjIfRGeSrpj2QObGW0dp83gdt7ERM7LPYU4
	 yh/XN74nAi46iddGES7mj6dIj4g679p9BKi2tgo7vkTCAgSJT+/ZA/0r4OkIiLURzi
	 rFk7uNPIzTdjODrbgf63L5WuyriJpWdXZEc+IIVjUTFUFR0ZA3dRjgTubkf9f7bX3u
	 he3Sb7KyoiZGUjOmX54gXh+LjasCuwFxfpO6zVYjwmfC2eY0+IwjtdbaaJu6z7GxQv
	 86uviK25oA6nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3DC40FC1;
	Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E7C1388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3364081E9A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzA9zOMWPfVf for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA1181EA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FA1181EA2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A5A887B3B; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6496d1d336436d03c588b79ef683224f058aa791
X-Git-Newrev: 56d6988e886934b21358f2276445f3392d856984
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.5A5A887B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 add hashes from .hash files to externalReferences
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56d6988e886934b21358f2276445f3392d856984
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BSI TR-03183-2 5.2.5 [1] lists the "Hash value of the source code of the
component" under "Optional data fields for each component", and as such
CycloneDX "MAY additionally include the [...] information, if it exists".

As hash values are available in Buildroot, iterate over .hash file paths
from show-info input and read hash values for the source distribution. Add
all found hashes to externalReferences source-distribution entries.

[1] https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TR03183/BSI-TR-03183-2_v2_1_0.pdf?__blob=publicationFile&v=5

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 1791b7942250435e056dbbc726bbb1f4ad9a9612)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py | 44 ++++++++++++++++++++++
 utils/generate-cyclonedx                           | 34 +++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index a036d23d7d..0a13fdb6ad 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -166,3 +166,47 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 },
             ],
         )
+
+    def test_external_references_hashes(self):
+        with tempfile.TemporaryDirectory() as tmpdir:
+            hash_file = Path(tmpdir) / "foo.hash"
+            hash_file.write_text(
+                "# source archive checksums\n"
+                "sha256 1111111111111111111111111111111111111111111111111111111111111111 foo-1.2.tar.gz\n"
+                "sha1 2222222222222222222222222222222222222222 foo-1.2.tar.gz\n"
+                "sha256 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa LICENSE\n"
+            )
+
+            info = self._make_show_info()
+            info["package-foo"]["hashes"] = [str(hash_file)]
+            info["package-foo"]["downloads"] = [
+                {
+                    "source": "foo-1.2.tar.gz",
+                    "uris": [
+                        "http|https+https://mirror.example.org/foo",
+                    ],
+                },
+            ]
+
+            result = self._run_script(show_info=info)
+
+        foo = self._find_component(result, "package-foo")
+        self.assertEqual(
+            foo["externalReferences"],
+            [
+                {
+                    "type": "source-distribution",
+                    "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
+                    "hashes": [
+                        {
+                            "alg": "SHA-256",
+                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
+                        },
+                        {
+                            "alg": "SHA-1",
+                            "content": "2222222222222222222222222222222222222222",
+                        },
+                    ],
+                }
+            ],
+        )
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a3b7293f9a..382d91ce55 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -283,6 +283,39 @@ def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
                 yield scheme.split("|"), stripped_uri
 
 
+def cyclonedx_source_hashes(comp, source):
+    """Create CycloneDX hashes for a source distribution.
+
+    Args:
+        comp (dict): The component information from the show-info output.
+        source (str): The source distribution filename to look for in the hash file.
+    Returns:
+        dict: Hash information in CycloneDX format, or empty dict
+    """
+    MAPPING = {
+        "sha1": "SHA-1",
+        "sha256": "SHA-256",
+        "sha512": "SHA-512",
+        "md5": "MD5",
+    }
+
+    hashes = []
+    for hash_file in comp.get("hashes", []):
+        with Path(hash_file).open() as f:
+            for line in f:
+                line = line.strip()
+                if not line.startswith("#") and line.endswith(f" {source}"):
+                    parts = line.split()
+                    if len(parts) >= 3 and parts[0] in MAPPING:
+                        hashes.append({
+                            "alg": MAPPING[parts[0]],
+                            "content": parts[1],
+                        })
+    if hashes:
+        return {"hashes": hashes}
+    return {}
+
+
 def cyclonedx_external_refs(comp):
     """Create CycloneDX external references for a component.
 
@@ -301,6 +334,7 @@ def cyclonedx_external_refs(comp):
                 refs.append({
                     "type": "source-distribution",
                     "url": f"{uri}/{source}",
+                    **cyclonedx_source_hashes(comp, source),
                 })
     if refs:
         return {"externalReferences": refs}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
