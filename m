From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 15:59:10 +0100
Subject: [Buildroot] [PATCH v1 1/2] qt5base: use system/buildroot
 provided freetype
In-Reply-To: <20170210153619.2d894fa5@gmx.net>
References: <20170209223055.31121-1-ps.report@gmx.net>
 <20170210093634.68f43e26@free-electrons.com>
 <20170210153619.2d894fa5@gmx.net>
Message-ID: <20170210155910.16d3e3d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 15:36:19 +0100, Peter Seiderer wrote:

> > So since Qt 5.8, both freetype and harfbuzz are mandatory for the GUI
> > support ?  
> 
> Do not know if 'mandatory', but at the moment qt-provided/built-in
> freetype/harfbuzz are used by both versions (5.6/5.8) in case
> GUI is enabled...
> 
> I can try without freetype/harfbuzz but I think this will lead to
> no/very poor font support (maybe bitmap fonts?)...

OK. If you feel like they are technically not mandatory, but in
practice quite needed to get a decent functionality, then OK to have
them enabled.

> > Should we make these additional dependencies only exist for the Qt
> > latest version (they were not needed for Qt 5.6) ?  
> 
> If using the system/buildroot provided libraries is preferred it should
> be done for both versions...

System/buildroot provided libraries are definitely preferred. That's
why we're using -system-<foo> all over the place in qt5base.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
