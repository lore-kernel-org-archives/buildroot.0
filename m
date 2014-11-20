From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 20 Nov 2014 19:58:26 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <20141120094407.4b487379@free-electrons.com>
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <1416513506.25116.9.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2014-11-20 at 09:44 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Quick analysis of yesterday build results. Samuel, Peter, Gustavo,
> Bernd, Yann, Vincente, Alexey, please have a look below.
> >          arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/9b480421bd66e046ff9200963facb2663b77fd35/
> 
> device-linux.o: In function `check_ip6_forwarding':
> /home/test/autobuild/instance-1/output/build/radvd-2.8/device-linux.c:189: undefined reference to `sysctl'
> 
> Alexey, can you have a look at this one?

This happens because for ARC in Linux kernel we don't have
__ARCH_WANT_SYSCALL_DEPRECATED.

So a number of syscalls is not enabled in
"include/asm-generic/unistd.h".

From the name of this define I would assume that we should avoid using
those syscalls. So probably "radvd" should be updated.

Any thoughts?

-Alexey
