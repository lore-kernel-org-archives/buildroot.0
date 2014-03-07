From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 11:19:26 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAB0FRsvxcXs0ZvjZVzcQw0S=v6Rx5tCqSq_LaHZDCwe1d6a84g@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <CAB0FRsvxcXs0ZvjZVzcQw0S=v6Rx5tCqSq_LaHZDCwe1d6a84g@mail.gmail.com>
Message-ID: <CAHkwnC_ixC+dE_Xy7iB8wRvfu53YYFNiRwbwkHvKhCNKCYhoxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 6, 2014 at 9:51 PM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
> 2014-03-06 11:43 GMT+01:00 Fabio Porcedda <fabio.porcedda@gmail.com>:
>> Hi all,
>> luajit fails to build on a Ubuntu 13.10 x86_64 with the following defconfig:
>>
>> BR2_x86_generic=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_LUAJIT=y
>>
>>
>> with the following build error:
>>
>> CC        luajit.o
>> HOSTLINK  host/minilua
>> /usr/bin/ld: skipping incompatible
>> /usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc.a when searching for -lgcc
>> /usr/bin/ld: cannot find -lgcc
>> /usr/bin/ld: skipping incompatible
>> /usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc_s.so when searching for
>> -lgcc_s
>> /usr/bin/ld: cannot find -lgcc_s
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [host/minilua] Error 1
>> make[2]: *** [amalg] Error 2
>> make[1]: *** [amalg] Error 2
>> make: *** [/e/buildroot/br-tmp/output/build/luajit-2.0.2/.stamp_built] Error 2
>>
>>
>> It builds fine for x86_64:
>> BR2_x86_64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_LUAJIT=y
>>
>> Best regards
>
> When Ubuntu 13.10 was released, I encoured many issues with it (but I
> don't remember details and I didn't make investigations), so I stay
> with 12.04 LTS. And now, I wait for 14.04 LTS.
>
> Do you see this issue with BR-2014.02 or with the master head (the 3
> lastest commits are mine) ?

I saw the error with master and all 2013.XX and 2014.02 releases.
As explained by Yann the error is not related to Ubuntu.

Regards
-- 
Fabio Porcedda
