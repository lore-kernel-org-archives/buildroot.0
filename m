From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 10:58:40 +0200
Subject: [Buildroot] [git commit] package/go: security bump to version 1.16.4
Message-ID: <20210508083725.106AC7FC4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cfc01a008294247255b7dbb0e3da42e5a1d327b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 6d8759f97f..a6676bc160 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25  go1.16.3.src.tar.gz
+sha256  ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503  go1.16.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 138b1cbd34..5b87915824 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.3
+GO_VERSION = 1.16.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
