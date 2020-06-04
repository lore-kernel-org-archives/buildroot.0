From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:28:10 +0200
Subject: [Buildroot] [PATCH] Revert "package/prosody: use correct bit32
 package"
In-Reply-To: <20200603215904.98199-1-romain.naour@gmail.com>
References: <20200603215904.98199-1-romain.naour@gmail.com>
Message-ID: <20200604232810.74247dc5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 23:59:04 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This reverts commit fa84c176c2148a60103e850204180f86aa5baa73 that
> replace luabitop by lua_bit32 package when lua 5.1 is used.
> 
> Since this change the prosody test in gitlab is fail due to
> missing lua-bitops [1]:
> 
> Starting prosody:
> **************************
> Prosody was unable to find lua-bitops
> This package can be obtained in the following ways:
> 
>     Source:           http://bitop.luajit.org/
>     Debian/Ubuntu:    sudo apt-get install lua-bitop
>     luarocks:         luarocks install luabitop
> 
> WebSocket support will not be available
> More help can be found on our website, at https://prosody.im/doc/depends
> **************************
> 
> The upstream documentation [2] is misleading (or not uptodate)
> about lua-bit32 dependency.
> 
> Since bitop is builtin since lua5.2, we probably need to select
> luabitop package only when lua 5.1 is used as lua interpreter.
> 
> Tested with run-tests:
> ./support/testing/run-tests tests.package.test_prosody.TestProsodyLua51
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/576271975
> [2] https://prosody.im/doc/depends#bitop
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/prosody/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
