From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 25 Oct 2015 21:52:55 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <87pp02heb2.fsf@dell.be.48ers.dk>
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <877fmaixqa.fsf@dell.be.48ers.dk>
 <CA+sos7-joVOt2bNGPv31uM=t1CmfW=eCyTjHuH-qu2h25O=fSw@mail.gmail.com>
 <87pp02heb2.fsf@dell.be.48ers.dk>
Message-ID: <CA+sos78tx8Yh4DKjwtHte7E7TuixNfTnT6QgFUy2ffN-iqKa-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 25, 2015 at 9:40 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:
>
>  > On Sun, Oct 25, 2015 at 7:55 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:
>  >>
>  >> > Set EABIhf as the default target ABI for the ARM processors that have or
>  >> > may have a VFP unit, since this ABI is the most efficient in that case.
>  >> > Of course, EABI can still be selected manually if needed.
>  >>
>  >> On a related note, should we default to thumb2 if the CPU supports it?
>
>  > I would say:
>
>  >     choice
>  >            prompt "ARM instruction set"
>  >            default BR2_ARM_INSTRUCTIONS_ARM if BR2_ARM_CPU_HAS_ARM
>  >            default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2
>  >            default BR2_ARM_INSTRUCTIONS_THUMBS if BR2_ARM_CPU_HAS_THUMBS
>
> I'm not sure it makes sense to default to thumb1 even if the CPU
> supports it because of various compatibility issues

It's the first default that wins, not the last one, so above it's ARM
over Thumb1.

> - So simply:
>
> default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2
>
> (if no thumb2 is available, the first available option (ARM) is used).

With ARM + Thumb2, I would rather use ARM to avoid compatibility
issues, except on platforms very constrained on memory. On Cortex-M3,
there's not even ARM. Or is it common to use Thumb2 on bigger
platforms like Cortex-A*?

Best regards,
Beno?t
