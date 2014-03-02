From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 2 Mar 2014 09:30:42 +0100
Subject: [Buildroot] [PATCH 1/1] ljsyscall: move installation path to
	/usr/share/lua/5x
In-Reply-To: <1391135391-1953-1-git-send-email-danomimanchego123@gmail.com>
References: <1391135391-1953-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAB0FRstvFPGOpk7DbcORL17H0dMd15xp0e2cpo9JeQiyJdWqDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-01-31 3:29 GMT+01:00 Danomi Manchego <danomimanchego123@gmail.com>:
> Move ljsyscall install destination to /usr/share/lua/$(abiver}, to
> match what the luarocks install would naturally do.  This also
> reflects the value of INSTALL_LMOD in the luajit.pc file.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Tested-by: Francois Perrad <francois.perrad@gadz.org>

> ---
>  package/ljsyscall/ljsyscall.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
> index 1f36dc7..cc49890 100644
> --- a/package/ljsyscall/ljsyscall.mk
> +++ b/package/ljsyscall/ljsyscall.mk
> @@ -19,7 +19,7 @@ else ifeq ($(LJSYSCALL_ARCH),)
>  LJSYSCALL_ARCH = $(BR2_ARCH)
>  endif
>
> -LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)
> +LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)
>
>  define LJSYSCALL_INSTALL_TARGET_CMDS
>         $(INSTALL) -d $(LJSYSCALL_TARGET_DIR)/syscall
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
