From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:32 -0300
Subject: [Buildroot] [PATCH 11/13] grep: bump to version 2.7
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 5b945d5..e323b1d 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -3,11 +3,10 @@
 # grep
 #
 #############################################################
-GREP_VERSION:=2.5.3
-GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
-GREP_SITE:=$(BR2_GNU_MIRROR)/grep
-GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
+GREP_VERSION = 2.7
+GREP_SITE = $(BR2_GNU_MIRROR)/grep
+GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 $(eval $(call AUTOTARGETS,package,grep))
-- 
1.7.2.2
