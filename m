From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Tue, 16 Sep 2014 00:36:48 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <20140915235030.57b47c34@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr> <20140915233916.55c17894@free-electrons.com>
 <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
 <20140915235030.57b47c34@free-electrons.com>
Message-ID: <CA+sos79y=8W5t9+0v8ahSg9F4VxdeJMnbacSS=2qevrDyPzV3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, Sep 15, 2014 at 11:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Beno?t Th?baudeau,
>
> On Mon, 15 Sep 2014 23:44:52 +0200, Beno?t Th?baudeau wrote:
>
>> >> As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
>> >> have it select BR2_arm1136jf_s, so the user can re-use a defconfig.
>> >
>> > Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?
>>
>> This issue disappears if -march and -mtune are kept and -mcpu removed
>> as I suggested.
>
> Do you have an example C code that doesn't generate the same assembly
> code between BR2_arm1136jf_s_r0 and BR2_arm1136jf_s_r1 ? It would be
> useful for my testing.

The instructions supported by armv6k but not by armv6j are:
ldrex{h|b|d}, strex{h|b|d}, clrex, nop, sev, wfe, wfi and yield. This
is especially useful for handwritten assembler implementations (in .S,
or inline in .c) of some OS functions, typically atomic operations and
context switches.

Beno?t
