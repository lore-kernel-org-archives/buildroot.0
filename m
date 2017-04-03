From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:52:09 +0200
Subject: [Buildroot] [PATCH] qemu: allow to build statically
In-Reply-To: <20170402143717.40a43f24@free-electrons.com>
References: <20161109100305.6261-1-jezz@sysmic.org>
 <20170402143717.40a43f24@free-electrons.com>
Message-ID: <20170403225209.3925c84c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Apr 2017 14:37:17 +0200, Thomas Petazzoni wrote:

> On Wed,  9 Nov 2016 11:03:05 +0100, J?r?me Pouiller wrote:
> > Compiling Qemu statically allows to use it to chroot into target/. It is a
> > nice feature, so add an option for it.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> >  package/qemu/Config.in.host | 26 ++++++++++++++++++++++++++
> >  package/qemu/qemu.mk        |  4 ++++
> >  2 files changed, 30 insertions(+)  
> 
> Now that this patch is committed, we are seeing some build failures on
> host-qemu when linked statically:
> 
>   http://autobuild.buildroot.net/results/6bc/6bcfabc020fede51adcfafc9a570df5884d95696/build-end.log
>   http://autobuild.buildroot.net/results/4d0/4d0182da77cf386e57acf0565a18fc4628abbdc8/build-end.log
> 
> Could you have a look?

FWIW, I've reverted this patch. It's a feature that already wasn't seen
as very essential, and it's causing some build failures.

I don't think it's really easy to provide a functionality that allows
to build a host executable as a static binary, because most host
systems use glibc, and glibc doesn't officially support static linking.

Feel free to investigate those build failures (see the commit log for
the three different build failures) and send an updated version that
makes sure those build failures are fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
