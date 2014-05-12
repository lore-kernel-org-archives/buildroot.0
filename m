From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 15:11:34 +0200
Subject: [Buildroot] [PATCH] protobuf: host-protobuf can only be built
 on certain architectures
In-Reply-To: <20140512112044.GN4096@tarshish>
References: <1399893031-28657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140512112044.GN4096@tarshish>
Message-ID: <20140512151134.500a8619@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 12 May 2014 14:20:44 +0300, Baruch Siach wrote:

> > technically it could build on ARM and MIPS.
> > 
> > Fixes:
> > 
> >  http://autobuild.buildroot.org/results/9b9/9b9b20b0e4694b11425cdc2382650cdc2774e400/
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> What about reverse dependencies? A quick search shows collectd (selects 
> BR2_PACKAGE_PROTOBUF_C), and ola (selects BR2_PACKAGE_PYTHON_PROTOBUF).

Aaah, indeed. I thought of all the packages using host-protobuf, but
not the reverse dependencies of those packages.

I'll resend an updated version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
