Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF70C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0587827C5;
	Tue,  4 Jan 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US5uhynw4qOl; Tue,  4 Jan 2022 18:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA128278F;
	Tue,  4 Jan 2022 18:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF621BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1834A60B8F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSj12ZFW7D9U for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E79B6077D
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:34:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9D6D083249; Tue,  4 Jan 2022 18:28:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 19:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a242529917cfa7025eb979a87b84b81b5ff25e1e
X-Git-Newrev: 5390200a722132365c90e07790b9a24a06af7134
X-Patchwork-Hint: ignore
Message-Id: <20220104182811.9D6D083249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: bump version to 5.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=5390200a722132365c90e07790b9a24a06af7134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
  (upstream applied [1]).

For details see [2].

[1] https://github.com/assimp/assimp/commit/a099fe7cd331a839137115db5df1733c4c1c8070
[2] https://github.com/assimp/assimp/releases/tag/v5.1.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...e-use-explicit-namespace-instead-of-using.patch | 57 ----------------------
 package/assimp/assimp.hash                         |  2 +-
 package/assimp/assimp.mk                           |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)

diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
deleted file mode 100644
index c83e9c50a4..0000000000
--- a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 30 Dec 2021 18:01:54 +0100
-Subject: [PATCH] BlenderScene: use explicit namespace instead of using
- namespace
-
-Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
-
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
-           const FileDatabase &db) const {
-                                   ^
- In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
-                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
-       void Convert(T &dest, const FileDatabase &db) const;
-            ^
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
-           const FileDatabase &db) const {
-                                   ^
-  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
-                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
-  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
-       void Convert(T &dest, const FileDatabase &db) const;
-            ^
-
-[backport from upstream commit a099fe7cd331]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
-index c93d913fc..9ad086fe6 100644
---- a/code/AssetLib/Blender/BlenderScene.cpp
-+++ b/code/AssetLib/Blender/BlenderScene.cpp
-@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #include "BlenderDNA.h"
- #include "BlenderSceneGen.h"
- 
--using namespace Assimp;
--using namespace Assimp::Blender;
-+namespace Assimp {
-+namespace Blender {
- 
- //--------------------------------------------------------------------------------
- template <>
-@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
-     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
- }
- 
-+} // namespace Blender
-+} //namespace Assimp
-+
- #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
--- 
-2.34.1
-
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 89b8d168c2..8f6d613bb4 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd32cdc27e1f8b7ac09d914ab92dd81d799c97e9e47315c1f40dcb7c6f7938c6  assimp-5.1.4.tar.gz
+sha256  d62b58ed3b35c20f89570863a5415df97cb1b301b444d39687140fc883717ced  assimp-5.1.5.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index ead5d73bca..b5f84ef56f 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.4
+ASSIMP_VERSION = 5.1.5
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
