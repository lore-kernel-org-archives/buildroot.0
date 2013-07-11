From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 11 Jul 2013 12:22:32 +0100
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <CAAXf6LVN60LcoCDooO8N7wj_N-CRASJbofxk_LDi1qEdkXuaMA@mail.gmail.com>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
 <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
 <20130711125908.55bcb3b3@skate>
 <CAG2jQ8ikuHv=zgoRN3Y6pyyGo8E49taW6M1ZMfbv6+xQ8r58cg@mail.gmail.com>
 <CAAXf6LVN60LcoCDooO8N7wj_N-CRASJbofxk_LDi1qEdkXuaMA@mail.gmail.com>
Message-ID: <CAG2jQ8iHKiuRCGvMPOpgqmXdAuYgzJP6C4+CGq=dUz6p6JMTJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 July 2013 12:18, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Thu, Jul 11, 2013 at 1:08 PM, Markos Chandras
> <markos.chandras@gmail.com> wrote:
>> On 11 July 2013 11:59, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear Thomas De Schampheleire,
>>>
>>> On Thu, 11 Jul 2013 11:24:51 +0200, Thomas De Schampheleire wrote:
>>>
>>>> We are doing a similar thing from our post-build script, on a
>>>> Cavium-based MIPS64 n32 ABI, so I'm definitely in favor of this patch.
>>>>
>>>> I'm not sure though if the $(BUILD_DIR)/.root rule is the best place
>>>> to put this, it seems a bit odd in my opinion.
>>>
>>> This thing is really toolchain related, so I believe it should be the
>>> responsibility of the respective toolchain backends to take care of
>>> this, whenever needed.
>>>
>>
>> So would you prefer to move this code to package/gcc/gcc.mk ?
>>
>
> Are you experiencing this problem with a toolchain built via buildroot?
> In my case, it is with an external toolchain, so package/gcc/gcc.mk
> isn't used then.

Yeah you are correct. This problem is not specific to buildroot
toolchains that's why I added
the fix in the root Makefile.

--
Regards,
Markos Chandras
