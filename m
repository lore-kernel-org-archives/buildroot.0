From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 13:46:36 +0200
Subject: [Buildroot] [PATCH] fs/ubi: expose BINARIES_DIR to ubinize.cfg
In-Reply-To: <20200606105015.1603519-1-alexandre.belloni@bootlin.com>
References: <20200606105015.1603519-1-alexandre.belloni@bootlin.com>
Message-ID: <20200606114636.GC13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre, All,

On 2020-06-06 12:50 +0200, Alexandre Belloni spake thusly:
> It is often necessary to refer to other images that are present in
> BINARIES_DIR from a custom ubinize configuration e.g. to include the kernel
> in a UBI volume.
> 
> As for BR2_ROOTFS_UBIFS_PATH, replace BINARIES_DIR when copying the file.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

You forgot to update the help text to also mention this replacement, so
I did add a blurb there, and applied to master (with a rewrpaeed commit
log, too). Thanks.

Regards,
Yann E. MORIN.

> ---
>  fs/ubi/ubi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
> index d848f8b23a65..54bb81ea08a4 100644
> --- a/fs/ubi/ubi.mk
> +++ b/fs/ubi/ubi.mk
> @@ -23,7 +23,7 @@ endif
>  # don't use sed -i as it misbehaves on systems with SELinux enabled when this is
>  # executed through fakeroot (see #9386)
>  define ROOTFS_UBI_CMD
> -	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
> +	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;;s;BINARIES_DIR;$(BINARIES_DIR);' \
>  		$(UBI_UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
>  	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
>  	rm $(BUILD_DIR)/ubinize.cfg
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
