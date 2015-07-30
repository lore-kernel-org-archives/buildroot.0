From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Jul 2015 13:14:16 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-29
In-Reply-To: <1438247167.5763.13.camel@synopsys.com>
References: <20150730063016.85822101F90@stock.ovh.net>
 <1438247167.5763.13.camel@synopsys.com>
Message-ID: <1438262056.5763.48.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2015-07-30 at 12:06 +0300, Alexey Brodkin wrote:
> Hi Thomas,
> >          arc |                    sudo-1.8.13 | NOK | 
> > 
> > http://autobuild.buildroot.net/results/1b77539d08ffd950317a58cef8e2a4ce624c4710/
> ------------------------->8--------------------
> /home/test/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getenv.os): In
> function `__GI_getenv':
> getenv.c:(.text+0x0): multiple definition of `getenv'
> env_hooks.o:env_hooks.c:(.text+0x11c): first defined here
> ------------------------->8--------------------
> 
> I believe something similar to the issue Vincente fixed for Bash, see
> http://git.buildroot.net/buildroot/commit/?id=9623ff651f83a350819719f10705552da9793205
> 
> Will look into that and prepare a patch.

Looks like there's no simple way to resolve this issue with static building on "sudo" against uClibc.
There's no autoconf option to disable internal implementation of "getenv" and somehow "sudo" could be
built as a static binary on my x86 host (obviously with glibc).

I'd say that this has something to do with uClibc (how it differs in implementation of "getenv")
compared to glibc but this is out of my scope of knowledge.

Probably Waldemar might be interested in that issue as well.

And as a dirty hack we may disable "sudo" in static builds but I don't like this approach personally
knowing that could be done with another libc implementation.

And indeed this is arch-independent problem with uClibc.

-Alexey
