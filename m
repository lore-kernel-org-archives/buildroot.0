From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:34:26 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: delete default rules
Message-ID: <20161105223435.EE34B817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bb7430a20871ad4e3ccbc8c1992d60117214be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We don't use the default implicit rules that are added by make, so
they just slow down the Makefile processing. The default implicit
rules can be removed by defining an empty .SUFFIXES: target.

This speeds up the start of the build on my machine from 5.6s to
4.9s.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 4ea64b3..6cf5f1c 100644
--- a/Makefile
+++ b/Makefile
@@ -24,6 +24,9 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
+# Delete default rules. We don't use them. This saves a bit of time.
+.SUFFIXES:
+
 # we want bash as shell
 SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	 else if [ -x /bin/bash ]; then echo /bin/bash; \
