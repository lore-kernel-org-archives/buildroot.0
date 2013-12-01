From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:32:33 +0100
Subject: [Buildroot] [git commit] package: add objcopy and ranlib to
	HOST_CONFIGURE_OPTS
Message-ID: <20131201225016.E7AB59BE94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1f4451aa78b724edb8a75bc9b03b00958ded94f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds the OBJCOPY and RANLIB variables to
HOST_CONFIGURE_OPTS, since grub legacy will need these defined in
order to build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile            |    8 ++++++++
 package/Makefile.in |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 8c2429a..6c28a86 100644
--- a/Makefile
+++ b/Makefile
@@ -189,6 +189,12 @@ endif
 ifndef HOSTNM
 HOSTNM:=nm
 endif
+ifndef HOSTOBJCOPY
+HOSTOBJCOPY:=objcopy
+endif
+ifndef HOSTRANLIB
+HOSTRANLIB:=ranlib
+endif
 HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
 HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
 HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
@@ -196,6 +202,8 @@ HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
 HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY:=$(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB:=$(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 5d52fbd..7bc0606 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -256,6 +256,8 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		GCC="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		CPP="$(HOSTCPP)" \
+		OBJCOPY="$(HOSTOBJCOPY)" \
+		RANLIB="$(HOSTRANLIB)" \
 		CPPFLAGS="$(HOST_CPPFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
 		CXXFLAGS="$(HOST_CXXFLAGS)" \
