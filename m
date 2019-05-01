From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 14:40:26 +0200
Subject: [Buildroot] Buildroot does not try to find/use the
 system-installed meson
In-Reply-To: <CADYdroNf-GCbQVe5bZ1SU4D4aphJbnWPL_phiSLxLZb8DCv9wQ@mail.gmail.com>
References: <CADYdroNf-GCbQVe5bZ1SU4D4aphJbnWPL_phiSLxLZb8DCv9wQ@mail.gmail.com>
Message-ID: <a7227af9-dcc7-7984-0d2e-444d1557d8ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/04/2019 12:23, Norbert Lange wrote:
> Hello,
> 
> even though I have very recent meson installed, buildroot will go to
> great lengths to build everything from source (including host-python3,
> host-ninja and host-python which is a dependency of host-ninja for
> some reason).

 Cfr. [1].

> Is there a good reason for this, or is this just a lacking feature for now?

 The same question was asked [2] for the autotools packages (m4, autoconf,
automake), and the same answer applies:

>  The problem is rather that we don't *know* if there is some version dependency...
> 
>  That said, I think we can just go ahead and try it, and rely on the
> autobuilders to tell us if something doesn't work, and update the minimum
> version of that tool accordingly.
> 
>  Since we the oldest autobuilder we have is a CentOS6, I would use the versions
> from that as the minimum as a start.

 meson would definitely be much simpler to support than autotools, since you
just have to check the meson and the ninja executables. And I think it's much
more likely that an older meson still works.

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1047119/
[2] http://lists.busybox.net/pipermail/buildroot/2019-April/248409.html

> 
> I am pretty sure the system meson would do the same thing, and would
> only need the crosscompile configuration (as its done with CMake).
> 
> regards, Norbert
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
