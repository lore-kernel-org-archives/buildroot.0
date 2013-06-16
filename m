From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 22:03:03 +0200
Subject: [Buildroot] [PATCH 06/12] luabitop: New package
In-Reply-To: <1369054604-26139-6-git-send-email-shmuelzon@gmail.com> (Assaf
 Inbal's message of "Mon, 20 May 2013 15:56:38 +0300")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-6-git-send-email-shmuelzon@gmail.com>
Message-ID: <871u81vn60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Assaf" == Assaf Inbal <shmuelzon@gmail.com> writes:

 Assaf> Lua library for binary operations
 Assaf> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Assaf> ---
 Assaf>  package/Config.in            |  1 +
 Assaf>  package/luabitop/Config.in   |  7 +++++++
 Assaf>  package/luabitop/luabitop.mk | 27 +++++++++++++++++++++++++++
 Assaf>  3 files changed, 35 insertions(+)
 Assaf>  create mode 100644 package/luabitop/Config.in
 Assaf>  create mode 100644 package/luabitop/luabitop.mk

 Assaf> diff --git a/package/Config.in b/package/Config.in
 Assaf> index e94cb39..1089533 100644
 Assaf> --- a/package/Config.in
 Assaf> +++ b/package/Config.in
 Assaf> @@ -308,6 +308,7 @@ source "package/cgilua/Config.in"
 Assaf>  source "package/copas/Config.in"
 Assaf>  source "package/coxpcall/Config.in"
 Assaf>  source "package/lbase64/Config.in"
 Assaf> +source "package/luabitop/Config.in"
 Assaf>  source "package/luacjson/Config.in"
 Assaf>  source "package/luaexpat/Config.in"
 Assaf>  source "package/luafilesystem/Config.in"
 Assaf> diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
 Assaf> new file mode 100644
 Assaf> index 0000000..83a85b1
 Assaf> --- /dev/null
 Assaf> +++ b/package/luabitop/Config.in
 Assaf> @@ -0,0 +1,7 @@
 Assaf> +config BR2_PACKAGE_LUABITOP
 Assaf> +	bool "luabitop"
 Assaf> +	help
 Assaf> +	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
 Assaf> +	  operations on numbers.
 Assaf> +
 Assaf> +	  http://bitop.luajit.org
 Assaf> diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
 Assaf> new file mode 100644
 Assaf> index 0000000..aaa01cd
 Assaf> --- /dev/null
 Assaf> +++ b/package/luabitop/luabitop.mk
 Assaf> @@ -0,0 +1,27 @@
 Assaf> +#############################################################
 Assaf> +#
 Assaf> +# luabitop
 Assaf> +#
 Assaf> +#############################################################
 Assaf> +
 Assaf> +LUABITOP_VERSION = 1.0.2
 Assaf> +LUABITOP_SOURCE = LuaBitOp-$(LUABITOP_VERSION).tar.gz
 Assaf> +LUABITOP_SITE = http://bitop.luajit.org/download
 Assaf> +LUABITOP_LICENSE = MIT
 Assaf> +LUABITOP_LICENSE_FILES = README
 Assaf> +LUABITOP_DEPENDENCIES = lua
 Assaf> +
 Assaf> +define LUABITOP_BUILD_CMDS
 Assaf> +	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"

TARGET_CONFIGURE_OPTS should be used instead.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
