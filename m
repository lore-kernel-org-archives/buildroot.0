From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 26 May 2015 07:11:50 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-19
In-Reply-To: <20150520231825.240a9292@free-electrons.com>
References: <20150520063015.F3A9A10113A@stock.ovh.net>
 <20150520231825.240a9292@free-electrons.com>
Message-ID: <1432624310.2727.5.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-05-20 at 23:18 +0200, Thomas Petazzoni wrote:
> >          arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/4a0b4db5fdad581e1ec3e8133bfdb1c485105a65/
> 
> uClibc bug in static linking:
> 
> multiple definition of `__GI_raise'
> 
> Alexey, can you have a look and see if it's fixed in uClibc master?

Looks like that's a generic problem with statically built uClibc with
Linuxthreads.old

In case of NPTL "libc/signals/raise.c" won't be compiled so there's no
even possibility for such a clash.

We'll take a look at that problem, still since we're moving toward NPTL
tools if there's no simple solution we may just leave it as it is now
until there's anybody interested in fixing that for good.

-Alexey
