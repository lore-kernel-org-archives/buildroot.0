From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 16:37:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <1285703624.2923407.1523543239898.JavaMail.zimbra@datacom.ind.br>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
 <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
 <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
 <345647775.2610070.1523450364355.JavaMail.zimbra@datacom.ind.br>
 <20180411151910.21a71a99@windsurf>
 <1873592662.2762704.1523500837920.JavaMail.zimbra@datacom.ind.br>
 <20180412090641.0bda08c5@windsurf>
 <1285703624.2923407.1523543239898.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180412163737.16e4b8e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 11:27:19 -0300 (BRT), Carlos Santos wrote:

> I generated toolchains with ct-NG 1.20 for i686 and ARM. Here are
> the results:
> 
> $ i686-nptl-linux-gnu-gcc --version
> i686-nptl-linux-gnu-gcc (crosstool-NG 1.20.0) 4.7.4
> $ echo '#include <glib-object.h>' | i686-nptl-linux-gnu-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
> In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
>                  from staging/usr/include/glib-2.0/glib-object.h:23,
>                  from <stdin>:1:
> staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is not used [-Werror=unused-value]
> cc1: all warnings being treated as errors
> 
> $ arm-unknown-linux-gnueabi-gcc --version
> arm-unknown-linux-gnueabi-gcc (crosstool-NG 1.20.0) 4.7.4
> $ echo '#include <glib-object.h>' | arm-unknown-linux-gnueabi-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
> In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
>                  from staging/usr/include/glib-2.0/glib-object.h:23,
>                  from <stdin>:1:
> staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is not used [-Werror=unused-value]
> cc1: all warnings being treated as errors

So the problem is indeed not PowerPC specific :) Thanks for taking the
time to generate those toolchains BTW!

Perhaps this will encourage the glib developers to accept a solution
upstream ?

> I will change in the tpm2-abrmd recipe but will try to restrict it to
> GCC 4.7.x and below.

What about a solution in glib itself ? Make those definitions
conditional on the gcc version, i.e only if gcc >= 4.8 is used ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
