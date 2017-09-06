From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:44:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/pngquant: fix target build
In-Reply-To: <20170906163904.14432-1-bernd.kuhls@t-online.de>
References: <20170906163904.14432-1-bernd.kuhls@t-online.de>
Message-ID: <20170906214426.24bdcc3a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Sep 2017 18:39:04 +0200, Bernd Kuhls wrote:
> Pngquant 2.10 introduced a bundled library libimagequant, Makefile
> passes $LIQCONFIGUREFLAGS to the configure script of libimagequant
> before building this library:
> https://github.com/pornel/pngquant/blob/master/Makefile#L27
> 
> This variable is filled by configure with the content of $LIQCONFIGURE
> https://github.com/pornel/pngquant/blob/master/configure#L553
> 
> We need to pass CC/CFLAGS/LDFLAGS as parameter to configure to fill
> $LIQCONFIGURE with correct values in order to use the target toolchain
> for building libimagequant:
> https://github.com/pornel/pngquant/blob/master/configure#L56
> 
> Fixes
> http://autobuild.buildroot.net/results/ab1/ab1193db9d76adc02be44d6f273e0986952df3e2/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pngquant/pngquant.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
