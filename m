From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Apr 2015 08:04:22 +0300
Subject: [Buildroot] [PATCH v2 1/2] systemd: add option to enable kdbus
 support
In-Reply-To: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150406050422.GD2183@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Sun, Apr 05, 2015 at 05:10:10PM -0500, Ryan Barnett wrote:
> In the future when the kernel offically supports kdbus, this option
> should automatically enable the kernel kdbus config option(s).

So there is no need to fiddle with kernel version dependency for 
--enable-kdbus?

[...]

> +ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
> +SYSTEMD_CONF_OPTS += --enable-kdbus
> +else
> +SYSTEMD_CONF_OPTS += --disable-kdbus
> +endif

Is there any reason not to enable kdbus when the kernel supports that? If not, 
I'd suggest to add --enable-kdbus unconditionally, and remove 
BR2_PACKAGE_SYSTEMD_KDBUS.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
