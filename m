From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 30 Nov 2016 16:22:42 -0800
Subject: [Buildroot] [PATCH] package/xen: fix build failure on x86 after
 bump to 4.7
In-Reply-To: <20161101145415.6f9dbad5@free-electrons.com>
References: <1477989452-26462-1-git-send-email-yann.morin.1998@free.fr>
 <20161101145415.6f9dbad5@free-electrons.com>
Message-ID: <CAKmqyKOzeQUtaGGVWUokwJ1koim=HhrOm_+21P893oiH5XJ=Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 1, 2016 at 6:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  1 Nov 2016 09:37:32 +0100, Yann E. MORIN wrote:
>> Since the bump to 4.7, Xen fails to build because of a double definition
>> of __OBJECT_FILE__. This is due to (who would have guessed) the weirdness
>> of their buildsystem.
>>
>> Fix that with a dirty hack: undefine the macro before defining it.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> [Alistair: Tested on ARMv7 (little endian) boot.]
>> Tested-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 ++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
>
> This is indeed not the prettiest solution, but it's good enough. Has
> one of you reported the problem upstream to the Xen people?

Sorry about the radio silence here, I was away for a bit and then super busy.

If it's ok with you Yann I was planning on sending the two Xen patches
we have to mainline Xen and at least see what they think about this
issue. I don't have a huge amount of experience with them so I'm not
sure if they are interested in this, but I figured it is worth a try
anyway.

Thanks,

Alistair

>
> I've applied Yann's patch anyway.
>
> Thanks a lot for the investigation and workaround!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
