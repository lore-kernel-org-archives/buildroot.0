From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 23:01:11 +0100
Subject: [Buildroot] [git commit] reproducible: enable fakedate
Message-ID: <20170207220536.49B4882123@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eba09a48e4e69f084f29523b0f0f34f3305925d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable fakedate for whole build process.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5e4bc92..df3b64e 100644
--- a/Makefile
+++ b/Makefile
@@ -254,6 +254,7 @@ export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
+DEPENDENCIES_HOST_PREREQ += host-fakedate
 endif
 
 # To put more focus on warnings, be less verbose as default
