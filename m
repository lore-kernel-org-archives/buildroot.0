From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2016 08:43:21 -0700
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
Message-ID: <CAMKF1spiTaA0OcLFFW-+CuXDHQiU30HQoYBt8cytT-gO8qYs2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 5, 2016 at 8:14 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi all,
>
> I'm upgrading to Buildroot 2016.08.1 and noticed that gdb 'gained' a
> host-texinfo dependency in all cases. My configs did not previously
> have this dependency, and for build time minimization I want to avoid
> it.
>
> I can comment out the dependency, as I know that makeinfo is installed
> on all my build systems, but perhaps there is another way.
>
> I read in the archives that there have been multiple attempts to fix
> it differently, none of which were convincing, but I could not find
> details about these attempts or why they did not work.
>
> I did find a patch by Romain that is rejected but I could not see why:
> https://patchwork.ozlabs.org/patch/595042/
> It tells gdb to use a different makeinfo command.
>
> A similar trick is reported to work in the (still open) upstream bug
> for this issue:
> https://sourceware.org/bugzilla/show_bug.cgi?id=18113
> Essentially, setting MAKEINFO=true when calling the configure script.
>

this would result in info files not being built. If you are doing target
builds then lot of embedded distros dont install info files anyway


> My question is now: what is not working in that approach?
>
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
