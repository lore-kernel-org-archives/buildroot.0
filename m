From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:20:01 +0100
Subject: [Buildroot] [PATCH v4 2/3] uhttpd: new package
In-Reply-To: <1476702145-25280-2-git-send-email-Rahul.Jain@imgtec.com>
References: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
 <1476702145-25280-2-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <20161105142001.661fc196@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 16:32:24 +0530, Rahul Jain wrote:

> +ifeq ($(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION),"5.1")
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +UHTTPD_DEPENDENCIES += lua
> +else ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +UHTTPD_DEPENDENCIES += luajit

It doesn't build with LuaJIT:

[ 35%] Linking C shared module uhttpd_lua.so
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -llua
collect2: error: ld returned 1 exit status

So I've modified  your patch to only use Lua. If you want to re-enable
LuaJIT support, could you fix the issue and send a follow-up patch?

Applied to next with this issue fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
