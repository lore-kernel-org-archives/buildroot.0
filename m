Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F6960D93;
	Sat,  1 Jan 2022 10:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3UVliAg0FCX; Sat,  1 Jan 2022 10:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABAF60D6A;
	Sat,  1 Jan 2022 10:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA431BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA7A60D6A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JADPp8fVoJ_k for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5F760BCB
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:40:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6806381D8B; Sat,  1 Jan 2022 10:34:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:39:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06735b085fd595ffc233e48cc5a57f4fa555b02c
X-Git-Newrev: d6dfb23a407f5c8c5cf6678554f39a8bd32a26d5
X-Patchwork-Hint: ignore
Message-Id: <20220101103427.6806381D8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: fix namespace related
 compile failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6dfb23a407f5c8c5cf6678554f39a8bd32a26d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/0861c66ec02a55e984577094e28b65c78b95a330

  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
           const FileDatabase &db) const {
                                   ^
 In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
       void Convert(T &dest, const FileDatabase &db) const;
            ^
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
           const FileDatabase &db) const {
                                   ^
  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
       void Convert(T &dest, const FileDatabase &db) const;
            ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: update upstream status]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...e-use-explicit-namespace-instead-of-using.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
new file mode 100644
index 0000000000..c83e9c50a4
--- /dev/null
+++ b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
@@ -0,0 +1,57 @@
+From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 30 Dec 2021 18:01:54 +0100
+Subject: [PATCH] BlenderScene: use explicit namespace instead of using
+ namespace
+
+Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
+
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
+           const FileDatabase &db) const {
+                                   ^
+ In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
+                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
+       void Convert(T &dest, const FileDatabase &db) const;
+            ^
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
+           const FileDatabase &db) const {
+                                   ^
+  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
+                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
+  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
+       void Convert(T &dest, const FileDatabase &db) const;
+            ^
+
+[backport from upstream commit a099fe7cd331]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
+index c93d913fc..9ad086fe6 100644
+--- a/code/AssetLib/Blender/BlenderScene.cpp
++++ b/code/AssetLib/Blender/BlenderScene.cpp
+@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include "BlenderDNA.h"
+ #include "BlenderSceneGen.h"
+ 
+-using namespace Assimp;
+-using namespace Assimp::Blender;
++namespace Assimp {
++namespace Blender {
+ 
+ //--------------------------------------------------------------------------------
+ template <>
+@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
+     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
+ }
+ 
++} // namespace Blender
++} //namespace Assimp
++
+ #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
