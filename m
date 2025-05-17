Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D7C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4611F710E4;
	Mon, 19 May 2025 11:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwqg2jCmqZnm; Mon, 19 May 2025 11:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C065C710DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C065C710DE;
	Mon, 19 May 2025 11:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7190D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8194C40E11
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oU4XwWlK65jl for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A77041E67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A77041E67
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D5982A2E; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:57:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76a4a6361283b06a41220d26f4a25f644cd88f05
X-Git-Newrev: 236363b12562b3aa2cd0ab30861870c4c7e8345b
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.37D5982A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-mediadriver: fix
 cmake 4 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=236363b12562b3aa2cd0ab30861870c4c7e8345b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...n-Update-cmake_minimum_required-to-3.5-co.patch | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
new file mode 100644
index 0000000000..6d0d972be0
--- /dev/null
+++ b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
@@ -0,0 +1,187 @@
+From c8a2c037e25498e366467860b461b8681cea5356 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 05:06:53 +0000
+Subject: [PATCH] [Media Common] Update cmake_minimum_required to 3.5
+ consisently across CMakeLists
+
+Some of the CMakeLists.txt are already requiring CMake 3.5.
+Update remaining files to 3.5.
+This supports the compilation with cmake-4.0.0
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/intel/media-driver/pull/1919
+---
+ Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt          | 2 +-
+ Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt          | 2 +-
+ Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt  | 2 +-
+ Tools/MediaDriverTools/KrnToHex/CMakeLists.txt           | 2 +-
+ Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt       | 2 +-
+ cmrtlib/CMakeLists.txt                                   | 2 +-
+ cmrtlib/linux/CMakeLists.txt                             | 2 +-
+ media_driver/linux/ult/CMakeLists.txt                    | 2 +-
+ media_driver/linux/ult/libdrm_mock/CMakeLists.txt        | 2 +-
+ media_driver/linux/ult/ult_app/CMakeLists.txt            | 2 +-
+ media_driver/linux/ult/ult_app/googletest/CMakeLists.txt | 2 +-
+ os_release_info.cmake                                    | 2 +-
+ 12 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt b/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
+index 2c72d282d..025b93542 100644
+--- a/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
++++ b/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(IntelGenDmyHexTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt b/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
+index cc586ba76..519ca954d 100644
+--- a/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
++++ b/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(GenKrnBin)
+ 
+diff --git a/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt b/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
+index 713d08600..91eacf15d 100644
+--- a/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(IntelKernelBinToSourceTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt b/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
+index a3cb7341c..e2bfde5e8 100644
+--- a/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(KrnToHexTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt b/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
+index af622be19..40e4eba17 100644
+--- a/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(KrnToHex_IGA)
+ 
+diff --git a/cmrtlib/CMakeLists.txt b/cmrtlib/CMakeLists.txt
+index 9ecb1e4e1..54f907b37 100644
+--- a/cmrtlib/CMakeLists.txt
++++ b/cmrtlib/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+ set(BUILD_ALL $ENV{BUILD_ALL})
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(CM_RT)
+ add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/linux)
+ 
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index b066138d9..df02bab2a 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ include (${CMAKE_CURRENT_LIST_DIR}/cmrt_utils.cmake)
+ 
+ 
+diff --git a/media_driver/linux/ult/CMakeLists.txt b/media_driver/linux/ult/CMakeLists.txt
+index 9fb5b39ee..f06b49011 100644
+--- a/media_driver/linux/ult/CMakeLists.txt
++++ b/media_driver/linux/ult/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if ("${BUILD_TYPE}" STREQUAL "debug")
+     set(CMAKE_BUILD_TYPE "Debug")
+diff --git a/media_driver/linux/ult/libdrm_mock/CMakeLists.txt b/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
+index 438715a91..e5d2c88ed 100644
+--- a/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
++++ b/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libdrm_mock)
+ 
+diff --git a/media_driver/linux/ult/ult_app/CMakeLists.txt b/media_driver/linux/ult/ult_app/CMakeLists.txt
+index 1b24fed7f..64217b9fe 100644
+--- a/media_driver/linux/ult/ult_app/CMakeLists.txt
++++ b/media_driver/linux/ult/ult_app/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(devult)
+ 
+diff --git a/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt b/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
+index 6b1f74335..bba044a97 100644
+--- a/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
++++ b/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(devult)
+ 
+diff --git a/os_release_info.cmake b/os_release_info.cmake
+index b4a84e2c5..a3b879d85 100644
+--- a/os_release_info.cmake
++++ b/os_release_info.cmake
+@@ -29,7 +29,7 @@ set(_os_release_info TRUE)
+ # of the local cmake environment.
+ 
+ # Set cmake policies for at least this level:
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ 
+ 
+ # Function get_os_release_info - Determine and return OS name and version
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
