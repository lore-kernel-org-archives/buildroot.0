From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 20 Aug 2015 08:41:34 +0000
Subject: [Buildroot] [PATCH] boost: fix build on ARC
In-Reply-To: <20150819230401.61f3b67c@free-electrons.com>
References: <1440008812-13384-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zj1n6lnv.fsf@dell.be.48ers.dk>
 <20150819230401.61f3b67c@free-electrons.com>
Message-ID: <4881796E12491D4BB15146FE0209CE64657844D2@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 20 ??????? 2015 ?. 0:04
> To: Peter Korsgaard
> Cc: buildroot at uclibc.org; Alexey Brodkin
> Subject: Re: [PATCH] boost: fix build on ARC
> 
> Peter,
> 
> On Wed, 19 Aug 2015 22:57:56 +0200, Peter Korsgaard wrote:
> > >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> >
> >  > This commit adds a patch to Boost to make it use the eventfd()
> >  > function provided by the C library when uClibc is used, rather than
> >  > falling back to using directly the __NR_eventfd system call. This
> >  > fixes the build on ARC, which doesn't define __NR_eventfd.
> >
> > What does it then do? Only __NR_eventfd2?

In case of ARC as being one of very few architectures that closely follow kernel's UAPI
we don't support lots of obsolete things and __NR_eventfd is one of them.
And indeed __NR_eventfd2 is supported.

For a bit more details pls refer to this explanation:
http://lists.boost.org/Archives/boost/2015/07/224257.php

-Alexey
