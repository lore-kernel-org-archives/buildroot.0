From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 17:43:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118163551.GA18359@enterprise.starfleet>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me>
 <20180118160514.0684a720@windsurf.lan>
 <20180118154441.GB26856@momiji>
 <20180118172216.31d59b4c@windsurf.lan>
 <20180118163551.GA18359@enterprise.starfleet>
Message-ID: <20180118174319.378bfb1b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 08:35:51 -0800, Guillermo A. Amaral wrote:

> > Yes, I agree it would be much better to add a -Wl,-rpath,/opt/vc/lib to
> > the LDFLAGS if the libraries are in /opt/vc/lib.
> 
> After 6-7 years, I hoped that darn path wouldn't be an issue anymore.
> If only Raspbian and friends would all add /opt/vc/lib to their
> ld.so.conf...
> 
> Anyway, I'll try the rpath approach, using LD_LIBRARY_PATH did hurt a
> little, but at the moment it looked like the lesser of two evils; They
> already added in another workaround for more library locations for the
> RPi and it's starting to look even more like a hodgepodge.

I would be the SDL2 upstream developers, I would just tell the RPi
users to add /opt/vc/lib to /etc/ld.so.conf, if they really want to add
libraries in this non-standard location.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
