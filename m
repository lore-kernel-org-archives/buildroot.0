From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 14:17:54 +0100
Subject: [Buildroot] [git commit] x265: fix typo in cli handling
Message-ID: <20151026131934.E63E181DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23aa0b468819bc34b307ac51a4665901cf0608ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A typo sneaked in during my cleanups of x265, fix it.

Reported-by: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index aa61066..a51d34b 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -25,7 +25,7 @@ endif
 ifeq ($(BR2_PACKAGE_X265_CLI),y)
 X265_CONF_OPTS += -DENABLE_CLI=true
 else
-X265_CONF_OPTS += -DENABLE_CLI=else
+X265_CONF_OPTS += -DENABLE_CLI=false
 endif
 
 $(eval $(cmake-package))
