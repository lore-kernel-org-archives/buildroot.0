From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 14:26:39 +0100
Subject: [Buildroot] [git commit] libllcp: ensure graphviz isn't used to
	generate documentation
Message-ID: <20141122133828.4408A7FE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96056dfb1ad428acb4ecfb7c1e5803a13c7feb2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't need the documentation, so it is a waste of time - And more
importantly, the .dot file isn't compatible with all graphviz versions
breaking the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libllcp/libllcp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index 29b5dd0..271daa9 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -13,5 +13,7 @@ LIBLLCP_AUTORECONF = YES
 LIBLLCP_INSTALL_STAGING = YES
 LIBLLCP_LICENSE = GPLv3+
 LIBLLCP_LICENSE_FILES = COPYING
+# ensure graphviz isn't used
+LIBLLCP_CONF_ENV = ac_cv_path_DOT=
 
 $(eval $(autotools-package))
