From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 24 Apr 2017 15:26:21 +0200
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.14
In-Reply-To: <9cbb711a-6026-8a69-a6c6-85dc140e2e4c@imgtec.com>
References: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
 <3cc20a82-673d-f87b-e5c6-0acc428cfb1c@ginzinger.com>
 <9cbb711a-6026-8a69-a6c6-85dc140e2e4c@imgtec.com>
Message-ID: <d6771575-8b26-f608-5d57-4d3c573eee36@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2017-04-24 14:55, Vicente Olivert Riera wrote:
> Hi Martin,
> 
> On 24/04/17 13:27, Martin Kepplinger wrote:
>> On 2017-04-24 14:22, Martin Kepplinger wrote:
>>> This uses x11vnc's new upstream location, github, via https. Autoreconf is
>>> added, because it's really only a code snapshot release.
>>>
>>> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
>>> ---
>>>  package/x11vnc/x11vnc.hash | 2 +-
>>>  package/x11vnc/x11vnc.mk   | 9 +++++++--
>>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
>>> index 5828b12..0da7765 100644
>>> --- a/package/x11vnc/x11vnc.hash
>>> +++ b/package/x11vnc/x11vnc.hash
>>> @@ -1,2 +1,2 @@
>>>  # Locally computed:
>>> -sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
>>> +sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  0.9.14.tar.gz
>>
>>
>> It's ugly to have 0.9.14.tar.gz. Is there a buildroot-style solution to
>> this?
> 
> This is just fine, it's not the only package whose tarball name doesn't
> include the package name. Look for instance the mpv and yaffs2utils
> packages.
> 
>>
>> And other than that, is there a reason why x11vnc had not been updated
>> before? 0.9.14 is one and a half years old.
> 
> Because nobody did it, probably. Anyway, the 0.9.14 is considered a
> bleeding edge development release (according to x11vnc's website) and
> even with that, as you said, is one and a half years old. Just
> wondering..., shouldn't be better to go with ToT (top of the tree) instead?
> 
> X11VNC_VERSION = e47d922d4a4d980f8dce3e466c73dc4665e4bc01
> X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
> 

They don't seem to use development branches; While I think it would be
fine to use the master branch, just from my personal feeling I'd use the
tagged versions. Seems like the project is maintained and 0.9.15 somehow
on the horizon sometime sooner or later.

> Regards,
> 
> Vincent
> 
>>
>> thanks
>>
>>                        martin
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
