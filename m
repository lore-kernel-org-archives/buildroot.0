From: Martin Bark <martin@barkynet.com>
Date: Mon, 16 May 2016 13:23:44 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-05-13
In-Reply-To: <20160516131538.70d77f39@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <CAFGQKxf_m8c_u4j5_RKwLvKog3HC=mmAzqv-L3LJqX-tgbCL8w@mail.gmail.com>
 <20160516131538.70d77f39@free-electrons.com>
Message-ID: <CAFGQKxdxSt8LBiipFExEE1KYY+DN_njddHCk0vDMyrK0Eg-2RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomans,

On 16 May 2016 at 12:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 16 May 2016 11:19:20 +0100, Martin Bark wrote:
>
>> >>          arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/55a7db5c0cbc34bbf6a2cbc52713d8822deec5b2/
>> >
>> > Some static linking issue. Martin, you already did some work on
>> > iputils, can you have a look?
>>
>> It's an issue with static builds and using libgcrypt.  I've submitted
>> a pull request to fix the issue (see
>> https://github.com/iputils/iputils/pull/50).  Last time i submitted a
>> pull request the author of iputils was very quick to merge my changes
>> so I'll wait to see what happens before i submit any changes to
>> buildroot.
>
> And indeed, it has been merged half an hour ago. However, I'm wondering
> why you have not used pkg-config instead. The drawback of -lgcrypt
> -lgpg-error is that now, even in dynamic linking situations, the
> iputils binary has a direct reference to libgpg-error.

yes my first thought was to use libgrypt-config but in the end I
decided to keep it simple because iputils only has a basic Makefile
with no configure script.  It's the same situation we had with linking
against the libm.  I going to asking the maintainer if they would
accept a change to add a cmake or autotools build system so solve this
kind of issue neatly.

Thanks

Martin

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
