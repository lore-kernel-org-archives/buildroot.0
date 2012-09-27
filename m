From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Sep 2012 10:25:36 +0200
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <50640C55.4070005@mind.be>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
 <50640642.8020407@mind.be> <20120927100912.6b623e39@skate>
 <50640C55.4070005@mind.be>
Message-ID: <20120927102536.7729b853@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 27 Sep 2012 10:20:37 +0200, Arnout Vandecappelle wrote:

>   I haven't checked...  I just do a make -k during the night and see
> what I need to fix in the morning.  I normally keep a log file but
> that's already wiped.

Ok. I'm wondering if we should be running allyespackageconfig builds in
a regular fashion on the autobuild machines as well.

> > Would be good to fix those 30-ish packages that don't build, but I
> > guess some of them are due to the host tuple not being different
> > (waiting for your<arch>-buildroot-linux... to be merged).
> 
>   The cross-build problem I patched first, otherwise there would be
> many more failures (and probably all of them packages that use
> pkg-config).  The remaining problems are:
> 
> - The LD_LIBRARY_PATH problem I mentioned, worked around by setting
>    XMLTO=/dev/null
> 
> - CMake doesn't find libraries in $(STAGING_DIR)/usr/lib64, worked
> around by setting CMAKE_LIBRARY_PATH
> 
> - Similar for scons, no workaround (gpsd fails to build)
> 
> - xapp_* needs to be upgraded due to Xorg upgrade
> 
> - linux-pam, sdl-gfx: not analysed why they fail
> 
> - packages from avr32linux fail to download
> 
> - there are a few packages that I disabled before for some reason,
> and I didn't enable them again.
> 
> 
>   I'm planning to do a more thorough analysis + fixes at some point.
> When I have time :-P

Great, nice analysis. Looking forward to the corresponding fixes :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
