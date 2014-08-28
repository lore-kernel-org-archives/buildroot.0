From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Aug 2014 08:54:09 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
In-Reply-To: <XnsA3974DCE8DC95berndkuhlsPkbjNfxxIA@bernd-kuhls.de> (Bernd
 Kuhls's message of "Thu, 28 Aug 2014 07:38:55 +0200")
References: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
 <20140827204942.GA21009@free.fr> <87wq9tsjoc.fsf@dell.be.48ers.dk>
 <20140827213842.GB21009@free.fr>
 <XnsA3974DCE8DC95berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <87fvghrtny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Hi,
 > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
 > news:20140827213842.GB21009 at free.fr:

 >>> Then we should imho get rid of the XBMC_DBUS option if that option
 >>> doesn't do anything.
 >> 
 >> That option does select BR2_PACKAGE_DBUS.

 > should BR2_PACKAGE_DBUS in turn not select BR2_PACKAGE_XBMC_DBUS then?

No. The dbus package shouldn't know about xbmc (and kconfig won't allow
circular dependencies).

 > Otherwise users might think DBUS is disabled for xbmc while it is enabled due 
 > to BR2_PACKAGE_DBUS. Otoh I could try to provide an xbmc/configure option
 > --en/disable-dbus upstream.

Indeed. I think an explicit configure option would make most sense.

-- 
Bye, Peter Korsgaard
