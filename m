From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2016 13:05:33 -0700
Subject: [Buildroot] [PATCH] ipkg: fix ARM MMU-less build
In-Reply-To: <20160726211732.13c7836d@free-electrons.com>
References: <5593192e371e7a40e09e9b0189f3bfb2432a0e67.1469536052.git.baruch@tkos.co.il>
 <1785552C-C8C3-485A-92F2-11EBD2127B8E@gmail.com>
 <20160726211732.13c7836d@free-electrons.com>
Message-ID: <CAMKF1soYa2Gv+Ppkfv7=nXXuRV_h+ebcB9nyxUVUJe_RLcZoUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 26, 2016 at 12:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 26 Jul 2016 11:14:16 -0700, Khem Raj wrote:
>> > On Jul 26, 2016, at 5:27 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>> >
>> > The code incorrectly tests for __ARCH_HAS_MMU__ which is true for the ARM
>> > architecture, instead of __ARCH_USE_MMU__ which applies to this specific
>> > build. Add a patch making direct use of HAVE_FORK that configure defines when
>> > fork() is detected.
>> >
>> > Fixes:
>> > http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
>> > http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
>> > http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/
>> >
>> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> > ---
>> > package/ipkg/0002-fix-arm-nommu.patch | 22 ++++++++++++++++++++++
>>
>>
>> ipkg has been superceded by opkg. May be it should just be removed?
>
> Agreed. I'm hesitating between removing entirely, or marking as
> deprecated.

Just remove it, I don't think it is used anywhere these days.
