From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 7 Feb 2020 13:59:43 +0100
Subject: [Buildroot] [PATCH 05/10] package/systemd: cosmetic rearrange
 list of users
In-Reply-To: <CAFvCimUVLFW-K2WCU2nFLHkQutsW7HKjWeV5zWJ3cLqK3JurKQ@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-6-nolange79@gmail.com>
 <CAFvCimWQmzczt5u0LuTW=vg4UUfXAZ3VAskCmU8CFYGPVgEcxw@mail.gmail.com>
 <CADYdroNxsdmgJHEaW1rHXN4KbyCkoD=yFzVuVPPeMV_xF0j4VA@mail.gmail.com>
 <CAFvCimUVLFW-K2WCU2nFLHkQutsW7HKjWeV5zWJ3cLqK3JurKQ@mail.gmail.com>
Message-ID: <CADYdroNNEhAiEb10nO5h-Q5Sxp4MT0F6mMhR04tcpoKBza_7Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkuser creating users by default if a Bug IMHO, the only non-system users
are those
that are explicitly defined.
Did not know journald acts differently based on UIDs btw.

I posted a patch to allow creating system users, but that would require
changing *every*
package adding users.
https://patchwork.ozlabs.org/patch/1222180/

Norbert

Am Fr., 7. Feb. 2020 um 13:53 Uhr schrieb J?r?my ROSEN <
jeremy.rosen@smile.fr>:

>
>
> Le ven. 7 f?vr. 2020 ? 13:47, Norbert Lange <nolange79@gmail.com> a
> ?crit :
>
>> Not sure if you meant to reply to patch #6 instead.
>>
>> maybe :P
>
>
>> The main reference is the README, and the templates in sysusers.d.
>> You want me to add this as comment in the .mk file if I understood
>> correctly?
>>
>> That's very minor... I meant pointing to the sysusers.d files so someone
> that doesn't know systemd as well can check that nothing has changed
>
>
>> Also I am not sure why those users/groups aren't already in the systemd
>> skeleton.
>>
>> That's a pretty good question. Also, since they are created by
> mkusers they have a UID > 1000 that confuses journald.
> (they get their own journal files, as if they were normal users, instead
> of being logged only in the system journals)
>
>
>> Should I post just an amended Patch #5 or wait a while to redo the series
>> once I got feedback for the rest?
>>
>> Wait for more feedback, that's too minor to have you respin just for that.
>
> Cheers
> Jeremy
>
>
>> Am Fr., 7. Feb. 2020 um 10:13 Uhr schrieb J?r?my ROSEN <
>> jeremy.rosen at smile.fr>:
>>
>>> could you add a line pointing to the corresponding file in
>>> systemd's source code (i.e the sysuser file from upstream)
>>> that would help future reviewers
>>>
>>> apart from that
>>>
>>> Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>>>
>>> Le jeu. 6 f?vr. 2020 ? 10:37, Norbert Lange <nolange79@gmail.com> a
>>> ?crit :
>>>
>>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>>> ---
>>>>  package/systemd/systemd.mk | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>>> index b3e83b5d3b..b6bd85f130 100644
>>>> --- a/package/systemd/systemd.mk
>>>> +++ b/package/systemd/systemd.mk
>>>> @@ -428,10 +428,12 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
>>>>  endef
>>>>
>>>>  define SYSTEMD_USERS
>>>> +       # udev user groups
>>>>         - - input -1 * - - - Input device group
>>>> -       - - systemd-journal -1 * - - - Journal
>>>>         - - render -1 * - - - DRI rendering nodes
>>>>         - - kvm -1 * - - - kvm nodes
>>>> +       # systemd user groups
>>>> +       - - systemd-journal -1 * - - - Journal
>>>>         $(SYSTEMD_REMOTE_USER)
>>>>         $(SYSTEMD_COREDUMP_USER)
>>>>         $(SYSTEMD_NETWORKD_USER)
>>>> --
>>>> 2.24.1
>>>>
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>>
>>>
>>> --
>>> [image: SMILE]  <http://www.smile.eu/>
>>>
>>> 20 rue des Jardins
>>> 92600 Asni?res-sur-Seine
>>> *J?r?my ROSEN*
>>> Architecte technique
>>>
>>> [image: email] jeremy.rosen at smile.fr
>>> [image: phone]  +33 6 88 25 87 42
>>> [image: url] http://www.smile.eu
>>>
>>> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
>>> <https://www.facebook.com/smileopensource> [image: LinkedIn]
>>> <https://www.linkedin.com/company/smile> [image: Github]
>>> <https://github.com/Smile-SA>
>>>
>>> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
>>> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>>>
>>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/cbb6856d/attachment.html>
