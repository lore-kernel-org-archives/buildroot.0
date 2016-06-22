From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 22 Jun 2016 11:27:50 -0400
Subject: [Buildroot] [PATCH] erlang: enable compilation on mipsel
In-Reply-To: <20160622090125.727d9c7b@free-electrons.com>
References: <1466527613-31459-1-git-send-email-fhunleth@troodon-software.com>
 <20160622090125.727d9c7b@free-electrons.com>
Message-ID: <CA+-urNTSfA7tC8VqHtjAyqC88UHXgs5W9VuVrLhzP-T9oM7jwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jun 22, 2016 at 3:01 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Tue, 21 Jun 2016 12:46:53 -0400, Frank Hunleth wrote:
> > Erlang works fine on mipsel platforms so add it to the supported list.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >
> > As a side note, one would hope that Erlang would work fine on mips, mips64
> > and mipsel64, but I haven't found documentation of this yet and I can't
> > verify it myself on real hw.
>
> We have very good Qemu defconfigs in Buildroot, for all of mips,
> mipsel, mips64el and mips64:
>
> $ ls -1 configs/qemu_mips*
> configs/qemu_mips64el_malta_defconfig
> configs/qemu_mips64_malta_defconfig
> configs/qemu_mipsel_malta_defconfig
> configs/qemu_mips_malta_defconfig
>
> These allow to very easily test things on those architectures even when
> hardware is not available.
>
> Note that I'm not saying that you *have* to test Erlang on all those
> architectures, I'm perfectly fine with enabling it on mipsel today, and
> enabling it later on other architectures when people need that. I just
> wanted to take this opportunity to mention the Qemu defconfigs, that
> are very regularly maintained and updated by Gustavo.

Good point. I have found the qemu configs to be really useful in
verifying that projects build and for simple testing. My stumbling
block has been that many of the interesting things that I want to try
out with Erlang require it to act like a server. For that to work, I
would need to start qemu so that it has its own IP address and that
Erlang can bind to an externally visible port. I know that this is
possible, but I've struggled with the qemu docs enough that I've
always gone to real hardware for testing. I realize that this is now
completely off topic, but if someone knows of a step-by-step way of
setting this up for a BR qemu config, I'd try again. (Yes - I've seen
the Arch wiki qemu docs)

Best regards,
Frank
