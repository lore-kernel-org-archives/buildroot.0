From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 16 Mar 2012 22:41:09 +0100
Subject: [Buildroot] [git commit] boost: Add comment when C++ is missing
Message-ID: <20120316214430.61CB690DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f43f4f433e422e08d5d00a4bb6c1d93e70b67b89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move above boost option so sub options gets indented]
Signed-off-by: Stephan Thamm <thammi@chaossource.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 7598d02..578fced 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,3 +1,6 @@
+comment "boost requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
