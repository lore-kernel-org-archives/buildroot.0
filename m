From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 May 2014 10:58:12 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAFbHwiSCJi8ZHTPFRteuvakFykU79dt1EuqY=9m2SiSr9x4Cvg@mail.gmail.com>
References: <20140507063009.23A95100E55@stock.ovh.net>
 <20140507093155.18034c1d@free-electrons.com>
 <CAFbHwiSCJi8ZHTPFRteuvakFykU79dt1EuqY=9m2SiSr9x4Cvg@mail.gmail.com>
Message-ID: <20140507105812.4a2802e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Newton,

On Wed, 7 May 2014 09:04:11 +0100, Will Newton wrote:

> >>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/bd0aefa1b1efb1a28d2af89a983b389ed2aeeff5/
> >>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/a0679d22dde393a8daa2e109e2438100e36e982d/
> >>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/1b19e911ff26d53708ac107e271d179e0e913735/
> >
> > Ok, on these ones, I have some news. It turns out that I tried to
> > reproduce the build issue on the *new* build server, while in fact the
> > autobuilds were still running on the *old* one. However, I restarted
> > the autobuilds on the new build server, and it has reported new
> > glibc/aarch64 failures... which I'm not able to reproduce.

No: they are the same ld segfault issue. You can access the logs by
using the links above, and read the "build-end.log" file.

I saw your e-mail suggesting that to test a binutils patch. The only
thing that surprises me here is that this issue is 100% reproducible
when executed by the autobuilder script, but does not occur when I do a
separate build (however in the same machine, same chroot as the
autobuilder script).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
