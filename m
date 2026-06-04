Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05682CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF768062F;
	Fri,  5 Jun 2026 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3CrCtFzF5og; Fri,  5 Jun 2026 12:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31A98229B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663253;
	bh=LOYzER7SUhFX7ipmee06lipCH7FXU7PKntqknskjuCY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R/l5oowUbOcZHKWfc2ud4O7m4TZQp3gOcJQungfLjqJ+JnlLMmxeYxzCY5Z+ABN9Q
	 YPz5mkipD1CUsw+jO6bHKdCUTxHlevEN143ld/KOBxxxvklniejGwoY9qB43RLY3gB
	 ZZwN9OjppPb22MUBiM6VVamZZH9vT/b9jGRW5paQNQFJWHxuxqWwveZDMFCi0gAI5m
	 B15GbDSNLHBhyYiQYIGVU05m1ZfL9catK2xlNxnbpi+/BIrOuk30UMaHU/Cuxo+Uex
	 ensu18zteJp5S82PCpjZc0NbOwD4FmkDGvw8WNCk4t4AqbJaGjTKp+Y0krS7XxEx/A
	 6T98Q921Apvhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31A98229B;
	Fri,  5 Jun 2026 12:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F42388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BCDF82031
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vJxeSeZc9ul for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0199281FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0199281FB0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B50C87B39; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:05:59 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 42728a945b2ee62fb0450e0a198a3128d8d794fc
X-Git-Newrev: 81570acfb4f0bca27ace5a8088ab888fa9213853
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.2B50C87B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81570acfb4f0bca27ace5a8088ab888fa9213853
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
