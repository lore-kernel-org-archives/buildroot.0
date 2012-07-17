From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 17 Jul 2012 10:07:21 +0200
Subject: [Buildroot] [PATCH] luajit: new package
In-Reply-To: <20120715200056.390b3d03@skate>
References: <20120715004755.4cc159e9@skate>
 <1342306252-19152-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAB0FRsv-bQnLUZvq_8xm4CkQsbxF3z6quUW5jwGhhbr0KK6nZQ@mail.gmail.com>
 <20120715200056.390b3d03@skate>
Message-ID: <CAB0FRsv1Xq-rDK++oQJXOC-EUuh2b4_y-b=AbSTUsrSFx8wNQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/15 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Sun, 15 Jul 2012 19:19:03 +0200,
> Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :
>
>> -Wl,-rpath,/home/user/build/qarm/host/usr/lib" -C
>> /home/user/build/qarm/build/luajit-2.0.0-beta10 amalg
>> /usr/bin/make: invalid option -- '3'
>> /usr/bin/make: invalid option -- '2'
>>
>> so, I remove extra quote :
>> ifeq ($(BR2_ARCH_IS_64),y)
>> LUAJIT_HOST_CC=$(HOSTCC)
>> else
>> LUAJIT_HOST_CC=$(HOSTCC) -m32
>> endif
>
> Hum, yes, this part was a last-minute addition, which was wrong
> apparently. But this doesn't answer my initial question: it is not
> possible to build luajit for a 64 bits architecture on a 32 bits host.
> If this isn't solved, we can't include luajit as is.
>
>> and the build command could be rewrite with CROSS :
>> define LUAJIT_BUILD_CMDS
>>       $(MAKE) PREFIX="/usr" \
>>               HOST_CC="$(LUAJIT_HOST_CC)" \
>>               CROSS="$(TARGET_CROSS)" \
>>               -C $(@D) amalg
>> endef
>
> No, using TARGET_CROSS directly doesn't work when ccache is enabled.
> ccache is only used in TARGET_CC and TARGET_CXX, that's why I've done
> this this way.
>
> Can you look at the bitness problem?

see http://www.freelists.org/post/luajit/crosscompiling-with-different-bitness

Fran?ois.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
