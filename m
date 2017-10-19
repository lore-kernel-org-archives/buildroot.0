From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Oct 2017 20:22:52 -0400
Subject: [Buildroot] [PATCH 07/12] go: bump version to 1.9
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <20171019002257.27646-7-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping Go to 1.9 from 1.7.

Go 1.8 comes with significant performance improvements, particularly
around ARM: "CPU time required by our benchmark programs was reduced by
20-30% on 32-bit ARM systems."

Go 1.9 is required for docker-engine and other Go packages in Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 4 ++--
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1836af2482..445a0b7c20 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256	5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6	go1.8.3.src.tar.gz
+# From https://golang.org/dl/
+sha256	a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993	go1.9.src.tar.gz
diff --git a/package/go/go.mk b/package/go/go.mk
index 0781dff035..93e1189c23 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.8.3
+GO_VERSION = 1.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.13.6
