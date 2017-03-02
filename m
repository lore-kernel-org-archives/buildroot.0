From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:54:41 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <20170223170047.24417-15-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
Message-ID: <20170302225441.5adee9f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:36 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This package is needed to make luaposix work.
> 
> The upstream name is just "bit32", but the luarocks infra doesn't
> support an upstream name different from the Buildroot name. We therefore
> have to explicitly set all variables and we need custom extract
> commands.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Config.in                |  1 +
>  package/lua-bit32/Config.in      |  9 +++++++++
>  package/lua-bit32/lua-bit32.hash |  2 ++
>  package/lua-bit32/lua-bit32.mk   | 20 ++++++++++++++++++++

You forgot to add yourself to the DEVELOPERS file, so I did this
addition.

> +config BR2_PACKAGE_LUA_BIT32
> +	bool "lua-bit32"
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER

This "depends on" is not needed, since lua-bit32/Config.in is anyway
only included if BR2_PACKAGE_HAS_LUAINTERPRETER=y.

I've fixed up those two issues and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
