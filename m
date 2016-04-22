From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Apr 2016 11:04:44 -0300
Subject: [Buildroot] [PATCH] network-manager: bump version to 1.2.0
In-Reply-To: <1461236721-60129-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1461236721-60129-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <571A2F7C.2000707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/16 08:05, Vicente Olivert Riera wrote:

> -NETWORK_MANAGER_VERSION_MAJOR = 1.0
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
> +NETWORK_MANAGER_VERSION_MAJOR = 1.2
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
> -NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
> +NETWORK_MANAGER_SITE = http://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
>   NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \

Hi Vicente.
There are some dependency differences with the new series.
For example dbus-glib is no longer mandatory, it's optional for the 
libnm-glib legacy library.
WiFi support can now be disabled (default=y, probably not that 
interesting as an option, though it gets rids of the wireless-tools 
dependency).
Qt support was remove so --disable-qt can be removed.
There's improved systemd support that requires systemd libraries being 
present at build time as well (journal support).
Missing functionality that could also be accounted for (irrespective of 
the bump since it was present in 1.0.x as well) is connection checking 
via libsoup.
nm-cli and readline are also optional now.

I'm sure there are more to look at ;)

Regards.
