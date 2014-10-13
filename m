From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Oct 2014 13:21:49 +0300
Subject: [Buildroot] [PATCH] initscripts: new package
In-Reply-To: <1413194625-31516-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413194625-31516-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141013102149.GF3500@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Oct 13, 2014 at 12:03:45PM +0200, Maxime Hadjinlian wrote:
> @@ -34,9 +38,12 @@ define SYSVINIT_INSTALL_TARGET_CMDS
>  	for x in halt init shutdown killall5; do \
>  		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
>  	done
> +<<<<<<< HEAD
>  	# Override BusyBox's inittab with an inittab compatible with
>  	# sysvinit
>  	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
> +=======
> +>>>>>>> initscripts: new package
>  	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
>  	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
>  	ln -sf killall5 $(TARGET_DIR)/sbin/pidof

Something went wrong here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
