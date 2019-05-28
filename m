From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 28 May 2019 22:44:11 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libubootenv: fix build
 with musl and static lib
In-Reply-To: <20190526210539.52863351@windsurf>
References: <1558542756-8919-1-git-send-email-pjtexier@koncepto.io>
 <20190526210539.52863351@windsurf>
Message-ID: <b68fd2d1-301d-d2cc-66b1-26a43a6e137c@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 26/05/2019 ? 21:05, Thomas Petazzoni a ?crit?:Fixes:
> Thanks for the patch. I have applied to next, but a few things were not
> completely perfect.
>
> First of all, this patch is fixing two separate build issues, which
> require separate libubootenv patches. So it should have been two
> Buildroot patches.

Thanks for the feedback.
>
>>   ...sts.txt-do-not-force-the-build-of-a-share.patch | 46 ++++++++++++++++++++++
>>   .../0001-uboot_env-fix-build-with-musl-libc.patch  | 31 +++++++++++++++
>>   ...nv-fix-compilation-for-glibc-version-2.28.patch | 40 +++++++++++++++++++
>>   3 files changed, 117 insertions(+)
>>   create mode 100644 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
>>   create mode 100644 package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
> You create two patches named 0001, and there was already one, so the
> numbering was no longer correct.

Indeed, it is true that I forgot to pay attention to this.
I'll be more vigilant next time.

Regards

Pierre-Jean
>
>> diff --git a/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch b/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
>> new file mode 100644
>> index 0000000..605b40a
>> --- /dev/null
>> +++ b/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
>> @@ -0,0 +1,31 @@
>> +From 113a4ea9ec48b9428b3abac21ecca7d8f11502fe Mon Sep 17 00:00:00 2001
>> +From: Pierre-Jean Texier <pjtexier@koncepto.io>
>> +Date: Tue, 21 May 2019 21:32:27 +0200
>> +Subject: [libubootenv][PATCH 1/2] uboot_env: fix build with musl libc
> Please generate patches with "git format-patch -N" to avoid the "x/y"
> in "PATCH x/y". Indeed, this 1/2 doesn't make sense: this patch is in
> fact part of a series of 4 patches!
>
> Best regards,
>
> Thomas
