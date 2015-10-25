From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:40:49 +0100
Subject: [Buildroot] [PATCH] arch/arm: use EABIhf by default with VFP
In-Reply-To: <CA+sos7-joVOt2bNGPv31uM=t1CmfW=eCyTjHuH-qu2h25O=fSw@mail.gmail.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Sun, 25 Oct
 2015 21:27:36 +0100")
References: <87k2qn6gf0.fsf@dell.be.48ers.dk>
 <1445786380-2741-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <877fmaixqa.fsf@dell.be.48ers.dk>
 <CA+sos7-joVOt2bNGPv31uM=t1CmfW=eCyTjHuH-qu2h25O=fSw@mail.gmail.com>
Message-ID: <87pp02heb2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:

 > On Sun, Oct 25, 2015 at 7:55 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
 >>>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> writes:
 >> 
 >> > Set EABIhf as the default target ABI for the ARM processors that have or
 >> > may have a VFP unit, since this ABI is the most efficient in that case.
 >> > Of course, EABI can still be selected manually if needed.
 >> 
 >> On a related note, should we default to thumb2 if the CPU supports it?

 > I would say:

 >     choice
 >            prompt "ARM instruction set"
 >            default BR2_ARM_INSTRUCTIONS_ARM if BR2_ARM_CPU_HAS_ARM
 >            default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2
 >            default BR2_ARM_INSTRUCTIONS_THUMBS if BR2_ARM_CPU_HAS_THUMBS

I'm not sure it makes sense to default to thumb1 even if the CPU
supports it because of various compatibility issues - So simply:

default BR2_ARM_INSTRUCTIONS_THUMBS2 if BR2_ARM_CPU_HAS_THUMBS2

(if no thumb2 is available, the first available option (ARM) is used).

-- 
Venlig hilsen,
Peter Korsgaard 
