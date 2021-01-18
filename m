From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jan 2021 22:27:00 +0100
Subject: [Buildroot] [PATCH v1 3/3] docs: add cmake-package _INSTALL_OPTS
 description
In-Reply-To: <20210118212700.2316-1-ps.report@gmx.net>
References: <20210118212700.2316-1-ps.report@gmx.net>
Message-ID: <20210118212700.2316-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - why _INSTALL_OPTS and not _INSTALL_HOST_OPTS (besides historically
    reasons)?
  - mabe the cmake _INSTALL_OPTS is so seldom used, so not worth
    an extra doc entry?
---
 docs/manual/adding-packages-cmake.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 00974d30d8..73f0943024 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -126,6 +126,11 @@ typical packages will therefore only use a few of them.
   in the build step. These are passed after the +make+ command. By
   default, empty.
 
+* +LIBFOO_INSTALL_OPTS+ contains the make options used to
+  install the package to the host directory. By default, the value
+  is +install+, which is correct for most CMake packages. It is still
+  possible to override it.
+
 * +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options used to
   install the package to the staging directory. By default, the value
   is +DESTDIR=$(STAGING_DIR) install/fast+, which is correct for most
-- 
2.29.2
