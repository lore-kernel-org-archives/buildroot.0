From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:02:47 +0200
Subject: [Buildroot] [PATCH 3/3] coreutils: add TODO note about stripping
	the installed binaries
In-Reply-To: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
Message-ID: <385e9e4ea5d66bb6d7189f818f6b28c3df32f277.1249045363.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 TODO |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/TODO b/TODO
index 4de15ab..bf98fea 100644
--- a/TODO
+++ b/TODO
@@ -5,3 +5,13 @@ Buildroot2 TODOs
 - convert all packages that use autoconf to use the infrastructure of
   packages/Makefile.autotools.in
 - fix setting of flags for packages
+
+- coreutils: use make install-strip to install the packages. For now,
+  it fails beause even if we pass STRIP="/path/to/$(ARCH)-strip", the
+  coreutils build system uses the host strip to strip target
+  binaries. The ./configure execution done by Buildroot properly
+  detects the cross-strip, but when running make, build-aux/missing
+  gets run, complains about aclocal-1.10c and atuomake-1.10c not being
+  present, and rerun the configuration... with the wrong environment
+  variables (STRIP= is missing). An autoreconf on this package is
+  probably necessary.
-- 
1.6.0.4
