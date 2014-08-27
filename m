From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2014 23:32:19 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
In-Reply-To: <20140827204942.GA21009@free.fr> (Yann E. MORIN's message of
 "Wed, 27 Aug 2014 22:49:42 +0200")
References: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
 <20140827204942.GA21009@free.fr>
Message-ID: <87wq9tsjoc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > On 2014-08-27 22:41 +0200, Bernd Kuhls spake thusly:
 >> BR2_PACKAGE_XBMC_DBUS is provided by package/xbmc/Config.in
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/xbmc/xbmc.mk |    2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
 >> index bdd634e..0bb6724 100644
 >> --- a/package/xbmc/xbmc.mk
 >> +++ b/package/xbmc/xbmc.mk
 >> @@ -64,7 +64,7 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 >> LIBS="-lvcos -lvchostif"
 >> endif
 >> 
 >> -ifeq ($(BR2_PACKAGE_DBUS),y)
 >> +ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 >> XBMC_DEPENDENCIES += dbus
 >> endif

 > No, because the user can still select the package DBUS directly and
 > since XBMC has no option to disable DBUS, we still want DBUS to be built
 > before XBMC.

 > But granted, this is not obvious from the variable name.

Then we should imho get rid of the XBMC_DBUS option if that option
doesn't do anything.

-- 
Bye, Peter Korsgaard
