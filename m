From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Dec 2019 23:47:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/dante: bump to version 1.4.2
In-Reply-To: <20191214225557.7dbf4e51@windsurf.home>
References: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
 <20191209222746.3440986-3-fontaine.fabrice@gmail.com>
 <20191214225557.7dbf4e51@windsurf.home>
Message-ID: <CAPi7W81F57vKhJaiAxqi6AGWGQHc6mt0JPSoLBehyPQF31xirQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le sam. 14 d?c. 2019 ? 22:55, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Mon,  9 Dec 2019 23:27:46 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +As a result, $ERRVALFILE does not contain the expected values because
> > +the expected value is not on the same line than gaierrval:
> > +
> > + gaierrval:
> > + # 130 "conftest.c" 3 4
> > +           -3
>
> I am not seeing this issue here, the relevant part of the .i file looks
> like this:
>
> # 129 "conftest.c" 2
> int
> main ()
> {
>
>
> gaierrval: -11
>
>
>
>   ;
>   return 0;
> }
>
> It's quite odd that you get this # 130 conftest.c line in the middle of
> the .c file dump. What are we doing differently ? Is it a compiler
> version issue ?
>
> Which toolchain are you using when you're having the issue ?
I got this build failure with the defconfig that I put in the "Fixes:"
statement (i.e. toolchain-external-linaro-aarch64 from
http://autobuild.buildroot.org/results/8a9/8a92d5257ba3e6fd0ad56ddb0afad8b6edd40ae3/defconfig).
I have the same error with br-x86-64-musl-2019.05.1.tar.bz2 from
http://autobuild.buildroot.org/results/434/434393662f73118efb4b7113a48aaf40e9484a3c/defconfig.
So I don't really understand what's going on.
If you want, I can send a v2 without this patch and we'll see if build
failures are raised on the autobuilders.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
