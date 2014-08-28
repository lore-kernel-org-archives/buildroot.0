From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 28 Aug 2014 23:31:42 +0200
Subject: [Buildroot] [PATCH 2/3] package/libinput: fix build with
	libevdev
In-Reply-To: <53FC4FCA.3030307@imgtec.com>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>	<1408899186-28542-2-git-send-email-romain.naour@openwide.fr>
 <20140825201244.000a638b@free-electrons.com> <53FBA434.1000401@openwide.fr>
 <53FC4FCA.3030307@imgtec.com>
Message-ID: <53FF9FBE.9020605@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 26/08/2014 11:13, Vicente Olivert Riera a ?crit :
> On 08/25/2014 10:01 PM, Romain Naour wrote:
>> Hi Thomas,
>>
>> Le 25/08/2014 20:12, Thomas Petazzoni a ?crit :
>>> Dear Romain Naour,
>>>
>>> On Sun, 24 Aug 2014 18:53:05 +0200, Romain Naour wrote:
>>>> libevdev and libinput use the same function name (log_msg).
>>>> An easy fix is to rename one of the two functions.
>>>>
>>>> Fixes:
>>>> http://autobuild.buildroot.net/results/b1e/b1ea94f09d6f7459e3d7794c4a62bbdbb53d5da6/build-end.log
>>>>
>>>>
>>>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>>> ---
>>>>   ...put-01-rename-log_msg-to-libinput_log_msg.patch | 58
>>>> ++++++++++++++++++++++
>>>>   1 file changed, 58 insertions(+)
>>>>   create mode 100644
>>>> package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
>>>
>>> Committed, but please submit upstream.
>>>
>>
>> I'll do.
>>
>> Best regards,
>> Romain
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> Some changes to fix this kind of issues have been applied upstream. Please have
> a look to:
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=82292

Thanks for the link !

I should have looked at the latest commits...

> 
> Maybe it's worth to do a version bump and check if that new patch is no longer
> necessary.
> 

Yes, I reverted my commit and I built libinput-0.3.0 using a backported version
of this patch:
http://lists.freedesktop.org/archives/wayland-devel/2014-August/016599.html

Also, libevdev has renamed the functions log_msg to _libevdev_log_msg.
So, the issue will be fixed without my patch in the next version bump of
libevdev or libinput.

Best regards,
Romain
