From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 09:22:43 +0100
Subject: [Buildroot] [PATCH] perf: new package
In-Reply-To: <CAPDLWs_+GNS6EtzWVt98wwDiDwnqVc+BvAQm31+5ib62-bGQ4A@mail.gmail.com>
References: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAPDLWs_+GNS6EtzWVt98wwDiDwnqVc+BvAQm31+5ib62-bGQ4A@mail.gmail.com>
Message-ID: <20130104092243.47bb447e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kaiwan Billimoria,

On Fri, 4 Jan 2013 11:35:56 +0530, Kaiwan Billimoria wrote:

> Just checking / asking:
> 1. what about the kernel patch to be applied such that kernel build
> for perf is successful (i sent in the patch yesterday)

It apparently wasn't needed to build perf on a 3.7 kernel.

> 2. In my patch (linux.mk), I make a validity check to confirm that the
> kernel version is >= 2.6.31 (as perf is only supported from that ver
> onward). Should we keep that check?

For now, I did not introduce it, due to the fact that the kernel
versions for which perf is usable are not clear yet. According to you,
it's 2.6.31, according to me it's 3.7. Once we figure that out, we can
introduce a version check if needed.

> 3. You mention :
> > the NO_LIBELF variable, which allows to get rid of the libelf dependency,
> > has only been introduced between 3.6 and 3.7.
> I did test my patches on the 3.2.21 vanilla kernel and it seems to work okay..

Here is the tools/perf/Makefile from 3.2.21 :
https://git.kernel.org/?p=linux/kernel/git/bwh/linux-3.2.y.git;a=blob;f=tools/perf/Makefile;h=b98e3075646b43f8f3218f45289f65068ea7ef31;hb=8499e79e9ee4c946ae38fd12e5d3afe8b68f2dfd

As you can see, it does not understand the NO_LIBELF variable, but
requires the libelf library to be present. So I'm not sure how you
manage to build perf without libelf with 3.2.21.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
