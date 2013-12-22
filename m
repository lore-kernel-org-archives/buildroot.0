From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:34:51 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 09/10] lua*: refactor with
 luarocks infrastructure
In-Reply-To: <1384520859-3189-9-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-9-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222183451.0059a143@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:38 +0100, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cgilua/cgilua.mk                           |   14 ++------
>  package/copas/copas.mk                             |   14 ++------
>  package/lbase64/lbase64.mk                         |   28 +++------------
>  package/lua-cjson/lua-cjson.mk                     |   32 +++--------------
>  package/luabitop/luabitop.mk                       |   23 +++----------
>  package/luaexpat/luaexpat.mk                       |   36 +++-----------------
>  .../luafilesystem-without_large_file.patch         |    8 ++---
>  package/luafilesystem/luafilesystem.mk             |   26 ++------------
>  package/luasec/luasec.mk                           |   29 ++++------------
>  package/luasql-sqlite3/luasql-sqlite3.mk           |   30 +++-------------
>  package/orbit/orbit-01-fix-installation.patch      |   26 --------------
>  package/orbit/orbit.mk                             |   16 +++------
>  package/rings/rings.mk                             |   23 ++-----------
>  package/wsapi/wsapi.mk                             |   15 ++------
>  package/xavante/xavante.mk                         |   15 ++------
>  15 files changed, 50 insertions(+), 285 deletions(-)
>  delete mode 100644 package/orbit/orbit-01-fix-installation.patch

This generally looks good, but I have one question (related to a
question I've asked earlier on the luarocks infrastructure itself).

>  LBASE64_LICENSE = Public domain
> -LBASE64_LICENSE_FILES = README
> -LBASE64_DEPENDENCIES = luainterpreter
> +LBASE64_LICENSE_FILES = $(LBASE64_SUBDIR)/README

Can we avoid this subdirectory in all packages, to make things easier?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
