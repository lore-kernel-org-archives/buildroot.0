From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 10:20:37 +0200
Subject: [Buildroot] [PATCHv3 1/4] pkgconf: new package
In-Reply-To: <20120927100912.6b623e39@skate>
References: <1348656857-27725-1-git-send-email-gustavo@zacarias.com.ar>
 <50640642.8020407@mind.be> <20120927100912.6b623e39@skate>
Message-ID: <50640C55.4070005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/12 10:09, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 27 Sep 2012 09:54:42 +0200, Arnout Vandecappelle wrote:
>
>> (on 750 packages, with the external sourcery toolchain for x86_64,
>> excluding the 30-ish packages that didn't build before; took a bit of
>> time to find a working allpackageyesconfig). I don't suppose I have
>> to retest with this series?
>
> Just curious, how long does it take to build the whole thing?

  I haven't checked...  I just do a make -k during the night and see what
I need to fix in the morning.  I normally keep a log file but that's
already wiped.


> Would be good to fix those 30-ish packages that don't build, but I
> guess some of them are due to the host tuple not being different
> (waiting for your<arch>-buildroot-linux... to be merged).

  The cross-build problem I patched first, otherwise there would be many more
failures (and probably all of them packages that use pkg-config).  The
remaining problems are:

- The LD_LIBRARY_PATH problem I mentioned, worked around by setting
   XMLTO=/dev/null

- CMake doesn't find libraries in $(STAGING_DIR)/usr/lib64, worked around
   by setting CMAKE_LIBRARY_PATH

- Similar for scons, no workaround (gpsd fails to build)

- xapp_* needs to be upgraded due to Xorg upgrade

- linux-pam, sdl-gfx: not analysed why they fail

- packages from avr32linux fail to download

- there are a few packages that I disabled before for some reason, and I
   didn't enable them again.


  I'm planning to do a more thorough analysis + fixes at some point.
When I have time :-P

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
