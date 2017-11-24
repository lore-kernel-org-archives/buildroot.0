From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:34:02 +0100
Subject: [Buildroot] [git commit branch/next] tinycbor: bump to version 0.4.2
Message-ID: <20171124202644.9FBF9815FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db8b65249144ac8d32269e7c541a02edc0088e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove patch (already in version)
- Add LICENSE hash
- Change github repo name from 01org to intel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-static-compilation-of-json2cbor.patch | 28 ----------------------
 package/tinycbor/tinycbor.hash                     |  3 ++-
 package/tinycbor/tinycbor.mk                       |  4 ++--
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch b/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch
deleted file mode 100644
index 8d265d8..0000000
--- a/package/tinycbor/0001-Fix-static-compilation-of-json2cbor.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ae608ea2735bd331ec7dcf9d89928c38f0e0c981 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 6 Mar 2017 18:59:22 +0100
-Subject: [PATCH] Fix static compilation of json2cbor
-
-json2cbor depends on cjson so tools/json2cbor/json2cbor.o must be
-before -lcjson
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream commit: https://github.com/01org/tinycbor/commit/ae608ea2735bd331ec7dcf9d89928c38f0e0c981]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 97b292c..a8cb57c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -115,7 +115,7 @@ bin/cbordump: $(CBORDUMP_SOURCES:.c=.o) lib/libtinycbor.a
- 
- bin/json2cbor: $(JSON2CBOR_SOURCES:.c=.o) lib/libtinycbor.a
- 	@$(MKDIR) -p bin
--	$(CC) -o $@ $(LDFLAGS) $(LDFLAGS_CJSON) $^ $(LDLIBS) -lm
-+	$(CC) -o $@ $(LDFLAGS) $^ $(LDFLAGS_CJSON) $(LDLIBS) -lm
- 
- tinycbor.pc: tinycbor.pc.in
- 	$(SED) > $@ < $< \
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 6cb0a6e..affc7a6 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	8e42984015d62e8323b7f2a439bde157d707e0d7ae57a6d8d5a2665247af6638	tinycbor-v0.4.1.tar.gz
+sha256	37a06c618ccddd7edc3747277425fcd38fa71eab37c7aaf0b03818a49950da81	tinycbor-v0.4.2.tar.gz
+sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 9c3d2eb..b1848b5 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.4.1
-TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
+TINYCBOR_VERSION = v0.4.2
+TINYCBOR_SITE = $(call github,intel,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
 
