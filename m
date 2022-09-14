Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD4CC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C16D40C0D;
	Wed, 14 Sep 2022 22:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C16D40C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gw-cFMIYwKpv; Wed, 14 Sep 2022 22:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9566840528;
	Wed, 14 Sep 2022 22:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9566840528
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 607E91C115D
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BF3640528
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF3640528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCbVp77lbETX for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52211404E5
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52211404E5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 428A283BA0; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:25:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3314089e4d61ce917651009881085059d6921c83
X-Git-Newrev: 6e14a276ca21506a729434146c25461e80546c73
X-Patchwork-Hint: ignore
Message-Id: <20220914222927.428A283BA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/waffle: fix build
 without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e14a276ca21506a729434146c25461e80546c73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Drop C++ dependency as nacl is disabled (and will be dropped by upstream
in next release) to avoid the following build failure raised since bump
to version 1.6.1 in commit 814f36fdcc39bbafa1e2aaf637c7c6b59e7f37dd:

CMake Error at /usr/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/a702495074b0393682c619781c349ce62e123133

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6b872dd68c5b7e934d31ce6d417e02749b31cc97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/waffle/0003-drop-C-dependency.patch | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/waffle/0003-drop-C-dependency.patch b/package/waffle/0003-drop-C-dependency.patch
new file mode 100644
index 0000000000..89c0cd09f2
--- /dev/null
+++ b/package/waffle/0003-drop-C-dependency.patch
@@ -0,0 +1,46 @@
+From a54a5d086c5f7e0751f68ac1a2942d8077922ebc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Aug 2022 16:18:22 +0200
+Subject: [PATCH] drop C++ dependency
+
+C++ dependency has been added for nacl backend which has been added by
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61
+and dropped by
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/a7c7152b054e6d2b9af36ed9db9a0df44731b279
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ CMakeLists.txt            | 2 +-
+ src/waffle/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index acece86..04ea68c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -23,7 +23,7 @@
+ # OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-project(waffle1 C CXX)
++project(waffle1 C)
+ 
+ cmake_minimum_required(VERSION 2.8.12)
+ 
+diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
+index 8014b51..276f276 100644
+--- a/src/waffle/CMakeLists.txt
++++ b/src/waffle/CMakeLists.txt
+@@ -238,7 +238,7 @@ include_directories(
+     ${XCB_INCLUDE_DIRS}
+     )
+ 
+-add_library(${waffle_libname} SHARED ${waffle_sources} ${waffle_cxx_sources})
++add_library(${waffle_libname} SHARED ${waffle_sources})
+ 
+ # Debian's packaging system emits warnings if wflinfo directly links to any
+ # library that it doesn't directly use. Silence the warnings by annotating
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
