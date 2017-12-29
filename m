From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 16:48:59 +0100
Subject: [Buildroot] [RFCv3 10/15] package/pkg-generic: handle
 host-ccache as a regular dependency
In-Reply-To: <20171229154228.GL3176@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-11-thomas.petazzoni@free-electrons.com>
 <20171229154228.GL3176@scaer>
Message-ID: <20171229164859.7550c8e4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 16:42:28 +0100, Yann E. MORIN wrote:

> > +ifeq ($(BR2_CCACHE),y)
> > +ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
> > +$(2)_DEPENDENCIES += host-ccache  
> 
> Sorry, I must be dumb, but I don't see where you exclude host-ccache
> from being its own dependency...

Good point. It's make that does it for me:

make[1]: Circular /home/thomas/projets/buildroot/output/build/host-ccache-3.3.4/.stamp_configured <- host-ccache dependency dropped.

 :-)

I'll fix that in the next iteration. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
