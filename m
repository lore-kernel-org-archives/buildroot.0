From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Oct 2018 13:58:37 +0200
Subject: [Buildroot] [PATCH] package/clang: default linker to GNU
In-Reply-To: <CANQCQpa2_Y3G7kmRxQKod2QiLzqw67Q9OTPa4wppsftx-P+a7w@mail.gmail.com>
References: <1540112964-50052-1-git-send-email-matthew.weber@rockwellcollins.com>
 <ac3e5b76-9d38-d9af-5290-0675d72c9fe3@gmail.com>
 <CANQCQpa2_Y3G7kmRxQKod2QiLzqw67Q9OTPa4wppsftx-P+a7w@mail.gmail.com>
Message-ID: <2b56a55c-79ec-145c-26d7-b5f0532566ef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 21/10/2018 ? 13:53, Matthew Weber a ?crit?:
> Romain, Valentin,
> 
> On Sun, Oct 21, 2018 at 10:49 AM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Hi Matt,
>>
>> Adding Valentin in Cc.
>>
>> Le 21/10/2018 ? 11:09, Matt Weber a ?crit :
>>> By default clang is assuming the system linker /usr/bin/ld.  This
>>> patchset updates the default to point at the cross toolchain ld.
>>>
>>> Previously clang had been used on target only, this update is
>>> required for host clang/clang++ to be used as a frontend for
>>> cross-compiling.
>>
>> As we discuss during the meeting, we should probably wrap clang and clang++ in
>> order to pass the path to the sysroot like we do in the toolchain wrapper for
>> gcc (and other options when needed).
> 
> Since there isn't a package yet that has the need for this wrapper,
> would it be something that we could add to toolchain/helpers.mk?
> For this patch, maybe I just updated the commit message with and
> example of how you'd call clang w/o the wrapper?

Ok, It's fine for me.

Best regards,
Romain


> 
>>
>>>
>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>> ---
>>>  package/clang/clang.mk | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
>>> index 52e0b98..e2d4a08 100644
>>> --- a/package/clang/clang.mk
>>> +++ b/package/clang/clang.mk
>>> @@ -42,7 +42,8 @@ CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
>>>  HOST_CLANG_CONF_OPTS += \
>>>       -DCLANG_BUILD_EXAMPLES=OFF \
>>>       -DCLANG_INCLUDE_DOCS=OFF \
>>> -     -DCLANG_INCLUDE_TESTS=OFF
>>> +     -DCLANG_INCLUDE_TESTS=OFF \
>>> +     -DCLANG_DEFAULT_LINKER=$(TARGET_LD)
>>
>> I would put it with this line:
>> HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
>>
> 
> Sounds good.
> 
>> Otherwise:
>> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>>
>> Best regards,
>> Romain
>>
>>>
>>>  CLANG_CONF_OPTS += \
>>>       -DCLANG_BUILD_EXAMPLES=OFF \
>>>
>>
> 
> 
