From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 23:35:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libqmi: add Libs.Private to
 qmi-glib.pc
In-Reply-To: <CAPi7W82LVWwt6AOByCsKtuu5CcY6dJJ2P3qayezbMwrX0qSKpA@mail.gmail.com>
References: <20191030084048.11194-1-fontaine.fabrice@gmail.com>
 <ae52396b-25b3-f269-1108-1f6f83a2c45f@benettiengineering.com>
 <CAPi7W82LVWwt6AOByCsKtuu5CcY6dJJ2P3qayezbMwrX0qSKpA@mail.gmail.com>
Message-ID: <1b10c8a1-a19f-4446-0bb3-772e3b96e1e9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 12/20/19 11:34 PM, Fabrice Fontaine wrote:
> Hi Giulio,
> 
> Le ven. 20 d?c. 2019 ? 21:12, Giulio Benetti
> <giulio.benetti@benettiengineering.com> a ?crit :
>>
>> Hi Fabrice,
>>
>> On 10/30/19 9:40 AM, Fabrice Fontaine wrote:
>>> This will fix a static build failure with modem-manager and libmbim
>>>
>>> Fixes:
>>>    - http://autobuild.buildroot.org/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c
>>
>> I can't reproduce this build failure and so can't test your patch to fix
>> it. Basically it builds correctly.
>> Can you double check?
> As specified in https://patchwork.ozlabs.org/patch/1208297, this patch
> is not needed anymore as it has been merged upstream and is already
> included in 1.24.2 (see
> https://gitlab.freedesktop.org/mobile-broadband/libqmi/blob/1.24.2/data/pkg-config/qmi-glib.pc.in)

I've missed that patch.

> so I set it to Not Applicable in patchwork.

Ok, thank you.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>>
>> Thank you
>> Best regards
>> --
>> Giulio Benetti
>> Benetti Engineering sas
> Best Regards,
> 
> Fabrice
>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>    ...0001-qmi-glib.pc.in-add-Libs.Private.patch | 31 +++++++++++++++++++
>>>    1 file changed, 31 insertions(+)
>>>    create mode 100644 package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch
>>>
>>> diff --git a/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch b/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch
>>> new file mode 100644
>>> index 0000000000..46f32baab4
>>> --- /dev/null
>>> +++ b/package/libqmi/0001-qmi-glib.pc.in-add-Libs.Private.patch
>>> @@ -0,0 +1,31 @@
>>> +From c816e407b974f72d45f1878427cbeea448b3477a Mon Sep 17 00:00:00 2001
>>> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> +Date: Wed, 30 Oct 2019 09:29:59 +0100
>>> +Subject: [PATCH] qmi-glib.pc.in: add Libs.Private
>>> +
>>> +Add @MBIM_LIBS@ to Libs.Private in qmi-glib.pc.in so applications
>>> +linking statically with qmi-glib (such as modem-manager) will retrieve
>>> +these dependencies
>>> +
>>> +Fixes:
>>> + - http://autobuild.buildroot.org/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c
>>> +
>>> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> +[Upstream status:
>>> +https://gitlab.freedesktop.org/mobile-broadband/libqmi/merge_requests/75]
>>> +---
>>> + data/pkg-config/qmi-glib.pc.in | 1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +diff --git a/data/pkg-config/qmi-glib.pc.in b/data/pkg-config/qmi-glib.pc.in
>>> +index d334494..1d5054f 100644
>>> +--- a/data/pkg-config/qmi-glib.pc.in
>>> ++++ b/data/pkg-config/qmi-glib.pc.in
>>> +@@ -9,3 +9,4 @@ Version: @VERSION@
>>> + Requires: glib-2.0 gobject-2.0 gio-2.0
>>> + Cflags: -I${includedir}/libqmi-glib
>>> + Libs: -L${libdir} -lqmi-glib
>>> ++Libs.Private: @MBIM_LIBS@
>>> +--
>>> +2.23.0
>>> +
>>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
