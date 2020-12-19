From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 12:02:52 +0100
Subject: [Buildroot] [git commit] package/go: fix a typo in CC and CXX env
 values
Message-ID: <20201219104711.94E0386DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e81152078d0da2b3dafd70cc3ed40dadcc0d062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes a typo in variable names that caused CC and CXX
environment variables to be empty.

Signed-off-by: Michael Baudino <michael@baudi.no>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index d9f4905eb9..cabbdc84b7 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
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
