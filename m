From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 10:24:21 +0200
Subject: [Buildroot] [PATCH] package/libubox: fix lua module install path
In-Reply-To: <20170506202610.19962-1-yann.morin.1998@free.fr>
References: <20170506202610.19962-1-yann.morin.1998@free.fr>
Message-ID: <20170507102421.447e67e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 22:26:10 +0200, Yann E. MORIN wrote:
> The LUAPATH variable is only used when installing the lua module, and
> cmake knows very well how to do out-of-tree isntalls, so there is no
> reason to include the staging path in LUAPATH, which will cause our
> post-install sanity checks to kick in and whine:
> 
>     libubox: installs files in /home/lhk/workspace/orangepi/host/usr/a
>     rm-buildroot-linux-gnueabihf/sysroot//home/lhk/workspace/orangepi
> 
> As for libuci, just pass the runtime LUAPATH.
> 
> Fixes #9856
> 
> Reported-by: linhuikui at gmail.com
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/libubox/libubox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
