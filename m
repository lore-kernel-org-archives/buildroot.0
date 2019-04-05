From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  5 Apr 2019 11:03:40 +0200
Subject: [Buildroot] [PATCH-2019.02] package/go: security bump to version
 1.11.6
Message-ID: <20190405090340.4678-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

CVE-2019-9741: An issue was discovered in net/http in Go 1.11.5.  CRLF
injection is possible if the attacker controls a url parameter, as
demonstrated by the second argument to http.NewRequest with \r\n followed by
an HTTP header or a Redis command.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 29891399c3..fad5f29a71 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256	bc1ef02bb1668835db1390a2e478dcbccb5dd16911691af9d75184bbe5aa943e  go1.11.5.src.tar.gz
+sha256	a96da1425dcbec094736033a8a416316547f8100ab4b72c31d4824d761d3e133  go1.11.6.src.tar.gz
 sha256	2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 4daa2fe093..b91040a103 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.11.5
+GO_VERSION = 1.11.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.11.0
