Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF77C71149
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9606C40AD7;
	Thu, 12 Jun 2025 20:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAYdkXbh55iM; Thu, 12 Jun 2025 20:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C28640A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C28640A45;
	Thu, 12 Jun 2025 20:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB40183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6315140913
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s44UF1E5iN94 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DFCB4091A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DFCB4091A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B54B83567; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2eb204effcb89f09f6e0413c66a0edca97b1fbe1
X-Git-Newrev: c125be893f5dcc700d0ac35dbfb846c681c5ff24
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.2B54B83567@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/assimp: apply
 security patches for CVE-2025-3015, 3016
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

commit: https://git.buildroot.net/buildroot/commit/?id=c125be893f5dcc700d0ac35dbfb846c681c5ff24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following CVEs:
- CVE-2025-3015: A vulnerability classified as critical has been found in
                 Open Asset Import Library Assimp 5.4.3. This affects the
                 function Assimp::ASEImporter::BuildUniqueRepresentation of
                 the file code/AssetLib/ASE/ASELoader.cpp of the component
                 ASE File Handler. The manipulation of the argument mIndices
                 leads to out-of-bounds read. It is possible to initiate the
                 attack remotely. The exploit has been disclosed to the
                 public and may be used.
    See: https://www.cve.org/CVERecord?id=CVE-2025-3015

- CVE-2025-3016: A vulnerability classified as problematic was found in
                 Open Asset Import Library Assimp 5.4.3. This vulnerability
                 affects the function Assimp::MDLImporter::ParseTextureColorData
                 of the file code/AssetLib/MDL/MDLMaterialLoader.cpp of the
                 component MDL File Handler. The manipulation of the argument
                 mWidth/mHeight leads to resource consumption.
                 The attack can be initiated remotely
    See: https://www.cve.org/CVERecord?id=CVE-2025-3016

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9d92c7e3ff80f8c9a2d05a141b34dfb164e7e81f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0003-ASE-fix-possible-out-of-bound-access.patch | 29 +++++++++++++++
 .../assimp/0004-MDL-limit-max-texture-sizes.patch  | 41 ++++++++++++++++++++++
 package/assimp/assimp.mk                           |  6 ++++
 3 files changed, 76 insertions(+)

diff --git a/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
new file mode 100644
index 0000000000..427b7a4888
--- /dev/null
+++ b/package/assimp/0003-ASE-fix-possible-out-of-bound-access.patch
@@ -0,0 +1,29 @@
+From 65c95bf3207b81fe522811d45780d72ed41d9c1e Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kim.kulling@googlemail.com>
+Date: Wed, 12 Mar 2025 20:17:38 +0100
+Subject: [PATCH] ASE: Fix possible out of bound access.
+
+Upstream: https://github.com/assimp/assimp/pull/6045
+
+CVE: CVE-2025-3015
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ code/AssetLib/ASE/ASELoader.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/code/AssetLib/ASE/ASELoader.cpp b/code/AssetLib/ASE/ASELoader.cpp
+index eb6b37dc9b..c63edcf6bf 100644
+--- a/code/AssetLib/ASE/ASELoader.cpp
++++ b/code/AssetLib/ASE/ASELoader.cpp
+@@ -731,6 +731,10 @@ void ASEImporter::BuildUniqueRepresentation(ASE::Mesh &mesh) {
+     unsigned int iCurrent = 0, fi = 0;
+     for (std::vector<ASE::Face>::iterator i = mesh.mFaces.begin(); i != mesh.mFaces.end(); ++i, ++fi) {
+         for (unsigned int n = 0; n < 3; ++n, ++iCurrent) {
++            const uint32_t curIndex = (*i).mIndices[n];
++            if (curIndex >= mesh.mPositions.size()) {
++                throw DeadlyImportError("ASE: Invalid vertex index in face ", fi, ".");
++            }
+             mPositions[iCurrent] = mesh.mPositions[(*i).mIndices[n]];
+ 
+             // add texture coordinates
diff --git a/package/assimp/0004-MDL-limit-max-texture-sizes.patch b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
new file mode 100644
index 0000000000..ae7e54f35d
--- /dev/null
+++ b/package/assimp/0004-MDL-limit-max-texture-sizes.patch
@@ -0,0 +1,41 @@
+From 5d2a7482312db2e866439a8c05a07ce1e718bed1 Mon Sep 17 00:00:00 2001
+From: Kim Kulling <kimkulling@users.noreply.github.com>
+Date: Wed, 12 Mar 2025 21:29:33 +0100
+Subject: [PATCH] MDL: Limit max texture sizes
+
+- closes https://github.com/assimp/assimp/issues/6022
+
+Upstream: https://github.com/assimp/assimp/pull/6046
+
+CVE: CVE-2025-3016
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ code/AssetLib/MDL/MDLMaterialLoader.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/code/AssetLib/MDL/MDLMaterialLoader.cpp b/code/AssetLib/MDL/MDLMaterialLoader.cpp
+index 2cac8a1e26..2e09992e89 100644
+--- a/code/AssetLib/MDL/MDLMaterialLoader.cpp
++++ b/code/AssetLib/MDL/MDLMaterialLoader.cpp
+@@ -209,6 +209,8 @@ void MDLImporter::CreateTexture_3DGS_MDL4(const unsigned char *szData,
+     return;
+ }
+ 
++static const uint32_t MaxTextureSize = 4096;
++
+ // ------------------------------------------------------------------------------------------------
+ // Load color data of a texture and convert it to our output format
+ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
+@@ -219,6 +221,11 @@ void MDLImporter::ParseTextureColorData(const unsigned char *szData,
+ 
+     // allocate storage for the texture image
+     if (do_read) {
++        // check for max texture sizes
++        if (pcNew->mWidth > MaxTextureSize || pcNew->mHeight > MaxTextureSize) {
++            throw DeadlyImportError("Invalid MDL file. A texture is too big.");
++        }
++      
+         if(pcNew->mWidth != 0 && pcNew->mHeight > UINT_MAX/pcNew->mWidth) {
+             throw DeadlyImportError("Invalid MDL file. A texture is too big.");
+         }
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index a4614a01a2..39ad234546 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -16,6 +16,12 @@ ASSIMP_INSTALL_STAGING = YES
 # 0002-Fix-use-after-free-in-the-CallbackToLogRedirector-59.patch
 ASSIMP_IGNORE_CVES += CVE-2024-48423
 
+# 0003-ASE-fix-possible-out-of-bound-access.patch
+ASSIMP_IGNORE_CVES += CVE-2025-3015
+
+# 0004-MDL-limit-max-texture-sizes.patch
+ASSIMP_IGNORE_CVES += CVE-2025-3016
+
 # relocation truncated to fit: R_68K_GOT16O. We also need to disable
 # optimizations to not run into "Error: value -43420 out of range"
 # assembler issues.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
