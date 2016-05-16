From: Martin Bark <martin@barkynet.com>
Date: Mon, 16 May 2016 16:01:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-05-13
In-Reply-To: <20160516164336.3f794389@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <CAFGQKxf_m8c_u4j5_RKwLvKog3HC=mmAzqv-L3LJqX-tgbCL8w@mail.gmail.com>
 <20160516131538.70d77f39@free-electrons.com>
 <CAFGQKxdxSt8LBiipFExEE1KYY+DN_njddHCk0vDMyrK0Eg-2RA@mail.gmail.com>
 <20160516145031.7ac19309@free-electrons.com>
 <CAFGQKxf8GyqxVOE3cuOyb8fj_Fv3X4Jt4ue=HeWL151Ak-V3DA@mail.gmail.com>
 <20160516164336.3f794389@free-electrons.com>
Message-ID: <CAFGQKxeKROKaBySfCN5a1CTsHVR5mN-E5ZyJi16gxq-R1AkLMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 16 May 2016 at 15:43, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 16 May 2016 15:34:20 +0100, Martin Bark wrote:
>
>> > Well, going all the way to autotools or cmake is not really necessary
>> > to solve these problems. You can just call pkg-config from a Makefile:
>> >
>> > LDFLAGS = $(shell pkg-config --libs libgcrypt)
>> >
>> > and that's it. No?
>>
>> gcrypt has it's owm libgrypt-config so you need something like
>>
>> GCRYPT_CONFIG?=libgrypt-config
>> LDFLAG_GCRYPT=$(shell $(GCRYPT_CONFIG) --libs)
>>
>> However, libgcrypt-config --libs always returns -lgcrypt -lgpg-error
>> so this method does not save you linking against libgpg-error.  Given
>> the iputils Makefile does not currently use anything like pkg-config
>> or libgcrypt-config i decided on the simpler method.
>
> Gaah, OK. Then, yes your patch is the simplest solution. I thought
> libgcrypt had pkg-config support, but it does not.
>
> Will you send a Buildroot patch that backports the upstream-accepted
> contribution you have made?

Yes i was just holding off in case you wanted any changes.  I've just
submitted a patch to bump the iputils version and checked it fixes
several of the autobuild errors,

Thanks

Martin

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
