From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jul 2013 00:12:00 +0200
Subject: [Buildroot] [git commit] trivial: use geturischeme helper function
	where possible
Message-ID: <20130721223553.4D0279A832@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=720ca65ce801d8a67f0aca98434b0e514e0c5a6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-download.mk contains some helper functions to obtain subparts of URLs,
like the URI scheme. In pkg-generic.mk, there is still one opportunity to use
that helper function, instead of hardcoding it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 668f011..b8eaa98 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -269,7 +269,7 @@ ifndef $(2)_SITE_METHOD
   $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
  else
 	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+	$(2)_SITE_METHOD = $(call geturischeme,$($(2)_SITE))
  endif
 endif
 
