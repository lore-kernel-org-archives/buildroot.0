From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Dec 2013 14:05:34 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <87ob4cmvj1.fsf@dell.be.48ers.dk>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
 <87ob4cmvj1.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC9UmfJ06aYkE0ipFHCQYoHVZWnuZ0XupQsrPSt7_k8ZAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
thanks for reviewing,

On Thu, Dec 19, 2013 at 9:32 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
>  > Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
>  > commands to enable jobserver for the sub-make.
>
>  > Without the '+' prefix GNU make does not detect the sub-make so it
>  > disable the jobserver for the sub-make.
>
>  > From GNU make documentation:
>  > Using the MAKE variable has the same effect as using a ?+? character
>  > at the beginning of the recipe line.  This special feature is only
>  > enabled if the MAKE variable appears directly in the recipe: it does
>  > not apply if the MAKE variable is referenced through expansion of
>  > another variable. In the latter case you must use the ?+? token to get
>  > these special effects.
>
> Wouldn't it make more sense to add the '+' to MAKE / MAKE1?

Unfortunately that does not work, the '+' must be the first character
of the command line, e.g.:

 PATH=/home/fabiopo/buildroot/output/host/bin:/home/fabiopo/buildroot/output/host/usr/bin:/home/fabiopo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
LD_LIBRARY_PATH="/home/fabiopo/buildroot/output/host/usr/lib:"
PKG_CONFIG="/home/fabiopo/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/fabiopo/buildroot/output/host/usr/lib/pkgconfig"
PERLLIB="/home/fabiopo/buildroot/output/host/usr/lib/perl"
+/usr/bin/make -j5  -C
/home/fabiopo/buildroot/output/build/host-binutils-2.22/
/bin/sh: +/usr/bin/make: No such file or directory
make: *** [/home/fabiopo/buildroot/output/build/host-binutils-2.22/.stamp_built]
Error 127

Best regards
-- 
Fabio Porcedda
