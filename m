From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 10:08:57 +0000
Subject: [Buildroot] [PATCH v2] qt5base: fix compilation error with
 gcc-4.8
In-Reply-To: <20170309213242.44a74371@free-electrons.com>
References: <20170309170315.18299-1-Vincent.Riera@imgtec.com>
 <20170309213242.44a74371@free-electrons.com>
Message-ID: <f9db6a2d-ad1c-ccac-a9db-48402107c71e@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/03/17 20:32, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 9 Mar 2017 17:03:15 +0000, Vicente Olivert Riera wrote:
>> Add a patch to fix a compilation error when using gcc-4.8.
>>
>> Bug report: https://bugreports.qt.io/browse/QTBUG-59399
>> Patch sent upstream: https://codereview.qt-project.org/#/c/187980/
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/2ac/2ac16335d16cd53cceeabda8f963c9b288a9a1c8/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I've applied, but after changing the formatting of the patch, see below.
> 
>> diff --git a/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
>> new file mode 100644
>> index 0000000..c05388d
>> --- /dev/null
>> +++ b/package/qt5/qt5base/5.8.0/0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch
>> @@ -0,0 +1,71 @@
>> +QAtomic: pass explicit failure mode to std::atomic::compare_exchange_strong
>> +
>> +This patch fixes a compilation error when building qt5base with gcc-4.8.
>> +
>> +Bug report: https://bugreports.qt.io/browse/QTBUG-59399
>> +Patch sent upstream: https://codereview.qt-project.org/#/c/187980/
>> +
>> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.org>
> 
> All this stuff should go...
> 
>> +
>> +From c5d7425f8ad391112758db161e3e08f18dc9d299 Mon Sep 17 00:00:00 2001
>> +From: Marc Mutz <marc.mutz@kdab.com>
>> +Date: Thu, 26 May 2016 08:30:26 +0200
>> +Subject: [PATCH] QAtomic: pass explicit failure mode to
>> + std::atomic::compare_exchange_strong
>> +
>> +... in an attempt to avoid GCC 4.8 errors such as
>> +
>> +  bits/atomic_base.h:577:70: error: failure memory model cannot be stronger than success memory model for '__atomic_compare_exchange'
>> +  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);
>> +                                                                      ^
>> +
>> +as seen on Android.
>> +
>> +Change-Id: If046e735888cf331d2d6506d8d5ca9aa7402f9ad
> 
> ... here.
> 
> Otherwise, the patch can no longer be applied by Git using git am,
> which makes the fact of having Git formatted patches pretty useless.

Oh, I see. Thanks, I'll remember that for the next time :-)

Vincent

> 
> Thanks a lot for chasing and fixing this issue!
> 
> Thomas
> 
