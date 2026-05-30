Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66A5CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B278D42EA2;
	Sat, 30 May 2026 13:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q4HgxT2IeQe; Sat, 30 May 2026 13:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFEB042ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149275;
	bh=iHwGZ2sVIhDnQJTVJTCFwN9GZE+G5GT8VXiLpjpLe3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FvgAxfEQuTGOTpXT84dcE9UaNMY18AGlcn+Ble/AzaFLD7w1lUUcPLnfZnhrOPYFQ
	 3YDO1LUChDunW14SJtfw6tmB7NvtSLvMTpuNSzBBZFtDk03qNuBrIoggPSVOUsUHZv
	 63yO0RorRzfbI3jl0Xfswmrzfk86zlgCcqGHJciZFQZNuljK3SZQtPLSkRVBLyTA6F
	 +aBiyUsS2dgziHKRUXz8Y0kQO8WiDdswWfU8jewVQnUlsK9+21MkioYKJNwHeSWCZ8
	 lYlZjCRbAh2jybWtHzER/m4pbVPPtOyzTLmcYKqcXVRvkANOcUYakbG7GWNtUHPW2N
	 2p/lHNTGkjVRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFEB042ED0;
	Sat, 30 May 2026 13:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE801F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C450B6F4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFFENoz7UA5M for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8C661BDA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8C661BDA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E03D78750B; Sat, 30 May 2026 13:54:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1791b7942250435e056dbbc726bbb1f4ad9a9612
X-Git-Newrev: e8c54ffb3d1b92b7e8744824ca0f28fe0d19440d
X-Patchwork-Hint: ignore
Message-Id: <20260530135417.E03D78750B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: generate vcs
 externalReferences for source repos
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e8c54ffb3d1b92b7e8744824ca0f28fe0d19440d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Some packages do not have a http/https download URL for a source tarball,
but are acquired over a version control system like git. If so, add
externalReferences of type "vcs" for such URLs.

As most git repositories use a https:// transport that may not indicated the
repository type, add a "comment" due to the lack of a better mechanism in
CycloneDX.

While the hashes are calculated over a tarball created locally, it still may
be useful, so add them for "vcs" externalReferences as well.

Signed-off-by: Martin Willi <martin@strongswan.org>
Acked-By: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../testing/tests/utils/test_generate_cyclonedx.py | 30 +++++++++++++++++++++-
 utils/generate-cyclonedx                           |  8 ++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
index 0a13fdb6ad..e6640fbd0d 100644
--- a/support/testing/tests/utils/test_generate_cyclonedx.py
+++ b/support/testing/tests/utils/test_generate_cyclonedx.py
@@ -147,6 +147,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
             {
                 "source": "foo-1.2.tar.gz",
                 "uris": [
+                    "git+git://git.example.org/foo",
+                    "svn+https://svn.example.org/foo",
                     "https+https://sources.buildroot.net/foo",
                     "http|https+https://mirror.example.org/foo",
                 ],
@@ -160,10 +162,20 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertEqual(
             foo["externalReferences"],
             [
+                {
+                    "type": "vcs",
+                    "url": "git://git.example.org/foo",
+                    "comment": "git repository",
+                },
+                {
+                    "type": "vcs",
+                    "url": "https://svn.example.org/foo",
+                    "comment": "svn repository",
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
-                },
+                }
             ],
         )
 
@@ -183,6 +195,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
                 {
                     "source": "foo-1.2.tar.gz",
                     "uris": [
+                        "git+git://git.example.org/foo",
                         "http|https+https://mirror.example.org/foo",
                     ],
                 },
@@ -194,6 +207,21 @@ class TestGenerateCycloneDX(unittest.TestCase):
         self.assertEqual(
             foo["externalReferences"],
             [
+                {
+                    "type": "vcs",
+                    "url": "git://git.example.org/foo",
+                    "comment": "git repository",
+                    "hashes": [
+                        {
+                            "alg": "SHA-256",
+                            "content": "1111111111111111111111111111111111111111111111111111111111111111",
+                        },
+                        {
+                            "alg": "SHA-1",
+                            "content": "2222222222222222222222222222222222222222",
+                        },
+                    ]
+                },
                 {
                     "type": "source-distribution",
                     "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 382d91ce55..4166abd9ff 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -325,6 +325,7 @@ def cyclonedx_external_refs(comp):
         dict: External reference information in CycloneDX format, or empty dict
     """
     SOURCE_DIST_SCHEMES = {"http", "https"}
+    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
 
     refs = []
     for download in comp.get("downloads", []):
@@ -336,6 +337,13 @@ def cyclonedx_external_refs(comp):
                     "url": f"{uri}/{source}",
                     **cyclonedx_source_hashes(comp, source),
                 })
+            elif set(schemes) & VCS_SCHEMES:
+                refs.append({
+                    "type": "vcs",
+                    "url": uri,
+                    "comment": f"{schemes[0]} repository",
+                    **cyclonedx_source_hashes(comp, source),
+                })
     if refs:
         return {"externalReferences": refs}
     return {}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
