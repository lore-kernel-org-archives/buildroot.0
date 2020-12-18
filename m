From: Michael Baudino <michael@baudi.no>
Date: Fri, 18 Dec 2020 09:57:42 +0000
Subject: [Buildroot] [PATCH] package/go: fix a typo in CC and CXX env values
Message-ID: <8selkOZpKE5CREY0ZZ4DfQgdVGdikFT69Rfm3Jo05uQO5vUDo-KlPp3AZiao5Qiwu03f-XUFHGg6uuYrhxGJYLk_9KqwZcQbj2O2ue5jaAc=@baudi.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes a typo in variable names that caused CC and CXX
environment variables to be empty.

Signed-off-by: Michael Baudino <michael@baudi.no>
---
 package/go/go.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git package/go/go.mk package/go/go.mk
index d9f4905..cabbdc8 100644
--- package/go/go.mk
+++ package/go/go.mk
@@ -99,8 +99,8 @@ HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
 	GOARCH="" \
 	GOCACHE="$(HOST_GO_HOST_CACHE)" \
-	CC="$(HOST_CCNOCCACHE)" \
-	CXX="$(HOST_CXXNOCCACHE)" \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)" \
 	CGO_CFLAGS="$(HOST_CFLAGS)" \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
--
2.7.4
