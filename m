From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:56:01 +0200
Subject: [Buildroot] [git commit] package/go: fix GO_ARCH for s390x arch
Message-ID: <20201003065707.97E898E1C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e013029b17618a88ede9da42ea1eee826442f22b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- http://autobuild.buildroot.net/results/82c440825290804c2fd6a92d916c93d2934e0a95
- http://autobuild.buildroot.net/results/e8f8e232fb6bf6167f25c82026f4e2321cca9c26
- http://autobuild.buildroot.net/results/7d4137c439ade81ab7bf141ad6504a69746d6dbc

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index a9f2613fdb..edc44d2378 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -54,6 +54,8 @@ else ifeq ($(BR2_mips64),y)
 GO_GOARCH = mips64
 else ifeq ($(BR2_mips64el),y)
 GO_GOARCH = mips64le
+else ifeq ($(BR2_s390x),y)
+GO_GOARCH = s390x
 endif
 
 # For the convienience of target packages.
