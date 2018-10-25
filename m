From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 Oct 2018 11:45:29 +0100
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support
 riscv targets yet
In-Reply-To: <5076b00f-364e-2d43-010c-324aeae5f2fa@embecosm.com>
References: <20181023214409.6818-1-ferdinand@ombud.nl>
 <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
 <20181024103637.487f6190@windsurf>
 <5076b00f-364e-2d43-010c-324aeae5f2fa@embecosm.com>
Message-ID: <CAKmqyKP274zJt4crwzEQqdPD8JSML1n9+5JNYCPTiMvCSEEMag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 24, 2018 at 9:41 AM Mark Corbin <mark.corbin@embecosm.com> wrote:
>
> Hello
>
> On 24/10/2018 09:36, Thomas Petazzoni wrote:
>
> Hello,
>
> +Mark Corbin in Cc.
>
> On Wed, 24 Oct 2018 01:24:09 +0100, Arnout Vandecappelle wrote:
>
> The upcoming version 3.3.0 will support riscv [1], so this patch would
> be temporary. Do we wait for that release, or should we explicitly
> disable libffi for riscv in the meantime?
>
> [1] https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3
>
> FYI, we already discussed the libffi/RISC-V situation during the
> Buildroot meeting last week end with Mark Corbin (who added the RISC-V
> 64 support). And I think he was working on backporting the RISC-V
> libffi support so that we can add it as a patch in Buildroot.
>
>
> I ran a quick diff and it didn't look like there are that many RISC-V changes to port. However, I probably won't get a chance to look at this until next week.

it is a big patch, but Yocto just has a single patch to add support:
https://github.com/riscv/meta-riscv/blob/master/recipes-support/libffi/files/0001-Add-riscv-support.patch

Alistair

>
> Regards
>
> Mark
>
> That being said...
>
>  Personally, I would be fine with doing this gradually, i.e. it is not needed to
> fix all 150 packages in a single commit. Indeed, the build is already broken
> anyway, so if this is shown as a circular dependency warning or as a build
> failure of libffi doesn't matter that much.
>
> ... I am indeed not opposed to fixing properly the libffi arch
> dependencies. It is true that with the autobuilders in place, we can do
> this gradually. It would be cleaner than the magic exception we have in
> the autobuilder script. The downside is that we will have for a fairly
> long time a significant number of autobuilder failures.
>
> Best regards,
>
> Thomas
>
>
> --
>
> Mark Corbin
> Embedded Operating Systems Lead
> Phone: +44 1590 610184     Mobile: +44 7765 703479
> Email: mark.corbin at embecosm.com     Web: https://www.embecosm.com
>
>
>
> Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41 9AL, UK
> Company No. 6577021 (England & Wales).
> --
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
