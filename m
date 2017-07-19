From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 19 Jul 2017 15:17:21 -0700
Subject: [Buildroot] [PATCH 00/20] system: properly handle systemd as
	init system
In-Reply-To: <20170719225332.560a9a06@windsurf>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <CAAkeqgVMVSspUdMnPNWi_RQyLPhyf-1bys=d2btKrStEk34VMg@mail.gmail.com>
 <20170719225332.560a9a06@windsurf>
Message-ID: <CAAkeqgWk1ywyCT027eGPtXfQO_qd5b7dEJSOZek8eMx1R1Ey+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 19, 2017 at 1:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 19 Jul 2017 13:14:58 -0700, Andrey Yurovsky wrote:
>
>> For what it's worth,
>>
>> Tested-by: Andrey Yurovsky <yurovsky@gmail.com>
>>
>> using some in-house configs (armv5 and armv7) with and without
>> systemd-networkd, verified journald functionality and the state of
>> /var and so on.
>
> Thanks a lot for testing, very useful to get some feedback!
>
> Can you confirm that it fixes the journald issue reported in bug
> https://bugs.busybox.net/show_bug.cgi?id=7892 ?

It does.

> Also, it would be useful if someone interested in systemd could look at
> bugs https://bugs.busybox.net/show_bug.cgi?id=9881 and

I did an ARMv7 build with networkd+resolvd and couldn't reproduce the
described problem with these patches applied. /etc/resolv.conf points
to ../tmp/resolv.conf which in turn is properly populated and names do
resolve. systemd-hostnamed is acting like it does on Fedora (for what
it's worth), I'm still learning about how to test it properly (that
is, I just have a static hostname at the moment).

> https://bugs.busybox.net/show_bug.cgi?id=9926.

Ok, I'll do a clean rebuild without networkd and with NetworkManager.

> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
