From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 25 Oct 2020 15:20:20 -0400
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-24
In-Reply-To: <5f953346.1c69fb81.165c0.af3fSMTPIN_ADDED_MISSING@mx.google.com>
References: <5f953346.1c69fb81.165c0.af3fSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CANxTyt5x_n89F=t68_hSuXWbN++QR-OCN6ae4K=rvp8=PU0Giw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 25, 2020 at 4:11 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arc      |         xinetd-2-3-15          | http://autobuild.buildroot.net/results/58351bac7a4373baf2bd6cfdafcfa91e11d4132e

This error is happening because glibc-2.32 dropped support for
--enable-obsolete-rpc, which means that the glibc/Config.in line
selecting BR2_TOOLCHAIN_HAS_NATIVE_RPC is invalid for the
configurations that select a 2.32-x version.  The build breakdown can
be avoided by conditioning the selection of
BR2_TOOLCHAIN_HAS_NATIVE_RPC on !BR2_arc && !BR2_RISCV_32 (i.e. the
cases currently selecting 2.32-x), but it seems like we can ignore the
breakdown knowing that eventually the transition to 2.32 will happen
and the BR2_TOOLCHAIN_HAS_NATIVE_RPC will have to be removed entirely.
(There is already an email thread in this month proposing the update
of the 2.31-x setup to 2.32-x.)

Regards,
Danomi -


>
>
> --
> http://autobuild.buildroot.net
