From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 08 Aug 2009 01:07:56 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with dbus
	1.3.0
In-Reply-To: <20090808004346.443b9e49@surf>
References: <4A7C85F0.7070604@eclis.ch>
	<20090807221717.53039a10@surf>	<4A7C9F65.4060104@eclis.ch>
	<20090808004346.443b9e49@surf>
Message-ID: <4A7CB3CC.8040401@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni a ?crit :
> Le Fri, 07 Aug 2009 23:40:53 +0200,
> Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :
> 
>> Thanks for the trick! It seem that dbus archives contain a new
>> ltmain.sh since the dbus version 1.2.16. I have successfully tested
>> the following patch with dbus version 1.2.12, 1.2.14, 1.2.16 and
>> 1.3.0. On each test I also verified that dbus-glib compile.
> 
> Ok. We don't usually support several versions of a package, except for
> very special cases. And for the moment 1.3.0 is only a development
> version.
 >
> Could you send a patch that just bumps the version to 1.2.16 and
> switches DBUS_LIBTOOL_PATCH to NO ?

See the patch below. I Hope it's the right way.

Jean-Christian de Rivaz


 From 436b95227c456d88dc6a2179940947dbb7635488 Mon Sep 17 00:00:00 2001
From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Sat, 8 Aug 2009 01:01:49 +0200
Subject: [PATCH] Update dbus to version 1.2.16

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
  package/dbus/dbus.mk |    3 ++-
  1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7326b41..dd11677 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,9 +3,10 @@
  # dbus
  #
  #############################################################
-DBUS_VERSION = 1.2.12
+DBUS_VERSION = 1.2.16
  DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
  DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
+DBUS_LIBTOOL_PATCH = NO
  DBUS_INSTALL_STAGING = YES
  DBUS_INSTALL_TARGET = YES
  ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
1.5.6.5
