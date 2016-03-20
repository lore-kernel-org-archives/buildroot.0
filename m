From: Zhangjian (Bamvor) <bamvor.zhangjian@huawei.com>
Date: Sun, 20 Mar 2016 21:10:07 +0800
Subject: [Buildroot] [PATCH V3 RESEND 0/5] Add ILP32 support in aarch64
In-Reply-To: <56B26D0A.3000906@gmail.com>
References: <1439428605-17453-1-git-send-email-bamvor.zhangjian@linaro.org>
 <569A60E6.2030108@gmail.com>
 <CAFy1UST4HUynS9ia2hRGWtE6j+XpYxaovAdVZkj+8yOG7PfSpg@mail.gmail.com>
 <569FFB7E.2000104@gmail.com>
 <CAFy1USRK1QDrruMk+icMqELL3MtFZv8KTkDvOHZ9wrAEWNvCJg@mail.gmail.com>
 <56A4B6F0.8080108@gmail.com> <56B014A7.2070808@huawei.com>
 <56B07114.9030404@gmail.com> <56B089D6.4070106@huawei.com>
 <56B09008.8030202@mind.be> <56B26D0A.3000906@gmail.com>
Message-ID: <56EEA12F.3040400@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Romain, Arnout, all

On 2016/2/4 5:11, Romain Naour wrote:
> Hello Bamvor, All,
>
> Le 02/02/2016 12:16, Arnout Vandecappelle a ?crit :
>> On 02-02-16 11:49, Zhangjian (Bamvor) wrote:
>>> Hi, Romain
>>>
>>> On 2016/2/2 17:04, Romain Naour wrote:
>>>> Hi Bamvor,
>>>>
>>>> Le 02/02/2016 03:29, Zhangjian (Bamvor) a ?crit :
>> [snip]
>>>>> You could this glibc[1]. IIRC, It is for patch v6 rfc2. We are planning to
>>>>> update it for patch v6 rfc5.
>>>>
>>>> Thanks for this link.
>
> The git tree from github doesn't build:
>
> ../sysdeps/aarch64/multiarch/memset.c: In function '__libc_memset_ifunc':
> ../sysdeps/aarch64/multiarch/memset.c:35:1: error: implicit declaration of
> function '__getauxval' [-Werror=implicit-function-declaration]
> libc_ifunc (__libc_memset,
>
>>>>
>>>> To be honest, I don't think this series will be merged as is until a stable
>>>> toolchain release is made.
>>> What's your mean stable toolchain? A toolchain release from a organization or
>>> company?
>>
>>   It means a release made by someone, not a random version from a git tree
>> somewhere. Basically something where people know where to send bug reports to.
>> This indeed usually means it's done by an organisation.
>
> At the beginning of this review I expected that it was easy to rebuild an IPL32
> toolchain using the abe script, but it's not the case.
>
>>
>>
>>> Do you think it will be accepted after patch of ilp32 of kernel and glibc
>>> upstream?
>>
>>   It doesn't necessarily mean that upstream has to have accepted it already. We
>> just prefer to have a release tarball.
>
> See as example the toolchains provided by Imagination Technologies [1] or
> Synopsys [2]. All their patches they are using may not upstream yet, but they
> provide a working toolchain which is pretty well tested.
>
> [1] http://codescape-mips-sdk.imgtec.com/components/toolchain/2015.06-05/
> [2] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/
In recent linaro connect, there is a presentation[1] about the performance of ilp32.
And in its homepage[2], there is a script[3] for building the ilp32 compiler.
At this pointer, are you intertested in review the patches of ilp32 if I send a new
series?

Regards

Bamvor

[1] http://connect.linaro.org/resource/bkk16/bkk16-305b/
[2] https://wiki.leapproject.ca/index.php?title=AArch64_ILP32_Toolchain
[3] https://github.com/leapproject/ilp32-toolchain/blob/master/build_ilp32_toolchain.sh

>
>>
>>   Regards,
>>   Arnout
>>
>>> I am trying to improve the glibc support for ilp32 base on the exist one
>
> I understand, that's great.
>
> Best regards,
> Romain
>
>>
>>>> When it's done, can you respin your series on top of
>>>> master since the toolchain-external code has been updated recently ?
>>> Yes, of course.
>>>
>>
>> [snip]
>>
>>
