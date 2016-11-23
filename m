From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:11 +0100
Subject: [Buildroot] [PATCH v3 11/18] reproducible: enable fakedate
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-12-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable fakedate for whole build process.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 92271d9..c8bfed4 100644
--- a/Makefile
+++ b/Makefile
@@ -254,6 +254,7 @@ export LC_ALL=C
 export GZIP = -n
 SOURCE_DATE_GIT = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(SOURCE_DATE_GIT),$(BR2_VERSION_EPOCH))
+DEPENDENCIES_HOST_PREREQ += host-fakedate
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
1.9.1
