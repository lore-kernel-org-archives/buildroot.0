From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 20:30:41 +1300
Subject: [Buildroot] [git commit] core: do not reset
	DEPENDENCIES_HOST_PREREQ in dependencies.mk
Message-ID: <20170128073110.1089881E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99c397fcd36a880d56d3bef09073035b9c7e7a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Usually, Buildroot does never initialize variables with empty content.
DEPENDENCIES_HOST_PREREQ was an unjustified exception.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4334dac..d4b0409 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -5,8 +5,6 @@
 #
 ################################################################################
 
-DEPENDENCIES_HOST_PREREQ :=
-
 # suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
 # script should use 'which' to find a candidate. The script should return
