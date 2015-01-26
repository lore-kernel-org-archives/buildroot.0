From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 Jan 2015 21:14:47 -0300
Subject: [Buildroot] [PATCH 2/2] bison: add host-m4 as dependency
In-Reply-To: <1422231287-5770-1-git-send-email-gustavo@zacarias.com.ar>
References: <1422231287-5770-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1422231287-5770-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pull in host-m4 as dependency since it requires a new-enough m4 to build
properly and some distributions don't update that often. Fixes:
http://autobuild.buildroot.net/results/ee8/ee88f2c2a80dc19699d176ff2acde62fbc8a251f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 76ceb6e..5779673 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -9,5 +9,6 @@ BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
+HOST_BISON_DEPENDENCIES = host-m4
 
 $(eval $(host-autotools-package))
-- 
2.0.5
