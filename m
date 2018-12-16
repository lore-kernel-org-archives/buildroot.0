From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 09:17:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-14
In-Reply-To: <87zht69k2o.fsf@tkos.co.il>
References: <20181215070019.5B30D20CE3@mail.bootlin.com>
 <CAMRc=MckU2reCdyzJb1cvNKmL71=o1KWHwoOrSzLvXh1193Bvg@mail.gmail.com>
 <87zht69k2o.fsf@tkos.co.il>
Message-ID: <20181216091754.66bb0ec6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Dec 2018 06:22:55 +0200, Baruch Siach wrote:

> > Makefile.legacy:9: *** "You have legacy configuration in your .config!
> > Please check your configuration.".  Stop.
> > Makefile:84: recipe for target '_all' failed
> > make: *** [_all] Error 2  
> 
> This is most likely because of the BR2_TARGET_GENERIC_PASSWD_MD5 symbol
> that has recently been added to Config.in.legacy. You can use the
> defconfig instead. Here is what I usually do:
> 
>   wget -O .config http://autobuild.buildroot.net/results/71c46fac3bd30c7d30ac89ce43e411a9772665bb/defconfig
>   make olddefconfig

Also, to reproduce a build failure, one can use the following script:

  http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

Like this:

  ./br-reproduce-build 71c46fac3bd30c7d30ac89ce43e411a9772665bb

It makes sure to checkout the right Buildroot commit, on which the
build failure occurred.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
