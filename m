From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:16:18 +0100
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.11
In-Reply-To: <20180110222816.20579-1-joerg.krause@embedded.rocks>
References: <20180110222816.20579-1-joerg.krause@embedded.rocks>
Message-ID: <20180112221618.123f744f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jan 2018 23:28:16 +0100, J?rg Krause wrote:
> Remove upstream patch 0001-Fix-SHA256-hash-verification.patch.
> 
> Re-enable support for Lua 5.1 and LuaJIT, which was removed in version 2017.09
> because of compatibility issues [1]. Meanwhile, the issues have been resolved
> upstream [2].
> 
> Note, that `CONFIG_HANDLER_IN_LUA` is now supported by Lua 5.1/LuaJIT, too.
> 
> Add a fixup command `SWUPDATE_SET_LUA_VERSION` to set the correct base name for
> the Lua/LuaJIT pkg-config file used by the swupdates config option `LUAPKG`.
> 
> Fix a small type in the help text:
>   'in my mind' -> 'in mind'.
> 
> Regenerated the .config script by doing:
> 
> ```
> make swupdate-menuconfig
> make swupdate-update-config
> ```
> .. and removing the paths for the build options manually.
> 
> [1] http://patchwork.ozlabs.org/patch/795958/
> [2] https://github.com/sbabic/swupdate/commit/7b49b8dc59acc0591fe9823f1739ba7422eb30c7
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-Fix-SHA256-hash-verification.patch        | 119 ---------------------
>  package/swupdate/Config.in                         |   8 +-
>  package/swupdate/swupdate.config                   |  63 +++++++++--
>  package/swupdate/swupdate.hash                     |   2 +-
>  package/swupdate/swupdate.mk                       |  12 ++-
>  5 files changed, 71 insertions(+), 133 deletions(-)
>  delete mode 100644 package/swupdate/0001-Fix-SHA256-hash-verification.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
