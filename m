From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:48:56 +0100
Subject: [Buildroot] [git commit] gettext: provide a host variant
Message-ID: <20130324130051.EA7E89B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a188b578e490f2a8b5922329b7abfae57122e3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the removal of gettext as a hard dependency, we
need to be able to provide a host variant of gettext for the few
packages that require msgfmt.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/gettext.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index d374050..4757cf8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -56,3 +56,4 @@ GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
 GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TESTS
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
