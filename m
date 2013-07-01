From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 1 Jul 2013 09:21:05 -0400
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <51D155A0.3010205@gmail.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com>
Message-ID: <CA+-urNTkh1TVFQeb8Ovm-wVyc-Dcx-EH1m_UzAcmoLyqKiOkUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,


On Mon, Jul 1, 2013 at 6:10 AM, Zoltan Gyarmati
<mr.zoltan.gyarmati@gmail.com> wrote:
> Hello,
>
> checked the linked config from fhunleth, it seems in the used kernel
> tree (
> http://files.troodon-software.com/br/beagleboard-kernel-b37928553c8de3598d8a259d7ce5c4be713c2908.tar.xz
> ), the usb and the ethernet support is broken (or, as it always
> possible, i failed something).
>  So to get a working kernel, i used the patchset from
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8 ,
> ( which patches are extracted from the Angstrom build tree ), applied
> them manually on the mainline tree, created a tarball, and used that to
> build with Buildroot.
> So far everything works well (UART,USB host/gadget, ethernet, GPIO
> tested). I wondering, would it be possible to apply those subdir-style (
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8/patches )
> patches automatically in Buildroot on an elegant way? Or better to
> create a git tree with applied patches somewhere online and use that in
> Buildroot?

I had wanted to do the same thing and haven't found a way. However, I
did find that Robert Nelson maintains a super patch that combines all
of the patches that he puts into his kernel. When I compared his super
patch to what I had built from Angstrom, it looked nearly identical.
He had a couple modifications that looked minor.

His patch can be found at paths similar to:

http://rcn-ee.net/deb/sid-armhf/v3.8.13-bone22/patch-3.8.13-bone22.diff.gz

I just updated my Github repository to use the kernel.org 3.8.13
kernel and patch it with this patch. The board boots, but I've been so
busy the past week with work that I haven't had a chance to verify
that other things work.

FWIW, I found out about this patch by looking at how Arch Linux
handles the Beaglebone Black. They might have other insights.

Hope this helps,
Frank
