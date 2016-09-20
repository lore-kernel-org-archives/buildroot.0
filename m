From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 13:51:16 +0200
Subject: [Buildroot] [PATCH 2/2] python-psutil: fix build against musl C
	library
In-Reply-To: <20160920133053.3cb8e9bc@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 Sep 2016 13:30:53 +0200")
References: <20160920074127.22328-1-peter@korsgaard.com>
 <20160920074127.22328-2-peter@korsgaard.com>
 <20160920121433.3912ca4a@free-electrons.com>
 <8760pq50es.fsf@dell.be.48ers.dk>
 <20160920133053.3cb8e9bc@free-electrons.com>
Message-ID: <87shsu3i2z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 Sep 2016 12:30:03 +0200, Peter Korsgaard wrote:

 >> > This is not really the solution recommended by the musl developers.
 >> > Instead, the musl developers would suggest to *not* include
 >> > <linux/sysinfo.h> at all, and instead duplicate the relevant
 >> > definitions in the userspace program.  
 >> 
 >> Yes, I know it is a hack (as mentioned in the description). The problem
 >> is that the code DOESN'T include linux/sysinfo.h, but it gets indirectly
 >> included from linux/ethtool.h -> linux/kernel.h -> linux/sysinfo.h.
 >> 
 >> Do you have any suggestion how to fix this in a cleaner way?

 > The answer of the musl developers would be: don't include
 > <linux/ethtool.h> in the first place.

I don't see the point of that reasoning - The whole idea of the Linux
uapi headers is to provide headers for the kernel API.

I'm not particulary interested in musl support for
python-psutil. Alternatively we can just mark it as
!BR2_TOOLCHAIN_USES_MUSL.

What do you suggest?

-- 
Venlig hilsen,
Peter Korsgaard 
