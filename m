From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 6 Sep 2018 22:29:04 +0200
Subject: [Buildroot] [PATCH] package/cutelyst: Fix configuration build
 breakage
In-Reply-To: <87d0tq74oh.fsf@dell.be.48ers.dk>
References: <1536264091-1058-1-git-send-email-michael@amarulasolutions.com>
 <87d0tq74oh.fsf@dell.be.48ers.dk>
Message-ID: <CAOf5uwnkmXfH8J6KRaf+kiqARpJOpx2q=n0R7z0fwaeYdby3+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Thu, Sep 6, 2018 at 10:26 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Michael" == Michael Trimarchi <michael@amarulasolutions.com> writes:
>
>  > make beaglebone_qt5_defconfig
>  > mkdir -p /home/michael/work/amarula/elco/sitara/output/build/buildroot-config/lxdialog
>  > PKG_CONFIG_PATH="" make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" \
>  > ...
>  > package/cutelyst/Config.in:19: syntax error
>  > package/cutelyst/Config.in:18: invalid option
>  > Makefile:937: recipe for target 'beaglebone_qt5_defconfig' failed
>  > make: *** [beaglebone_qt5_defconfig] Error 1
>
>  > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>
> Thanks - This has been fixed in the mean time though, so I'm marking
> this as superseeded:
>
> https://git.buildroot.net/buildroot/commit/?id=07613c8890f6a7fea2b1ebbad0ee03a9c91ebb6c
>

We have fixed in the same time ;)

Michael

> > ---
>  >  package/cutelyst/Config.in | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
>  > index b2b48ba..3e28cff 100644
>  > --- a/package/cutelyst/Config.in
>  > +++ b/package/cutelyst/Config.in
>  > @@ -15,4 +15,4 @@ config BR2_PACKAGE_CUTELYST
>  >  comment "cutelyst needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.3"
>  >      depends on BR2_PACKAGE_QT5
>  >      depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  > -    depends !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
>  > +    depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
>  > --
>  > 2.7.4
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> Bye, Peter Korsgaard



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
