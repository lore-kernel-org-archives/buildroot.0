From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:03:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/.mk files: remove
 --localstatedir=/var from autotools packages
In-Reply-To: <1413585393-8349-2-git-send-email-jkrause@posteo.de>
References: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
 <1413585393-8349-2-git-send-email-jkrause@posteo.de>
Message-ID: <54426514.5000703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 00:36, J?rg Krause wrote:
> Remove --localstatedir=/var from all autotools packages where it is no longer
> needed.
> 
> Also remove --localstatedir=/var/lib/dhcp from package dhcp. localstatedir is
> used by dhcp to set the default directory for the leases files. This can also 
> be done by setting --with-*-lease-file=/var/lib/dhcp/*, which is done in
> dhcp.mk.

 I would have preferred the dhcp thing to be a separate patch, because it is
more than a mechanical change. Still,

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 The DHCP thing in particular should get a runtime test, however, because if it
breaks, it will only be visible at runtime.


 Regards,
 Arnout


> 
> A custom --localstatedir is left in:
> * proftpd.mk
> * mysql.mk
> 
> This is safe to do:
> One of the good thing with autoconf is that if you pass:
>         --localstatedir=/var ... --localstatedir=/var/something
> Then /var/something will be used. So, we can set --localstatedir=/var
> by default in the infrastructure, and still have certain packages doing
> weird things override it. [Thanks to Thomas Petazzoni]
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/avahi/avahi.mk                                   | 2 +-
>  package/bind/bind.mk                                     | 2 +-
>  package/collectd/collectd.mk                             | 2 +-
>  package/connman/connman.mk                               | 2 +-
>  package/cups/cups.mk                                     | 3 +--
>  package/dbus-glib/dbus-glib.mk                           | 2 +-
>  package/dbus/dbus.mk                                     | 1 -
>  package/dhcp/dhcp.mk                                     | 1 -
>  package/directfb/directfb.mk                             | 1 -
>  package/lighttpd/lighttpd.mk                             | 1 -
>  package/ndisc6/ndisc6.mk                                 | 2 +-
>  package/network-manager/network-manager.mk               | 1 -
>  package/nss-mdns/nss-mdns.mk                             | 1 -
>  package/oprofile/oprofile.mk                             | 1 -
>  package/php/php.mk                                       | 1 -
>  package/pulseaudio/pulseaudio.mk                         | 1 -
>  package/samba/samba.mk                                   | 1 -
>  package/sdl_net/sdl_net.mk                               | 2 +-
>  package/sed/sed.mk                                       | 1 -
>  package/sqlcipher/sqlcipher.mk                           | 3 +--
>  package/sqlite/sqlite.mk                                 | 3 ---
>  package/systemd/systemd.mk                               | 1 -
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  23 files changed, 10 insertions(+), 27 deletions(-)
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
