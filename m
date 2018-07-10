From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Date: Tue, 10 Jul 2018 10:05:04 +0200
Subject: [Buildroot] [PATCH] systemd: add an option to use busybox's
 getty
In-Reply-To: <2708cb51-e9fd-2176-a129-98202de43ddf@mind.be>
References: <20180708195429.9693-1-jeremy.rosen@smile.fr>
 <be826cad-71c5-10ac-aec2-bc4dc919e356@smile.fr>
 <2708cb51-e9fd-2176-a129-98202de43ddf@mind.be>
Message-ID: <07fc8266-b257-845b-f368-b922b3df18e7@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2018 00:21, Arnout Vandecappelle wrote:
>
> On 09-07-18 10:02, Romain Naour wrote:
>> Hi Jeremy,
>>
>> Le 08/07/2018 ? 21:54, J?r?my Rosen a ?crit?:
>>> Currently, the patch to replace agetty with busybox's getty is always
>>> applied.
>>>
>>> this patch adds a compile-time option to systemd to choose either agetty
>>> or busybox's getty and chooses the correct option depending on agetty being
>>> selected in busybox
>>>
>> As discussed privately, if you want an example on how apply a patch
>> conditionally you can take a look at the gcc package [1].
>   I don't think we want to apply patches conditionally. In fact, J?r?my's change
> is much better, because it makes the patch upstreamable.
systemd upstream is not interested in supporting busybox AFAIU...

>   That said, as discussed on IRC, a much easier approach would be to overwrite
> systemd's getty unit files with custom buildroot unit files in case
> UTIL_LINUX_AGETTY is not selected. Then the patch could be dropped entirely.
The patch approch has the advantage of "breaking" if upstream changes, 
but I can do a followup in that direction, if that's what the project 
wants...
>   Regards,
>   Arnout
>
>> This has been introduced by [2] but there is some other place where
>> $(APPLY_PATCHES) is used (conditionally or unconditionally).
>>
>> $(APPLY_PATCHES) is defined in package/Makefile.in but this way to use it is not
>> documented in the manual [3].
>>
>> Best regards,
>> Romain
>>
>> [1] https://git.busybox.net/buildroot/tree/package/gcc/gcc.mk#n41
>> [2]
>> https://git.busybox.net/buildroot/commit/?id=197006a41c1a0450bf6350d5742e186b5b0c69de
>> [3] http://nightly.buildroot.org/manual.html#patch-policy
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>

-- 
SMILE <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine

	
*J?r?my ROSEN*
Architecte technique
Responsable de l'expertise Smile-ECS

email jeremy.rosen at smile.fr <mailto:jeremy.rosen@smile.fr>
phone +33141402967
url http://www.smile.eu

Twitter <https://twitter.com/GroupeSmile> Facebook 
<https://www.facebook.com/smileopensource> LinkedIn 
<https://www.linkedin.com/company/smile> Github 
<https://github.com/Smile-SA>


D?couvrez l?univers Smile, rendez-vous sur smile.eu 
<http://smile.eu/?utm_source=signature&utm_medium=email&utm_campaign=signature>

eco Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180710/c0a23d93/attachment.html>
