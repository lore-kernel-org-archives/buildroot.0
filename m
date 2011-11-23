From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Nov 2011 13:57:59 +0200
Subject: [Buildroot] [PATCH 1/3] Add the systemd package
In-Reply-To: <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20111123115759.GD4309@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Wed, Nov 23, 2011 at 12:30:09PM +0100, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  fs/skeleton/etc/mtab       |    2 +-
>  linux/linux.mk             |    2 +
>  package/Config.in          |    1 +
>  package/dbus/dbus.mk       |    4 +++
>  package/systemd/Config.in  |   16 +++++++++++++++
>  package/systemd/systemd.mk |   45 ++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 69 insertions(+), 1 deletions(-)
>  create mode 100644 package/systemd/Config.in
>  create mode 100644 package/systemd/systemd.mk
> 
> diff --git a/fs/skeleton/etc/mtab b/fs/skeleton/etc/mtab
> index e1c2045..4c0a094 120000
> --- a/fs/skeleton/etc/mtab
> +++ b/fs/skeleton/etc/mtab
> @@ -1 +1 @@
> -../proc/mounts
> \ No newline at end of file
> +/proc/mounts
> \ No newline at end of file

Why is this change needed?

[snip]

> +define SYSTEMD_INSTALL_INIT_HOOK
> +	ln -fs /bin/systemd $(TARGET_DIR)/sbin/init
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/halt
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/poweroff
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/reboot
> +endef

You should probably add busybox to your dependencies to make sure you override 
the busybox provided applets.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
