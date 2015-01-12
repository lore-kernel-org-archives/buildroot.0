From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 16:37:37 +0100
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <54B3E959.2010504@ou.edu>
References: <54B317DE.9090105@ou.edu>
 <20150112092800.08ce4350@free-electrons.com>
 <54B3E959.2010504@ou.edu>
Message-ID: <20150112163737.6739827b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

> >> compilation terminated.
> >> make[3]: *** [readxml.o] Error 1
> The build triggers lots of automatic reconfiguration, I guess it must be something on
> the host side getting rebuilt then. I'll double check while I'm updating the patch.

Not sure to understand exactly what you mean here.


> > I'm a little bit surprised by the need for host-libxml2 and
> > host-freetype, but I admittedly haven't looked in detail.
> I added them because of host side configure problems:
> 
> checking for libxml - version >= 2.6.0... no
> *** The xml2-config script installed by LIBXML could not be found
> 
> configure:5176: checking for freetype-config
> configure:5192: found /usr/bin/freetype-config

Hu? This does not indicate a host dependency: it indicates that it's
incorrectly using the host freetype-config, while it should be using
the one in $(STAGING_DIR). Generally, this is solved by passing some
ac_cv_path_<foo> variable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
