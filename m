From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 18:42:18 -0300
Subject: [Buildroot] [PATCH] slang: forcibly disable oniguruma support
Message-ID: <1444858938-27714-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the host has oniguruma installed then slang can detect it and try to
(wrongly) link against it resulting in build failure. Fixes:
http://autobuild.buildroot.net/results/51f/51ff079ebbd363e0445d226ec80bc28e524fd88c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/slang/slang.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 59ef993..1a7576a 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -9,6 +9,7 @@ SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
+SLANG_CONF_OPTS = --with-onig=no
 SLANG_MAKE = $(MAKE1)
 
 # Racy and we don't have/do libtermcap
-- 
2.4.9
