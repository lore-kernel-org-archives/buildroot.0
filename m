From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:39:48 +0100
Subject: [Buildroot] [PATCH] package/pcm-tools: fix build with GCC 4.8.2
In-Reply-To: <20181215013813.451-1-casantos@datacom.com.br>
References: <20181215013813.451-1-casantos@datacom.com.br>
Message-ID: <20181216163948.792fc691@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Dec 2018 23:38:13 -0200, Carlos Santos wrote:
> Pass $(TARGET_CONFIGURE_OPTS) as arguments to make and add "-std=c++11"

TARGET_CONFIGURE_OPTS were already passed as argument: they are already
passed to the right hand-side of $(MAKE), so I dropped this particular
change.

> to CXXFLAGS, forcing C++ 2011 standard (it's experimental in GCC 4.8.2
> but goot enough to build pcm-tools).

This was enough to fix the build failure.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
