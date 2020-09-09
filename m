From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Wed, 9 Sep 2020 06:21:38 +0000
Subject: [Buildroot] [PATCH v2 5/6] package/uclibc: fix compilation
 errors
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-6-damien.lemoal@wdc.com>
 <20200908220627.GH14354@scaer> <20200909053851.GA3515@dell5510>
Message-ID: <CY4PR04MB37516038AB67C6E78FE9390AE7260@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/09 14:39, Petr Vorel wrote:
> Hi all,
> 
>> Damien, All,
> 
>> +Petr in Cc.
> 
>> Can you guys agree on a set of backports
> Damien, I also agree you should sent these two patches also to uclibc-ng mailing
> list (I haven't found them there).
> 
> I haven't checked the build on high range of archs (only risc64 and intel), but
> I suppose these additional two are needed.
> 
>> On 2020-09-08 20:33 +0900, Damien Le Moal spake thusly:
>>> Add four patches to fix compilation errors when building static no MMU
>>> uclibc. The first two patches are upstream uclibc patches on top of
>>> version 1.0.35 tag. The following two patches are added here as
>>> additional fixes.
> 
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>>  ...evert-Fix-static-linking-with-GCC-10.patch |  43 ++++++++
>>>  ...0002-fix-static-builds-with-gcc-10.x.patch |  25 +++++
>>>  ...-utils-getconf-Fix-compilation-error.patch | 103 ++++++++++++++++++
>>>  .../0004-librt-avoid-compilation-error.patch  |  42 +++++++
>>>  4 files changed, 213 insertions(+)
>>>  create mode 100644 package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>>>  create mode 100644 package/uclibc/0002-fix-static-builds-with-gcc-10.x.patch
>>>  create mode 100644 package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
>>>  create mode 100644 package/uclibc/0004-librt-avoid-compilation-error.patch
> 
>>> diff --git a/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>>> new file mode 100644
>>> index 0000000000..6adc827308
>>> --- /dev/null
>>> +++ b/package/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
>>> @@ -0,0 +1,43 @@
>>> +From e80384786d7b7f895c97f2447d4b91af8eb5f0f4 Mon Sep 17 00:00:00 2001
>>> +From: Waldemar Brodkorb <wbx@openadk.org>
>>> +Date: Wed, 2 Sep 2020 09:45:17 +0200
>>> +Subject: [PATCH 1/4] Revert "Fix static linking with GCC-10"
>>> +
>>> +This reverts commit 5b58a1ebd89a4f05778441814e81817c82193fa3.
>>> +
>>> +This breaks all static builds earlier to gcc 10 :(
>>> +Bad testing on my side.
> 
>> We need that the patches you backport carry your own sob-line, as well
>> as an pointer to upstream:
> 
>>     [Damien: backport from https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=e80384786d7b7f895c97f2447d4b91af8eb5f0f4]
>>     Signed-off-by: Your NAME <your@email>
> 
>> Applies to the secon backported patch as well.
> I'm sorry, I forget this in my patchset as well.
> 
> 
>> [--SNIP--]
>>> diff --git a/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
>>> new file mode 100644
>>> index 0000000000..2fc86d6161
>>> --- /dev/null
>>> +++ b/package/uclibc/0003-utils-getconf-Fix-compilation-error.patch
>>> @@ -0,0 +1,103 @@
>>> +From 684b80c97a38033cf0065537783ecf29bc2251ee Mon Sep 17 00:00:00 2001
>>> +From: Damien Le Moal <damien.lemoal@wdc.com>
>>> +Date: Mon, 7 Sep 2020 15:12:39 +0900
>>> +Subject: [PATCH 3/4] utils/getconf: Fix compilation error
> 
>> I would honestly prefer if you had split this Buildroot patch in two:
> 
>>   - one commit that backports the upstream uClibc-ng changes by
>>     Waldemar,
> 
>>  - one commit that adds your two new changes.
> 
>> Applying backported patches is a pretty trivial affair (I tend to just
>> verify that the referenced commit does exist, and this is very fast as I
>> have a lot of git trees on my local machine].
> 
>> But applying non-upstream commits usually undergo quite some more
>> scrutiny.
> 
> +1
> Damien, my patchset [1] is almost complete (containing these 2 patches only, missing links to the commits), but feel to sent additional patches to fix this (I sent [1] because I overlooked your patch).

OK. Please proceed. I will remove the two upstream patches from my patchset and
work on getting the other 2 in uclibc too. Doing so, the backporting in
buildroot will be more trivial.

There is also the elf2flt patch from Christoph that should go into uclinux-dev.
Will send that out too.

Sending everything out now.

Cheers.


-- 
Damien Le Moal
Western Digital Research
