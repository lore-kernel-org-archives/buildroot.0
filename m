From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:18 -0000
Subject: [Buildroot] [git commit branch/next] icu: enable parallel build
Message-ID: <20150808105604.8E6967F8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8080aacf700c92508d2c9c71d4d4d5a3cab0e75a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Re-enable parallel builds, it doesn't seem to be affected by the issue
worked around in 5a8c7934 any more.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 2590178..e89290a 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -24,7 +24,6 @@ HOST_ICU_CONF_OPTS = \
 	--disable-icuio \
 	--disable-layout \
 	--disable-renaming
-ICU_MAKE = $(MAKE1)
 ICU_SUBDIR = source
 HOST_ICU_SUBDIR = source
 
