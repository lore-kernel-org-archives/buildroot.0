From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 11:18:56 +0100
Subject: [Buildroot] [PATCH 3/4] hostapd: make ACS dependent on nl80211
In-Reply-To: <20171230095000.GA486@hpx>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-4-alexander.i.mukhin@gmail.com>
 <20171229223748.5dd69cd3@windsurf.lan> <20171230095000.GA486@hpx>
Message-ID: <20171230111856.1d7198e4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 12:50:00 +0300, Alexander Mukhin wrote:

> > > ACS is supported for nl80211 driver only.
> > >   
> > Could you add more details here? Do you see a build failure? Runtime
> > failure?
> > 
> > If CONFIG_ACS=y doesn't build when CONFIG_DRIVER_NL80211 is disabled,
> > then this fix should be part of PATCH 2/4, otherwise PATCH 2/4
> > introduces a build regression.  
> 
> My guide here is hostapd's defconfig, where it's stated that "ACS is
> currently only supported through the nl80211 driver". Search through the
> source code also reveals ACS machinery in the nl80211 driver only.
> 
> hostapd builds successively with ACS enabled and nl80211 disabled, but
> an attempt to use ACS by setting a wireless channel to 0 results in a
> runtime failure (driver doesn't accept this value).

Thanks for this additional explanation. Could you include this in the
commit log in the next iteration of this patch series ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
