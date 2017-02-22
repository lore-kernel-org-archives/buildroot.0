From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 11:08:13 +0100
Subject: [Buildroot] [PATCH 1/1] lzlib: add LuaJIT support
In-Reply-To: <1487753715-21961-1-git-send-email-niziak@spox.org>
References: <1487753715-21961-1-git-send-email-niziak@spox.org>
Message-ID: <20170222110813.76e8d38c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 09:55:15 +0100, Wojciech Nizinski wrote:
> Previous change forces lua package to be built, even if LuaJIT
> is selected as only one lua interpreter.
> Problem is located in lzlib build system: cmake scripts cannot find
> luajit.
> This patch restores previous depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> and adds build dependency to luajit or lua.
> 
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>

Thanks for your contribution. See some comments below.

> diff --git a/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
> new file mode 100644
> index 000000000..30e29aae8
> --- /dev/null
> +++ b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
> @@ -0,0 +1,67 @@
> +From 4cedebed4746f1bcc3dc1a3e0c0bc7251153aeca Mon Sep 17 00:00:00 2001
> +From: Wojciech Nizinski <niziak@spox.org>
> +Date: Tue, 21 Feb 2017 12:51:31 +0100
> +Subject: [PATCH] FindLua.cmake: support for LuaJIT
> +

This patch needs your SoB line.

Also, since this is kind of a feature patch, we will most likely not
accept it in Buildroot unless it is accepted upstream. Have you
submitted this patch to the upstream lzlib project?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
