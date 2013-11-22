From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 12:12:10 +0100
Subject: [Buildroot] [git commit] ola: disable -Werror
Message-ID: <20131122145920.E7ED59BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=768f261be03c29829b653467bc3c1587b0e751dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the ola build uses -Werror, so let's pass
--disable-fatal-warnings to remove this and avoid build failures
caused by warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/ola.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 835ca4e..bc7de24 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -19,7 +19,8 @@ OLA_CONF_OPT = \
 	--disable-tcmalloc \
 	--disable-unittests \
 	--disable-root-check \
-	--disable-java-libs
+	--disable-java-libs \
+	--disable-fatal-warnings
 
 # sets where to find python libs built for target and required by ola
 OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
