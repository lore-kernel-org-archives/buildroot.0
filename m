From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:50 +0100
Subject: [Buildroot] [PATCH 6/6] documentation: mention we can't use the
	distro toolchain as external
In-Reply-To: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <12fbed75c46757810e457f66ae3f8fdb391f980a.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 04cbe67..6abffb6 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -776,6 +776,15 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
 
     </ul>
 
+    <p>We also do not support using the distribution toolchain (i.e
+    the gcc/binutils/C library installed by your distribution) as the
+    toolchain to build software for the target. This is because your
+    distribution toolchain is not a "pure" toolchain (i.e only with
+    the C/C++ library), so we cannot import it properly into the
+    Buildroot build environment. So even if you are building a system
+    for a x86 or x86_64 target, you have to generate a
+    cross-compilation toolchain with Buildroot or Crosstool-NG.</p>
+
     <h2 id="add_packages">Adding new packages to Buildroot</h2>
 
     <p>This section covers how new packages (userspace libraries or
-- 
1.7.0.4
