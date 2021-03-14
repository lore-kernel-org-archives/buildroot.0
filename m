From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:26:08 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/zeromq: disable package if
 binutils is affected from bug 21464
In-Reply-To: <bfde2763-b4f6-a816-101e-033b3801c003@benettiengineering.com>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-4-giulio.benetti@benettiengineering.com>
 <20210314223616.5bfcc62f@windsurf.home>
 <bfde2763-b4f6-a816-101e-033b3801c003@benettiengineering.com>
Message-ID: <20210314232608.44e9d133@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Mar 2021 22:45:07 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > This is not sufficient: there are numerous packages that "select
> > BR2_PACKAGE_ZEROMQ", so this "depends on" would have to be propagated.  
> 
> Oh, again forgotten about Kconfig dependencies, I'm going to fix this
> and the other patches too.

But it's annoying to propagate all those depends on... It would be so
much nicer to have a workaround for those bugs.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
