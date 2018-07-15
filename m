From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Jul 2018 16:31:30 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180715100256.GA27498@itchy>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <20180714222729.00517695@windsurf> <20180715100256.GA27498@itchy>
Message-ID: <20180715163130.1cb50643@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Sun, 15 Jul 2018 12:02:56 +0200, Eric Le Bihan wrote:

> > If Ninja is compatible with both Python 2 and Python 3, why can't we
> > use the system-provided Python interpreter rather than building our
> > own ?  
> 
> Is it the technique used for cmake with $(BR2_CMAKE_HOST_DEPENDENCY), or
> am I mistaken?

No, it's not the same thing. BR2_CMAKE_HOST_DEPENDENCY is to avoid
building CMake if a suitable CMake version is already provided on the
host.

What I'm suggesting as a first step is to avoid building both
host-python3 and host-python. Once this first step is done, and only
host-python3 gets built, then maybe we can think of avoiding the
host-python3 build by using the system-provided version, with something
similar to BR2_CMAKE_HOST_DEPENDENCY.

> > Does Meson absolutely needs a Python 3 interpreter ?  
> 
> Meson is strict about this. From setup.py:

Meh, OK :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
