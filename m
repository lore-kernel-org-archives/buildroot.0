From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Sep 2012 11:02:57 +0200
Subject: [Buildroot] [PATCH] wpa-supplicant: add options to enable the
 new DBus interface
In-Reply-To: <505810D1.8070806@essensium.com>
References: <1347525267-4536-1-git-send-email-s.neumann@raumfeld.com>
 <1347525267-4536-2-git-send-email-s.neumann@raumfeld.com>
 <505810D1.8070806@essensium.com>
Message-ID: <1348045377.23228.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

thanks a lot for your review. I'll make the changes you suggested, but I
am not sure about the following:

On Tue, 2012-09-18 at 08:12 +0200, Arnout Vandecappelle wrote:

> > +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
> > +	bool "Enable support for old DBus control interface"
> > +        depends on BR2_PACKAGE_DBUS
> 
>    Use 1 tab instead of 8 spaces (below as well).
> 
>   Also, I think it's better to make this
>      select BR2_PACKAGE_DBUS
>      depends on BR2_TOOLCHAIN_HAS_THREADS
> 
>   Also, since this only installs a .service file, and it used to be
> always enabled before, I would make at least one of the two
> DBus interfaces enabled by default.

If I follow this suggestion and enable one of the DBus interfaces by
default, then selecting wpa-supplicant would select DBus, which it did
not do before. Is that really desired?


Regards,
Sven
