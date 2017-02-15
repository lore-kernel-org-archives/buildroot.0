From: Mylene Josserand <mylene.josserand@free-electrons.com>
Date: Wed, 15 Feb 2017 18:11:34 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Add
 patch to fix v1.19.1 with SIGIO
In-Reply-To: <CAAMH-yu0poOUNkxbAOAqQCzzEswHGTLBEACyUCsku+NRFGfUjg@mail.gmail.com>
References: <20170215091651.14484-1-mylene.josserand@free-electrons.com>
 <CAAMH-yu0poOUNkxbAOAqQCzzEswHGTLBEACyUCsku+NRFGfUjg@mail.gmail.com>
Message-ID: <7b7df9aa-e106-3663-985e-016248419df2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 15/02/2017 11:06, Gary Bisson wrote:
> Hi Myl?ne, All,
>
> On Wed, Feb 15, 2017 at 10:16 AM, Myl?ne Josserand
> <mylene.josserand@free-electrons.com> wrote:
>> The commit 6a5a4e60373c from xserver v1.19.1 removes SIGIO support for
>> input [1].
>>
>> The current patch coming from Open Embedded [2] removes a check of
>> 'useSIGIO'. This check was producing a segfault error while using
>> X11 and Vivante driver [3]. Thanks to Gary Bisson to point out this
>> patch!
>>
>> [1] https://cgit.freedesktop.org/xorg/xserver/commit/?id=6a5a4e60373c1386b311b2a8bb666c32d68a9d99
>> [2] https://patchwork.openembedded.org/patch/136696/
>> [3] http://lists.busybox.net/pipermail/buildroot/2017-February/183994.html
>>
>> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>
>> ---
>>  .../0003-Remove-check-for-useSIGIO-option.patch    | 47 ++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
>>
>> diff --git a/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
>> new file mode 100644
>> index 000000000..beed6cb4a
>> --- /dev/null
>> +++ b/package/x11r7/xserver_xorg-server/1.19.1/0003-Remove-check-for-useSIGIO-option.patch
>> @@ -0,0 +1,47 @@
>> +From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
>> +From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
>> +Date: Mon, 30 Jan 2017 16:32:06 -0600
>> +Subject: [PATCH] Remove check for useSIGIO option
>> +
>> +Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
>> +option.
>> +
>> +As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
>> +and OsReleaseSIGIO.
>> +
>> +No longer the check for useSIGIO is needed
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
>
> I think you need to add your SOB to the patch itself too:
> https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Ah yes, thank you for the review and the link. V2 is coming!

Best regards,

-- 
Myl?ne Josserand, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
