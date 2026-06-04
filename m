Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6E8CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE368201F;
	Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy9v7v6Gm2jy; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9482D81FF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663132;
	bh=GCNOCyEWuxkvQXALtgVe13dPo0+SmylnH4m0hplvc1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kKLb4IhYiX9TYiWSc7jduH/OtrEkVVvYiB93Sw5Wr5XCd7nx4M+LiFXhUssA9D1nH
	 yRTRr5vMi08nyhNOQn3W4W29yd7egJ5irPRbjHOJAWBnbsRx1BpxfZSIQIZQeCk8fd
	 qTj3/7B2K6VaUujwDoY3CWwF5tZWkIDEi7UNa6iEIIujkSNNqHBjIkHyPzw+5Ji8oZ
	 9hzOBjusChbLvFrq5iF3pZxckTWSoXMKxW2ZsyiHNJXMwXhT9fJnguARvXPeoaLZZH
	 kMIQ8l23gz4sOHKZ74HrTKAdi1rhIRvqdc2DIaLGexZkCpyK2hPx0p8rsjjDW4eCGg
	 TOC4xFe2J1t9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9482D81FF9;
	Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 058A7388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9C6781EA0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTNb2tXB-eZk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37D1181EA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D1181EA3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 627FC87B3A; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 56d6988e886934b21358f2276445f3392d856984
X-Git-Newrev: 1710cacb993510b8fa54d79b509ac1b352cc2cf2
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.627FC87B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 generate vcs externalReferences for source repos
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1710cacb993510b8fa54d79b509ac1b352cc2cf2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit e8c54ffb3d1b92b7e8744824ca0f28fe0d19440d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
