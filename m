From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 15 Sep 2014 23:44:52 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <20140915233916.55c17894@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr> <20140915233916.55c17894@free-electrons.com>
Message-ID: <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, Sep 15, 2014 at 11:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Mon, 15 Sep 2014 23:33:39 +0200, Yann E. MORIN wrote:
>
>> > Note that the removal of the two options should not break existing
>> > full .config, since the hidden option BR2_arm1136jf_s becomes again a
>> > visible option to select the CPU.
>>
>> But it would break a defconfig.
>
> Right. But I believe that when we change the default value of an
> option, we also break a defconfig, and we don't include that as part of
> the Config.in.legacy handling (but also because it's obviously more
> complicated).
>
>> As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
>> have it select BR2_arm1136jf_s, so the user can re-use a defconfig.
>
> Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?

This issue disappears if -march and -mtune are kept and -mcpu removed
as I suggested.

Regards,
Beno?t
