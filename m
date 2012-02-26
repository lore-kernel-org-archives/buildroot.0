From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 08:24:23 +0100
Subject: [Buildroot] [git commit] Makefile.cmake.in: fix automatic host deps
	calculation
Message-ID: <20120226074254.C7E5390B6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=261cb20a08e9dddb047381aa059c7f9e351e6109
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need similar handling as in autotools because of the host-cmake addition.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.cmake.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
index 38e459b..4a4ad6e 100644
--- a/package/Makefile.cmake.in
+++ b/package/Makefile.cmake.in
@@ -96,6 +96,10 @@ endef
 endif
 endif
 
+# This must be repeated from GENTARGETS_INNER, otherwise we only get
+# host-cmake in _DEPENDENCIES because of the following line
+$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+
 $(2)_DEPENDENCIES += host-cmake
 
 #
