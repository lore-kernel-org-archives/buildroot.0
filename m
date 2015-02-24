From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Feb 2015 19:27:39 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Bail out on errors in fakeroot
	script
In-Reply-To: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150224182739.GA4783@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2015-02-24 16:47 +0100, Stefan S?rensen spake thusly:
> Currently, the generated fakeroot script has no error checking causing
> make to continue building even if some of the fakeroot script commands
> have failed. This can cause e.g. using an invalid device tables to go
> unnoticed.
> 
> So add a "set -e" to the start of the fakeroot script so it will exit
> with a failure code as soon as one of the script commands fails.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 13bf4ad..1d3926f 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -72,6 +72,7 @@ $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
>  	rm -f $$(FAKEROOT_SCRIPT)
>  	rm -f $$(TARGET_DIR_WARNING_FILE)
>  	rm -f $$(USERS_TABLE)
> +	echo "set -e" >> $$(FAKEROOT_SCRIPT)
>  	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  ifneq ($$(ROOTFS_DEVICE_TABLES),)
>  	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
