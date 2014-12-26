From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 13:55:50 +0100
Subject: [Buildroot] [git commit] Makefile: clarify comment on .br-external
	handling
Message-ID: <20141226141335.6046C8004B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6e771032336f6af18997b3f9145d75301bb4da0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment language may lead the reader to think that .br-external is removed
whenever BR2_EXTERNAL is not set in the command line. Make it clear that
BR2_EXTERNAL must be explicitly set to an empty value for .br-external to get
removed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ad018c8..5e0b4f2 100644
--- a/Makefile
+++ b/Makefile
@@ -123,8 +123,9 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # On subsequent invocations of make, it is read in. It can still be overridden
 # on the command line, therefore the file is re-created every time make is run.
 #
-# When BR2_EXTERNAL is not set, the .br-external file is removed and we point
-# to support/dummy-external. This makes sure we can unconditionally include the
+# When BR2_EXTERNAL is set to an empty value (e.g. explicitly in command
+# line), the .br-external file is removed and we point to
+# support/dummy-external. This makes sure we can unconditionally include the
 # Config.in and external.mk from the BR2_EXTERNAL directory. In this case,
 # override is necessary so the user can clear BR2_EXTERNAL from the command
 # line, but the dummy path is still used internally.
