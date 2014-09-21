From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 21 Sep 2014 18:45:15 +0200
Subject: [Buildroot] [PATCH 01/10] package/libinput: bump version
In-Reply-To: <541DE015.6040006@openwide.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
 <c999e0a0cf43f65190bf74289b299b959557b0d0.1411232859.git.yann.morin.1998@free.fr>
 <541DB8A4.4050008@openwide.fr> <20140920175529.GA18705@free.fr>
 <541DE015.6040006@openwide.fr>
Message-ID: <541F009B.5050703@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

Le 20/09/2014 22:14, Romain Naour a ?crit :
> Yann,
> 
> Le 20/09/2014 19:55, Yann E. MORIN a ?crit :
>> Romain, All,
>>
>> On 2014-09-20 19:25 +0200, Romain Naour spake thusly:
>>> Hello Yann,
>>>
>>> Le 20/09/2014 19:09, Yann E. MORIN a ?crit :
>>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>> ---
>>>>  ...put-01-rename-log_msg-to-libinput_log_msg.patch | 54 +++++++++++++---------
>>>>  package/libinput/libinput.mk                       |  2 +-
>>>>  2 files changed, 32 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
>>>> index c10d8af..2ada150 100644
>>>> --- a/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
>>>> +++ b/package/libinput/libinput-01-rename-log_msg-to-libinput_log_msg.patch
>>>> @@ -9,6 +9,8 @@ of the log_msg() symbol.
>>>>  http://autobuild.buildroot.net/results/c13/c133b7c706ee31302125df8ca94f4d0f0152c6c6/build-end.log
>>>>  
>>>>  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>>> +[yann.morin.1998 at free.fr: rebase on-top of 0.6.0]
>>>> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>>  ---
>>>
>>> I think this patch can be dropped with this new release.
>>> The issue is normally fixed by the commit "Use -no-install instead of -static
>>> for local noinst linking"
>>>
>>> See: https://bugs.freedesktop.org/show_bug.cgi?id=82292
>>> (the bug was reported by Vicente)
>>
>> Yep, I saw that bug. And I pondered removing the patch.
>>
>> However, I was not able to test a static-only build, so I can't say
>> whether that patch is still valid or not.
>>
>> Also, that patch merely renames a function.
>>
>> When/if I have some time around the WE, I'll test whether it is still
>> needed.
>>
>> So, I decided it would be better to just refresh it for now. If you or
>> Vicente have some time to test the new libinput without that patch, feel
>> free to report! ;-)
>>
> No problem, I'll try to check that tonight or tomorrow afternoon.
> 

libinput can't be selected on static-only case since it depends on a udev
provider (eudev or systemd) which require dynamic libraries support.

Also, libinput 0.6.0 no longer build by default the static libraries libinput.a.

So, this issue is fixed when systemd is used as udev provider:
http://autobuild.buildroot.net/results/8b6/8b60fdf4fdec834dc79f8dfc4fd050f763c83457/

Best regards,
Romain Naour
