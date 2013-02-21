From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:57:34 +0100
Subject: [Buildroot] [PATCH] new package: notification-daemon
In-Reply-To: <1361472269-23454-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361472269-23454-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212257.34743.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> notification-daemon
  ^^^
Useless line.

> notification-daemon is the server implementation of the freedesktop.org
> desktop notification specification.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[--SNIP--]
> diff --git a/package/notification-daemon/notification-daemon.mk b/package/notification-daemon/notification-daemon.mk
> new file mode 100644
> index 0000000..c971fc2
> --- /dev/null
> +++ b/package/notification-daemon/notification-daemon.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# notification-daemon
> +#
> +#############################################################
> +
> +NOTIFICATION_DAEMON_MAJOR_VERSION = 0.5
> +NOTIFICATION_DAEMON_MINOR_VERSION = 0
> +NOTIFICATION_DAEMON_VERSION = $(NOTIFICATION_DAEMON_MAJOR_VERSION).$(NOTIFICATION_DAEMON_MINOR_VERSION)

Why do you separate the major/minor versions since you only ever use the
aggregate "major.minor" (see below)?

> +NOTIFICATION_DAEMON_SOURCE = notification-daemon-$(NOTIFICATION_DAEMON_VERSION).tar.bz2
> +NOTIFICATION_DAEMON_SITE = http://ftp.acc.umu.se/pub/gnome/sources/notification-daemon/$(NOTIFICATION_DAEMON_VERSION)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
