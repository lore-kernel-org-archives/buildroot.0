From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] icu: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150407.ED5D990385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66382bac307bdf5eefdbf59688f66f493093d03f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/icu/icu.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index bf0663c..d4c220b 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -8,6 +8,7 @@ ICU_VERSION = 4.4.2
 ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
 ICU_DEPENDENCIES = host-icu
+HOST_ICU_DEPENDENCIES =
 ICU_INSTALL_STAGING = YES
 ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
