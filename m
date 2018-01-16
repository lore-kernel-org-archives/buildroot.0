From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:10:09 +0100
Subject: [Buildroot] [git commit] boost: fix build with domoticz
Message-ID: <20180116221013.2FACB80447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ed86d5c9137f08fe4f00d4aab3891d8287f46d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix domoticz build with boost 1.66 and g++5

Patch fetch from one of the answer of
 https://github.com/domoticz/domoticz/issues/2034:
 workaround suggested to the boost developers

Fixes:
 - http://autobuild.buildroot.net/results/dec57c19e9aa2e367e23de2232c1d22a2f226a32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/0005-fix-build-with-g-5.patch | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/boost/0005-fix-build-with-g-5.patch b/package/boost/0005-fix-build-with-g-5.patch
new file mode 100644
index 0000000..49149e6
--- /dev/null
+++ b/package/boost/0005-fix-build-with-g-5.patch
@@ -0,0 +1,32 @@
+From da2793fcde5c4e3ff448b4b21348ef8b1482c678 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Jan 2018 14:51:32 +0100
+Subject: [PATCH] fix build with g++5
+
+Patch needed to build domoticz
+
+Patch fetch from one of the answer of
+ https://github.com/domoticz/domoticz/issues/2034:
+ workaround suggested to the boost developers
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ boost/asio/detail/consuming_buffers.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/asio/detail/consuming_buffers.hpp b/boost/asio/detail/consuming_buffers.hpp
+index a429f97..b7a887c 100644
+--- a/boost/asio/detail/consuming_buffers.hpp
++++ b/boost/asio/detail/consuming_buffers.hpp
+@@ -102,7 +102,7 @@ public:
+ 
+     std::advance(next, next_elem_);
+     std::size_t elem_offset = next_elem_offset_;
+-    while (next != end && max_size > 0 && result.count < result.max_buffers)
++    while (next != end && max_size > 0 && (result.count) < result.max_buffers)
+     {
+       Buffer next_buf = Buffer(*next) + elem_offset;
+       result.elems[result.count] = boost::asio::buffer(next_buf, max_size);
+-- 
+2.7.4
+
