From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 14 Oct 2013 11:21:53 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct
 endianness for the target
In-Reply-To: <20131014120543.267c23a7@skate>
References: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
 <20131014120543.267c23a7@skate>
Message-ID: <525BC5C1.3050705@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/14/13 11:05, Thomas Petazzoni wrote:
> Dear Markos Chandras,
>
> On Mon, 14 Oct 2013 10:52:25 +0100, Markos Chandras wrote:
>> +ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
>> +ifeq ($(BR2_ENDIAN),"LITTLE")
>
> If we're on mipsel or mips64el, we're always little endian, right? So
> maybe the test on BR2_ENDIAN isn't that useful? :-)

Oh right that makes sense...

>
>> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
>> +TOOLCHAIN_EXTERNAL_CFLAGS += -EL
>> +endif
>> +endif
>
> Should we do it for -EB as well? Or do we consider because the Sourcery
> toolchain defaults to big endian we don't need to explicit -EB ?

It's not necessary because the default is for big endian. But if you 
prefer to do that for the sake of consinstency I am fine with it :)

Peter can you fix this patch before you commit it or should I send a v2?

-- 
markos
