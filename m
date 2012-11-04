From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 17:25:10 +0100
Subject: [Buildroot] [git commit] legal-info: move $(2)_LICENSE to a proper
	line
Message-ID: <20121104164656.22DE399B67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6917357ed6e7ce537f8277049a55440d5b4bb95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9c87aec..d3a6db6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -268,14 +268,14 @@ ifndef $(2)_LICENSE
  endif
 endif
 
+$(2)_LICENSE			?= unknown
+
 ifndef $(2)_LICENSE_FILES
  ifdef $(3)_LICENSE_FILES
   $(2)_LICENSE_FILES = $($(3)_LICENSE_FILES)
  endif
 endif
 
-$(2)_LICENSE			?= unknown
-
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
