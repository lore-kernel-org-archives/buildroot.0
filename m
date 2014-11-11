From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:40:58 +0100
Subject: [Buildroot] [git commit] rt-tests: switch site from Debian snapshot
	to Linux's git
Message-ID: <20141111144147.5BA0FB40EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=764ce21cd264679f7ec1b4b8f38fdbfbaa1aee16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Origin of "rt-tests" is:
git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git

Switching to this new "origin" simplifies version bumping because there's
no need in updating Debian snapshot folder as it was done already here:
http://git.buildroot.net/buildroot/commit/package/rt-tests?id=da330e508c2d95e898ac52a2aa39426a5f6d0506

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rt-tests/rt-tests.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index cc4f9cf..caa4d35 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/r/rt-tests
-RT_TESTS_VERSION = 0.83
-RT_TESTS_SOURCE = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
+RT_TESTS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
+RT_TESTS_VERSION = v0.83
 RT_TESTS_LICENSE = GPLv2+
 RT_TESTS_LICENSE_FILES = COPYING
 
