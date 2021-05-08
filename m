From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:41:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.15.12
Message-ID: <20210508142103.DC6FE861E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91eb510511ed82663987c0de45ad1f03fe526c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2021-31525: ReadRequest and ReadResponse in net/http can hit an
  unrecoverable panic when reading a very large header (over 7MB on 64-bit
  architectures, or over 4MB on 32-bit ones).  Transport and Client are
  vulnerable and the program can be made to crash by a malicious server.
  Server is not vulnerable by default, but can be if the default max header
  of 1MB is overridden by setting Server.MaxHeaderBytes to a higher value,
  in which case the program can be made to crash by a malicious client.

  https://github.com/golang/go/issues/45710

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 871ac026e1..500ae02cc2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  f25b2441d4c76cf63cde94d59bab237cc33e8a2a139040d904c8630f46d061e5  go1.15.11.src.tar.gz
+sha256  1c6911937df4a277fa74e7b7efc3d08594498c4c4adc0b6c4ae3566137528091  go1.15.12.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index d3462e308a..639fc401b6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.15.11
+GO_VERSION = 1.15.12
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
