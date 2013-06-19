From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jun 2013 23:24:17 +0200
Subject: [Buildroot] [PATCH 08/12] luaexpatutils: New package
In-Reply-To: <1369054604-26139-8-git-send-email-shmuelzon@gmail.com> (Assaf
 Inbal's message of "Mon, 20 May 2013 15:56:40 +0300")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-8-git-send-email-shmuelzon@gmail.com>
Message-ID: <87d2rhpzem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Assaf" == Assaf Inbal <shmuelzon@gmail.com> writes:

 Assaf> lxp.doc is a module that provides useful features for working
 Assaf> with XML formats in LOM format as used by the LuaExpat project
 Assaf> from Kepler.

 Assaf> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Assaf> ---
 Assaf>  package/Config.in                      |  1 +
 Assaf>  package/luaexpatutils/Config.in        |  8 ++++++++
 Assaf>  package/luaexpatutils/luaexpatutils.mk | 21 +++++++++++++++++++++
 Assaf>  3 files changed, 30 insertions(+)
 Assaf>  create mode 100644 package/luaexpatutils/Config.in
 Assaf>  create mode 100644 package/luaexpatutils/luaexpatutils.mk

 Assaf> diff --git a/package/Config.in b/package/Config.in
 Assaf> index c11ff27..3351f21 100644
 Assaf> --- a/package/Config.in
 Assaf> +++ b/package/Config.in
 Assaf> @@ -312,6 +312,7 @@ source "package/luabitop/Config.in"
 Assaf>  source "package/luacjson/Config.in"
 Assaf>  source "package/luacrypto/Config.in"
 Assaf>  source "package/luaexpat/Config.in"
 Assaf> +source "package/luaexpatutils/Config.in"
 Assaf>  source "package/luafilesystem/Config.in"
 Assaf>  source "package/luasocket/Config.in"
 Assaf>  source "package/lua-ev/Config.in"
 Assaf> diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
 Assaf> new file mode 100644
 Assaf> index 0000000..cb2887a
 Assaf> --- /dev/null
 Assaf> +++ b/package/luaexpatutils/Config.in
 Assaf> @@ -0,0 +1,8 @@
 Assaf> +config BR2_PACKAGE_LUAEXPATUTILS
 Assaf> +	bool "luaexpatutils"
 Assaf> +	select BR2_PACKAGE_LUAEXPAT
 Assaf> +	help
 Assaf> +	  lxp.doc is a module that provides useful features for working with
 Assaf> +	  XML formats in LOM format as used by the LuaExpat project from Kepler.
 Assaf> +
 Assaf> +	  https://github.com/stevedonovan/LuaExpatUtils
 Assaf> diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
 Assaf> new file mode 100644
 Assaf> index 0000000..a9e3190
 Assaf> --- /dev/null
 Assaf> +++ b/package/luaexpatutils/luaexpatutils.mk
 Assaf> @@ -0,0 +1,21 @@
 Assaf> +#############################################################
 Assaf> +#
 Assaf> +# luaexpatutils
 Assaf> +#
 Assaf> +#############################################################
 Assaf> +
 Assaf> +LUAEXPATUTILS_VERSION = master
 Assaf> +LUAEXPATUTILS_SITE = git://github.com/stevedonovan/LuaExpatUtils.git
 Assaf> +LUAEXPATUTILS_SITE_METHOD = git

This should use a fixed revision and github's tarball logic instead of
git.

I've changed it to use 88c228365b (current head).

 Assaf> +LUAEXPATUTILS_LICENSE = Public Domain
 Assaf> +LUAEXPATUTILS_DEPENDENCIES = luaexpat
 Assaf> +
 Assaf> +define LUAEXPATUTILS_INSTALL_TARGET_CMDS
 Assaf> +	cp $(@D)/lua/doc.lua $(TARGET_DIR)/usr/share/lua/lxp/

We normally use install -D to get proper permissions and create the
needed destination directories if needed.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
