From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] Makefile: be sure the default rule 'all:'
	is the first one
Message-ID: <20141012072419.43A7CBD450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5309e2e181822cc00ba2a59270a448d27f40aa3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the coming patch, we are going to change the order in which our rules
are defined, because we include the gendoc infra before we define the
'all:' rule, so we need to decalre the 'all:' rule before we include
gendoc.

Declare it very, very early in the Makefile, so it always kick in first.
The actual dependency is still declared much later, all that counts is
that "all:" is first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 3f56648..525dd9c 100644
--- a/Makefile
+++ b/Makefile
@@ -24,6 +24,9 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
+# This is our default rule, so must come first
+all:
+
 # Set and export the version string
 export BR2_VERSION := 2014.11-git
 
