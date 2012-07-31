From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 11:04:20 +0200
Subject: [Buildroot] [PATCH] sysprof: New package.
In-Reply-To: <20120730235830.27770869@skate>
References: <CAFbHwiTWnB+EtB=Du5bkAa7mtKfJ7nHeyWGshpq7Rcvjf9O__g@mail.gmail.com>
 <20120730235830.27770869@skate>
Message-ID: <20120731110420.76490dd1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Will,

Le Mon, 30 Jul 2012 23:58:30 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Le Fri, 27 Jul 2012 16:26:23 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
> 
> > Signed-off-by: Will Newton <will.newton@imgtec.com>
> 
> Applied, thanks. I did some changes to the package, though:
> 
>      - add dependencies on the supported architectures to avoid build
>        failures on ARM and other unsupported arches
>      - add a patch that removes an useless warning about the kernel
>        version. This patch is present upstream. However since it
>        modifies configure.ac, we need to autoreconf the package.
>      - change AUTOTARGETS to autotools-package

Unfortunately, the sysprof package has a number of build problems on
x86 and ppc. See:

http://autobuild.buildroot.org/results/60728435af0221548c817cc8771674cc088e4d10/build-end.log
http://autobuild.buildroot.org/results/2d0ce96b30d32992d8f55f3a5974a81bbdb88915/build-end.log

It has been causing quite a few build failures since I merged the
package, so it would be good to fix those.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
