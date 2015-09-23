From: Gergely Imreh <imrehg@gmail.com>
Date: Wed, 23 Sep 2015 23:26:09 +0800
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
 linux compilation error
In-Reply-To: <20150922154716.0c3fec44@free-electrons.com>
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
 <20150922154716.0c3fec44@free-electrons.com>
Message-ID: <CAJ3iQcrqXVz0Fu88pLdszq_WBxqa4eG1n0StGoFnMYmLYM0P2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 September 2015 at 21:47, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 22 Sep 2015 10:45:21 +0800, imrehg at gmail.com wrote:
>> From: Gergely Imreh <imrehg@gmail.com>
>>
>> Replace the "timeconst" perl script with a bc script to fix an
>> error due to syntax changes in perl which resulted in linux
>> compilation error for the wandboard's 3.8 kernel. The patch is
>> backported, kernels from 3.9 onward already have this change.
>>
>> Signed-off-by: Gergely Imreh <imrehg@gmail.com>
>
> The problem with this patch is that it fixes the problem specifically
> for the wandboard_defconfig. Any other person building another kernel
> version affected by the same problem will face the problem.
>
> If the problem is serious, I don't really see another option than
> having some logic in linux.mk to detect if the kernel is affected by
> the problem, and replacing the perl script by a bc script.
>
> Other ideas?

At cursory glance, this should affect every kernel before 3.9 (when it
was switched to bc script), please correct me if I'm wrong.

On the other hand, looking at this patch, it appears to need more
backporting than the original single line of perl fix, and likely not
very portable (because of touching the Makefile). The other one one is
simple and very well defined. I'd probably start from that patch if
large variety of unknown kernel versions need to be potentially fixed.

But this is just a thought.

Cheers,
  Gergely

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
