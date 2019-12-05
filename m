From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 14:07:43 +0100
Subject: [Buildroot] [PATCH v2 2/9] use host-systemctl preset all to
 enable units
In-Reply-To: <20191111172443.6874-3-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-3-jeremy.rosen@smile.fr>
Message-ID: <20191205130743.GK2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

An additional comment, see below...

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> since v234 upstream recommands using systemctl preset-all to enable units.
[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index d1db60b5ef..dc2ed80e7d 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
[--SNIP--]
> -define SYSTEMD_INSTALL_SERVICE_BOOT_CHECK
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires
> -	ln -sf ../../../../lib/systemd/system/systemd-boot-check-no-failures.service \
> -		$(TARGET_DIR)/etc/systemd/system/boot-complete.target.requires/systemd-boot-check-no-failures.service
> +define SYSTEMD_INSTALL_PRESET
> +	$(INSTALL) -D -m 644 package/systemd/80-buildroot.preset $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset

We have a variable that refers to the directory of the package:
    $(INSTALL) -D -m 644 $(SYSTEMD_PKGDIR)/80-buildroot.preset [...]

Note that this comment is applicable to other patches in your series (at
least the wpasuplicant one, for example).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
