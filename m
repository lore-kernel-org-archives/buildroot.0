From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:10:27 +0200
Subject: [Buildroot] [git commit] go: security bump to version 1.10.2
Message-ID: <20180511211521.0DB398CA8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81815b85a20d09b8346322ad025c2bb430d17ed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump contains many bug fixes, as well as the following security
issue, patched in Go 1.10.1:

CVE-2018-7187: The "go get" implementation in Go 1.9.4, when the
-insecure command-line option is used, does not validate the import path
(get/vcs.go only checks for "://" anywhere in the string), which allows
remote attackers to execute arbitrary OS commands via a crafted web
site.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 73c1578d0b..9f5b80e9f5 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
 # From https://golang.org/dl/
-sha256	f3de49289405fda5fd1483a8fe6bd2fa5469e005fd567df64485c4fa000c7f24	go1.10.src.tar.gz
+sha256	6264609c6b9cd8ed8e02ca84605d727ce1898d74efa79841660b2e3e985a98bd	go1.10.2.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 6e2612481d..73f14cc78f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.10
+GO_VERSION = 1.10.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
