From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:21 +0100
Subject: [Buildroot] [PATCH v5 04/19] reproducible: enable fakedate
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable fakedate for whole build process.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - Build host-fakedate before toolchain (Thomas)

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index b80b9e1..ad7fde5 100644
--- a/Makefile
+++ b/Makefile
@@ -254,6 +254,7 @@ export LC_ALL = C
 export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
+DEPENDENCIES_HOST_PREREQ += host-fakedate
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
1.9.1
