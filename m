From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:39:56 +0100
Subject: [Buildroot] [git commit] rt-tests: fix build of NPTL dependent tests
Message-ID: <20150115084025.7425880DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6c5ff78144962c23b22a0d98e8248b07b861a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 143fe5b443da4 (rt-tests: allow building subset of tests with non-NPTL
toolchains) disabled build of NPTL dependent tests unconditionally. Fix this.

[Thomas:
 - fix typo in commit title.
 - reverse condition, to use positive logic.]

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Reported-by: "Williams Jr., Ernest L." <ernesto@slac.stanford.edu>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Alexey Brodkin <abrodkin@synpsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/rt-tests.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e0c7748..74d7c6d 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -13,7 +13,9 @@ ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
+RT_TESTS_HAVE_NPTL=yes
+else
 RT_TESTS_HAVE_NPTL=no
 endif
 
