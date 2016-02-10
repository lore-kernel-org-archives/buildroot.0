From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Feb 2016 00:03:10 +0100
Subject: [Buildroot] [PATCH 2/4] vpnc: simplify patch 0001
In-Reply-To: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1455145392-2355-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001 that adjusts the Makefile to solve cross-compilation issues
does a lot of whitespace changes that are unnecessary. We remove all
those noisy changes to keep only the really interesting ones.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ile-cleanup-and-fix-the-VERSION-definitio.patch | 60 +++++++---------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch b/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
index d091dde..cad3e1a 100644
--- a/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
+++ b/package/vpnc/0001-Misc.-Makefile-cleanup-and-fix-the-VERSION-definitio.patch
@@ -1,4 +1,4 @@
-From fd7e584bd28bd541464f8cb6cc72e76de2347640 Mon Sep 17 00:00:00 2001
+From 40b35a82ea581f5dfb1b0b20c4ba3e9f01f35107 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Mon, 8 Feb 2016 23:02:45 +0100
 Subject: [PATCH] Misc. Makefile cleanup and fix the VERSION definition.
@@ -6,39 +6,24 @@ Subject: [PATCH] Misc. Makefile cleanup and fix the VERSION definition.
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- Makefile | 40 +++++++++++++++++++---------------------
- 1 file changed, 19 insertions(+), 21 deletions(-)
+ Makefile | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 9b96d83..1ca6459 100644
+index 9b96d83..62742d0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -19,21 +19,19 @@
- #
+@@ -20,7 +20,7 @@
  # $Id$
  
--DESTDIR=
+ DESTDIR=
 -PREFIX=/usr/local
--ETCDIR=/etc/vpnc
--BINDIR=$(PREFIX)/bin
--SBINDIR=$(PREFIX)/sbin
--MANDIR=$(PREFIX)/share/man
--DOCDIR=$(PREFIX)/share/doc/vpnc
--
--SRCS = sysdep.c vpnc-debug.c isakmp-pkt.c tunip.c config.c dh.c math_group.c supp.c decrypt-utils.c
--BINS = vpnc cisco-decrypt
--OBJS = $(addsuffix .o,$(basename $(SRCS)))
-+DESTDIR =
-+PREFIX ?= /usr/local
-+ETCDIR  = /etc/vpnc
-+BINDIR  = $(PREFIX)/bin
-+SBINDIR = $(PREFIX)/sbin
-+MANDIR  = $(PREFIX)/share/man
-+DOCDIR  = $(PREFIX)/share/doc/vpnc
-+
-+SRCS    = sysdep.c vpnc-debug.c isakmp-pkt.c tunip.c config.c dh.c math_group.c supp.c decrypt-utils.c
-+BINS    = vpnc cisco-decrypt
-+OBJS    = $(addsuffix .o,$(basename $(SRCS)))
++PREFIX?=/usr/local
+ ETCDIR=/etc/vpnc
+ BINDIR=$(PREFIX)/bin
+ SBINDIR=$(PREFIX)/sbin
+@@ -32,8 +32,6 @@ BINS = vpnc cisco-decrypt
+ OBJS = $(addsuffix .o,$(basename $(SRCS)))
  BINOBJS = $(addsuffix .o,$(BINS))
  BINSRCS = $(addsuffix .c,$(BINS))
 -VERSION := $(shell sh mk-version)
@@ -46,27 +31,20 @@ index 9b96d83..1ca6459 100644
  
  # The license of vpnc (Gpl >= 2) is quite likely incompatible with the
  # openssl license. Openssl is currently used to provide certificate
-@@ -50,13 +48,13 @@ RELEASE_VERSION := $(shell cat VERSION)
+@@ -50,11 +48,11 @@ RELEASE_VERSION := $(shell cat VERSION)
  #OPENSSL_GPL_VIOLATION = -DOPENSSL_GPL_VIOLATION
  #OPENSSLLIBS = -lcrypto
  
 -CC=gcc
--CFLAGS ?= -O3 -g
--CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
--CFLAGS +=  $(shell libgcrypt-config --cflags)
++CC ?= gcc
+ CFLAGS ?= -O3 -g
+ CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
+ CFLAGS +=  $(shell libgcrypt-config --cflags)
 -CPPFLAGS += -DVERSION=\"$(VERSION)\" $(OPENSSL_GPL_VIOLATION)
--LDFLAGS ?= -g
--LDFLAGS += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
-+CC       ?= gcc
-+CFLAGS   ?= -O3 -g
-+CFLAGS   += -W -Wall -Wmissing-declarations -Wwrite-strings
-+CFLAGS   += $(shell libgcrypt-config --cflags)
 +CPPFLAGS += $(OPENSSL_GPL_VIOLATION)
-+LDFLAGS  ?= -g
-+LDFLAGS  += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
+ LDFLAGS ?= -g
+ LDFLAGS += $(shell libgcrypt-config --libs) $(OPENSSLLIBS)
  
- ifeq ($(shell uname -s), SunOS)
- LDFLAGS += -lnsl -lresolv -lsocket
 @@ -81,7 +79,7 @@ cisco-decrypt : cisco-decrypt.o decrypt-utils.o
  	$(CC) -o $@ $^ $(LDFLAGS)
  
-- 
2.6.4
