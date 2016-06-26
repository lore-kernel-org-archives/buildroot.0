From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:33:23 +0200
Subject: [Buildroot] [PATCH v3 1/5] package/efl: switch to luajit support
In-Reply-To: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160626213323.798288c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 23:27:42 +0200, Romain Naour wrote:
> In efl 1.15.x, Lua "old" support is broken with Lua 5.2+ [1].
> 
> With the patch added in efl 1.16 to fixes this issue, libevas fail to link with
> the following error:
> 
> CCLD bin/ecore_evas/ecore_evas_convert
> host-efl-1.16.1/src/lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
> collect2: error: ld returned 1 exit status
> Makefile:19021: recipe for target 'bin/ecore_evas/ecore_evas_convert' failed
> 
> Since 9ba8d1cce4ab00307827083bae234d87b37fb967, the luajit support can be
> enabled in efl package.
> In order to update the efl stack to 1.17, switch to luajit support and remove
> Lua "old" support since it's not fixed upstream yet. But the drawback is the
> efl stack depends implicitely on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS.
> 
> [1] https://phab.enlightenment.org/T2728
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Entire series applied, thanks! I just did a minor change, I'll reply to
the specific patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
