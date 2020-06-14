From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 22:08:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus: security bump to version
 1.12.18
In-Reply-To: <20200614194401.676838-1-fontaine.fabrice@gmail.com>
References: <20200614194401.676838-1-fontaine.fabrice@gmail.com>
Message-ID: <20200614200852.GM2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-14 21:44 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2020-12049: An issue was discovered in dbus >= 1.3.0 before
>   1.12.18. The DBusServer in libdbus, as used in dbus-daemon, leaks file
>   descriptors when a message exceeds the per-message file descriptor
>   limit. A local attacker with access to the D-Bus system bus or another
>   system service's private AF_UNIX socket could use this to make the
>   system service reach its file descriptor limit, denying service to
>   subsequent D-Bus clients.
> - Also update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dbus/dbus.hash | 6 +++---
>  package/dbus/dbus.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
> index 9529d2e04f..cfa06301f6 100644
> --- a/package/dbus/dbus.hash
> +++ b/package/dbus/dbus.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.16.tar.gz.asc
> +# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.18.tar.gz.asc
>  # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
> -sha256	54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80  dbus-1.12.16.tar.gz
> +sha256  64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306  dbus-1.12.18.tar.gz
>  # Locally calculated
> -sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
> +sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index bb9f17a5e0..5c2a5fb2cc 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DBUS_VERSION = 1.12.16
> +DBUS_VERSION = 1.12.18
>  DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
>  DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
>  DBUS_LICENSE_FILES = COPYING
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
