From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 19:28:06 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
Message-ID: <20160320182806.GA20826@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2016-03-08 22:48 +0100, J?r?me Pouiller spake thusly:
> It is handy to use local.mk or external.mk to add specific targets
> for current project. However, until now, it not possible to add help
> message these targets.

Another implementation has been applied:
    https://git.buildroot.org/buildroot/commit/?id=84c825f8e893bfb56847ab4a880c46066a41744f

Consequently, I've marked your patches as rejected in patchwork.

Thanks for starting up the discussion! :-)

(Note: Thomas applied my implementation by accident, but later decided
not to revert it. There are still a few issues, which your proposal also
had, and we're fixing them now.)

Regards,
Yann E. MORIN.

> This patch add EXTRA_HELP variable. This variable is aimed to be assigned
> from any .mk files. Its content is displayed with 'make help'.
> 
> For exemple:
>   EXTRA_HELP += "flash                  - Flash target"
>   EXTRA_HELP += "chroot                 - Chroot into target/"
>   EXTRA_HELP += "qemu                   - Run image with qemu"
>   EXTRA_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
>   EXTRA_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
>   EXTRA_HELP += "Please contact support at company.com in case of problem."
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
> v2:
>   - Rename LOCAL_HELP to EXTRA_HELP
>   - Remove introduction lines (so, 'ifneq ($(LOCAL_HELP),)' is no more needed)
> 
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index f2822a2..1c9f63c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -948,6 +948,7 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>  	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>  endif
> +	@for i in $(EXTRA_HELP); do echo "  $$i"; done
>  	@echo
>  	@echo 'Documentation:'
>  	@echo '  manual                 - build manual in all formats'
> -- 
> 2.7.0
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
