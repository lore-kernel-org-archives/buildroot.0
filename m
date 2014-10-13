From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 12:50:24 +0200
Subject: [Buildroot] [PATCH] initscripts: new package
In-Reply-To: <1413190990-24136-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413190990-24136-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <6226941.eYITS00seb@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxime,

On Monday 13 October 2014 11:03:10 Maxime Hadjinlian wrote:
> The folder init.d is currently installed by default since it's part of
> our skeleton.
> This patch creates a package out of it and make busybox/sysvinit depends
> on it.
> 
> This way, if you chose another init, you don't end up with a useless
> init.d folder.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/busybox/busybox.mk            |  6 ++++
>  package/initscripts/busybox_inittab   | 36 +++++++++++++++++++++++
>  package/initscripts/init.d/S20urandom | 54
> +++++++++++++++++++++++++++++++++++ package/initscripts/init.d/S40network |
> 25 ++++++++++++++++
>  package/initscripts/init.d/rcK        | 27 ++++++++++++++++++
>  package/initscripts/init.d/rcS        | 27 ++++++++++++++++++
>  package/initscripts/initscripts.mk    | 28 ++++++++++++++++++
>  package/initscripts/sysvinit_inittab  | 25 ++++++++++++++++
>  package/sysvinit/inittab              | 25 ----------------
>  package/sysvinit/sysvinit.mk          | 11 +++++--
>  system/skeleton/etc/init.d/S20urandom | 54
> ----------------------------------- system/skeleton/etc/init.d/S40network |
> 25 ----------------
>  system/skeleton/etc/init.d/rcK        | 27 ------------------
>  system/skeleton/etc/init.d/rcS        | 27 ------------------
>  system/skeleton/etc/inittab           | 36 -----------------------
>  15 files changed, 237 insertions(+), 196 deletions(-)
>  create mode 100644 package/initscripts/busybox_inittab
>  create mode 100755 package/initscripts/init.d/S20urandom
>  create mode 100755 package/initscripts/init.d/S40network
>  create mode 100755 package/initscripts/init.d/rcK
>  create mode 100755 package/initscripts/init.d/rcS
>  create mode 100644 package/initscripts/initscripts.mk
>  create mode 100644 package/initscripts/sysvinit_inittab
>  delete mode 100644 package/sysvinit/inittab
>  delete mode 100755 system/skeleton/etc/init.d/S20urandom
>  delete mode 100755 system/skeleton/etc/init.d/S40network
>  delete mode 100755 system/skeleton/etc/init.d/rcK
>  delete mode 100755 system/skeleton/etc/init.d/rcS
>  delete mode 100644 system/skeleton/etc/inittab
Can you sent it using -M option in order to make it more readable?

[...]
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index d588122..d515882 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -11,9 +11,13 @@ SYSVINIT_SITE =
[...]
>  	done
> +<<<<<<< HEAD
>  	# Override BusyBox's inittab with an inittab compatible with
>  	# sysvinit
>  	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
> +=======
> +>>>>>>> initscripts: new package
Something goes wrong here :-)


[...]
-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
