From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 11:42:35 +0200
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705111007.63ff239b@free-electrons.com>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705111007.63ff239b@free-electrons.com>
Message-ID: <20150705094235.GH3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, Thomas, All,

On 2015-07-05 11:10 +0200, Thomas Petazzoni spake thusly:
> On Sun, 5 Jul 2015 00:00:50 -0500, Mike wrote:
> > Meanwhile, the package I had specified as external was
> > LuaJIT.
> > And that package may be a **very special** case.
> 
> I've tried with LuaJIT and out of tree build, and it works just fine
> for me:
[--SNIP--]
> $ make
> [...]
> >>> luajit custom Syncing from source dir /home/thomas/projets/luajit-2.0/
> rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/thomas/projets/luajit-2.0// /tmp/luajit-build/build/luajit-custom
> >>> luajit custom Configuring
> >>> luajit custom Building
> /usr/bin/make -j5 PREFIX="/usr" STATIC_CC="/tmp/luajit-build/host/usr/bin/arm-linux-gcc" DYNAMIC_CC="/tmp/luajit-build/host/usr/bin/arm-linux-gcc -fPIC" TARGET_LD="/tmp/luajit-build/host/usr/bin/arm-linux-gcc" TARGET_AR="/tmp/luajit-build/host/usr/bin/arm-linux-ar rcus" TARGET_STRIP=true TARGET_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " TARGET_LDFLAGS="" HOST_CC="/usr/bin/gcc -m32" HOST_CFLAGS="-O2 -I/tmp/luajit-build/host/usr/include" HOST_LDFLAGS="-L/tmp/luajit-build/host/lib -L/tmp/luajit-build/host/usr/lib -Wl,-rpath,/tmp/luajit-build/host/usr/lib" BUILDMODE=dynamic -C /tmp/luajit-build/build/luajit-custom amalg
> Building LuaJIT 2.0.4
> /usr/bin/make -C src amalg
> +--------------------------------------------------------------------------+
> | WARNING: Compiling the amalgamation needs a lot of virtual memory        |
> | (around 300 MB with GCC 4.x)! If you don't have enough physical memory   |
> | your machine will start swapping to disk and the compile will not finish |
> | within a reasonable amount of time.                                      |
> | So either compile on a bigger machine or use the non-amalgamated build.  |
> +--------------------------------------------------------------------------+
> /usr/bin/make all "LJCORE_O=ljamalg.o"
> HOSTCC    host/minilua.o
> HOSTCC    host/buildvm_asm.o
> HOSTCC    host/buildvm_peobj.o
> HOSTCC    host/buildvm_lib.o
> [...]
> 
> I.e, it works perfectly fine.

I concur with Thomas, it works as expected for me, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
