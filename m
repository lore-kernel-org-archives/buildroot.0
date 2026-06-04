Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1465FCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCE660E19;
	Fri,  5 Jun 2026 12:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSU3VSeAEQvl; Fri,  5 Jun 2026 12:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16DE60A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663218;
	bh=3KeTRWYGhiGgdcqIf3s0MIL6U6kYE2335daz76fxMUo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RlXDv0GSxvOlx/or+4VS1LeV0oy7TRj/xJ8LB4cEDU3NR7WqN0PNqL2tMjCp20mtF
	 DMRL+sejvPiJisaydkMt7kOsR50mQB2ysBHu3Icz6r+V23Gla8SC58CPyd5vDAwJBY
	 tD6/EwqWM01ZSsSqV82Pr59gVTM39Hv0cIR3+3ctMekMkk4xddGSRMgyYGPi9DaS+x
	 BYVnEuHOLvexGz6IYUjz+YEmgyRks3eUMEUElt7WTKPQOwfFZnu4UAe72lYuLAXsnk
	 8yQEbPAi3gygW2JMkYyxlbeJPqejJvei2eTtikPawCkPOPgWHsikVPRi5EHI9Jj40n
	 fQWhPsJOqqh6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16DE60A96;
	Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF80388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7029D410A2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nq6GfxNlwI4 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6FE41066
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA6FE41066
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FD8387B3B; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:51 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d32ced8e4ed905ff66dfecc7a052ef8793b1a2d8
X-Git-Newrev: 42728a945b2ee62fb0450e0a198a3128d8d794fc
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.1FD8387B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42728a945b2ee62fb0450e0a198a3128d8d794fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
