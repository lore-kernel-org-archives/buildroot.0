From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:25:06 +0100
Subject: [Buildroot] [PATCH 6/6] package/mpd: add choice between version
 0.19 and 0.20
In-Reply-To: <1486710272.9565.3.camel@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-7-joerg.krause@embedded.rocks>
 <20170209213445.4b012033@free-electrons.com>
 <1486710272.9565.3.camel@embedded.rocks>
Message-ID: <20170211152506.476e9e1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 08:04:32 +0100, J?rg Krause wrote:

> > I am not sure we want to support a version choice for mpd just for
> > the
> > sake of NIOSII, ARMv4, ARMv5 and SPARCv8.  
> 
> I'm using an ARMv5 board with MPD?myself. I really like to have that
> package available for this arch in the next Buildroot release.

OK, makes sense. So could you send an updated version with the following
changes:

 - Hash for 0.19, as you mentioned.

 - Removal of visible options. Just use 0.20 if possible (recent enough
   and non-buggy compiler) and fallback to 0.19 if not. A visible
   choice is really not needed for this. Also, if you use any
   Config.in option for that, they should be prefixed BR2_PACKAGE_MPD
   and not BR2_MPD like your patch was doing.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
