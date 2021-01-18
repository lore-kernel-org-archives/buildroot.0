From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jan 2021 20:13:12 +0100
Subject: [Buildroot] random segmentation fault during built
In-Reply-To: <CAEUhbmWy918HoQtKzGwadJTRPqCenGG+j8K1jQ0DPhckhmKUSw@mail.gmail.com>
References: <CAEUhbmUnHYTOhirctT9EVphsys9PPwbvM5hkBKP7sVabnv1zmg@mail.gmail.com>
 <20210110170405.29cf9095@gmx.net>
 <CAEUhbmVURa_J3k46jCFTbV7UPWvQTVxWNq--w+T+Mz3jgSJaBQ@mail.gmail.com>
 <20210111203057.07299bb3@gmx.net>
 <CAEUhbmWy918HoQtKzGwadJTRPqCenGG+j8K1jQ0DPhckhmKUSw@mail.gmail.com>
Message-ID: <20210118201312.47e120d8@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bin,

On Sun, 17 Jan 2021 23:30:51 +0800, Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Peter,
>
> On Tue, Jan 12, 2021 at 3:30 AM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello Bin,
> >
> > On Mon, 11 Jan 2021 09:11:48 +0800, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > > Hi Peter,
> > >
> > > On Mon, Jan 11, 2021 at 12:04 AM Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > Hello Bin,
> > > >
> > > > On Sun, 10 Jan 2021 21:57:45 +0800, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > I see a random segmentation fault during the build of buildroot. For example,
> > > > >
> > > > > Makefile:13408: recipe for target 'install-pylibmountexecPYTHON' failed
> > > > > make[4]: *** [install-pylibmountexecPYTHON] Segmentation fault (core dumped)
> > > > > make[4]: *** Waiting for unfinished jobs....
> > > > >
> > > > > Type "make" for the 2nd time with nothing changed, or rarely a 3rd
> > > > > time, get a PASS build.
> > > > >
> > > > > This was observed by builds on Ubuntu 16.04 and Ubuntu 20.04 hosts.
> > > > > Any ideas of what could be wrong?
> > > >
> > > > In case the errors are at random packages/locations (and succeed on iteration)
> > > > check your hardware and/or memory, see e.g. [1]...
> > > >
> > > > Early versions of the AMD Ryzen CPU had heavy-load segfault bug, see [2]...
> > > >
> > > > Regards,
> > > > Peter
> > > >
> > > > [1] https://tldp.org/FAQ/sig11/html/index.html
> > > > [2] https://techreport.com/news/32459/amd-ships-revised-ryzen-cpus-with-a-compile-bug-fix/
> > >
> > > Thank you. I checked the above 2 links and suspect it's not related.
> > >
> > > The issue happens on one Intel Xeon CPU with a Ubuntu 16.04 and one
> > > Intel CORE i9 with a Ubuntu 20.04. The segmentation fault seems to
> > > happen randomly during package "make install" phase.
> >
> > Back to the first question: random packages/locations or always at the same (or
> > similar) location? Always some python (related) package?
>
> Looks it's random, not always some Python packages. For example, I saw
> this today:
>
> make[3]: *** [Makefile:1826: install-pkgconfDATA] Segmentation fault
> make[3]: *** Waiting for unfinished jobs....
>
> >
> > Which buildroot version? Mind to share your .config file?
>
> The current buildroot HEAD with commit
> 6d4f1324d4a4a23938e40cc12a033a3a264b4ec1, plus my patch:
> http://patchwork.ozlabs.org/project/buildroot/patch/1610355672-3008-3-git-send-email-bmeng.cn at gmail.com/
>
> .config file attached

Did test with your .config  five times in a row, no problems here (openSUSE
Tumbleweed on AMD Ryzen 7 1800X Eight-Core Processor)..., so it seems to be
something specific to your environment...

Can you send the output of 'ls -ltr build | tail' after failure (to give some
hint which package fails) and a little bit more surroundings of the failure
output?

Regards,
Peter

>
> >
> > Mind to enable core-dump ('ulimit -c unlimited') and take a look at the core
> > file?
> >
>
> Sorry I did not enable core dump. I will have to turn it on now.
>
> Regards,
> Bin
