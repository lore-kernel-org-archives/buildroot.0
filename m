From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:08:55 +0200
Subject: [Buildroot] [git commit] package/waylandpp: bump version to 0.2.8
Message-ID: <20200714130529.8C1CE86D76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f764051f2a0d014540ebbe3677b1efc9b7d3e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream, reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-cmake-Make-target_link_options-optional.patch | 37 ----------------------
 package/waylandpp/waylandpp.hash                   |  6 ++--
 package/waylandpp/waylandpp.mk                     |  2 +-
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch b/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch
deleted file mode 100644
index a7746c1f36..0000000000
--- a/package/waylandpp/0001-cmake-Make-target_link_options-optional.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a39c0c115e19150551c01b04a5e903376633e771 Mon Sep 17 00:00:00 2001
-From: Nils Christopher Brause <nilschrbrause@googlemail.com>
-Date: Fri, 22 Nov 2019 17:39:20 +0100
-Subject: [PATCH] [cmake] Make target_link_options optional, lowering the
- required cmake version to 3.4.
-
-[Retrieved from:
-https://github.com/NilsBrause/waylandpp/commit/a39c0c115e19150551c01b04a5e903376633e771]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 386f8d8..47a412c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -21,7 +21,7 @@
- # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
--cmake_minimum_required(VERSION 3.13)
-+cmake_minimum_required(VERSION 3.4)
- project(waylandpp VERSION 0.2.7 LANGUAGES CXX)
- 
- # packages
-@@ -160,7 +160,9 @@ if(BUILD_LIBRARIES)
-     "include/wayland-client.hpp;include/wayland-util.hpp;${CMAKE_CURRENT_BINARY_DIR}/wayland-client-protocol.hpp;${CMAKE_CURRENT_BINARY_DIR}/wayland-version.hpp"
-     src/wayland-client.cpp src/wayland-util.cpp wayland-client-protocol.cpp wayland-client-protocol.hpp)
-   # Report undefined references only for the base library.
--  target_link_options(wayland-client++ PRIVATE "-Wl,--no-undefined")
-+  if(${CMAKE_VERSION} VERSION_GREATER "3.14.0")
-+    target_link_options(wayland-client++ PRIVATE "-Wl,--no-undefined")
-+  endif()
-   define_library(wayland-client-extra++ "${WAYLAND_CLIENT_CFLAGS}" "${WAYLAND_CLIENT_LIBRARIES}"
-     "${CMAKE_CURRENT_BINARY_DIR}/wayland-client-protocol-extra.hpp"
-     wayland-client-protocol-extra.cpp wayland-client-protocol-extra.hpp wayland-client-protocol.hpp)
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index 39ea3e1708..1b806af9b0 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 fa31b659a6bb93b322e1068831c9a0135a4687d8ef9ceb2e7660c909ce10bfa6  waylandpp-0.2.7.tar.gz
-sha256 8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
+sha256  e7f486165d3568c3558b5c7099133aea4a285b82820eeafad329fc10271c654d  waylandpp-0.2.8.tar.gz
+sha256  8ff91f682a38f8a603b173222a60e8dc71754a79a522a316fb6b76ce138c542c  LICENSE
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 8630b05bb3..45d9ccd528 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 0.2.7
+WAYLANDPP_VERSION = 0.2.8
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
