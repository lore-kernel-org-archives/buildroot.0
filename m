From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:14:59 +0200
Subject: [Buildroot] [PATCH] lua-sdl2: refactor with cmake
In-Reply-To: <20170612082144.25846-1-francois.perrad@gadz.org>
References: <20170612082144.25846-1-francois.perrad@gadz.org>
Message-ID: <20171022141459.499df9c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 10:21:44 +0200, Francois Perrad wrote:
> that allows optional dependencies
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-sdl2/0001-avoid-host-includes.patch | 18 +++++++++++++
>  package/lua-sdl2/Config.in                      |  4 ---
>  package/lua-sdl2/lua-sdl2.hash                  |  2 +-
>  package/lua-sdl2/lua-sdl2.mk                    | 36 +++++++++++++++++++++----
>  4 files changed, 50 insertions(+), 10 deletions(-)
>  create mode 100644 package/lua-sdl2/0001-avoid-host-includes.patch

I've applied, but after fixing a few things:

 - The package should depend on luainterpreter, not lua, so that it
   works correctly when LuaJIT is used.

 - The patch should have been Git formatted (upstream uses Git), and
   instead of commenting some code, the patch should just remove it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
