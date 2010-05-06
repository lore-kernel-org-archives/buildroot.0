From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 21:17:01 +0200
Subject: [Buildroot] [git commit master] boa: use BOA_VERSION instead of
	spawning a shell/basename for build dir
Message-ID: <20100506192021.541688A2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6947eabea1cb2bf0b16567b2180e94007e151b2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And as it is a recursive variable, this is done twice during startup.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boa/boa.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 9356d52..a51de96 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -12,7 +12,7 @@ BOA_VERSION=0.94.14rc21
 BOA_SOURCE=boa-$(BOA_VERSION).tar.gz
 BOA_CAT:=$(ZCAT)
 BOA_SITE=http://www.boa.org/
-BOA_DIR=$(BUILD_DIR)/${shell basename $(BOA_SOURCE) .tar.gz}
+BOA_DIR=$(BUILD_DIR)/boa-$(BOA_VERSION)
 BOA_WORKDIR=$(BUILD_DIR)/boa_workdir
 
 $(DL_DIR)/$(BOA_SOURCE):
-- 
1.6.3.3
