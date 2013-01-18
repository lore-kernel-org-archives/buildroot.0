From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 18 Jan 2013 19:52:13 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <50F96F98.3010704@mind.be>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <50F08535.509@mind.be> <50F0BE8A.8000502@petroprogram.com>
 <50F7B710.2000703@mind.be> <50F946E5.20903@petroprogram.com>
 <50F96F98.3010704@mind.be>
Message-ID: <50F98BCD.90009@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.1.2013 17:51, Arnout Vandecappelle kirjoitti:
> On 18/01/13 13:58, Stefan Fr?berg wrote:
>> Hi Arnout!
>>
>> 17.1.2013 10:32, Arnout Vandecappelle kirjoitti:
> [snip]
>>>   A generic solution could be the following: put a script in
>>> $(HOST_DIR)/usr/bin (or some other directory) that hands the known
>>> arguments to pkg-config and redirects the rest back to the original
>>> *-config script. This makes patching of the *-config script
>>> unnecessary in most cases.
>>>
>>
>> Sounds good but what about that<pkg>_CONFIG_FIXUP variable that was
>> started from Gustavo suggestion (originally from divine-config: fixup
>> thread) ?
>>
>> http://lists.busybox.net/pipermail/buildroot/2013-January/064656.html
>>
>> Was it now totally waste of time ?  :-(
>
>  Not at all. First of all, it got the discussion going which may
> eventually lead to an acceptable solution. Second, the generic
> solution is probably not implementable in the short term. Your patch
> certainly is, because it only refactors already-existing fixups into
> common infrastructure.
>
>  I therefore think that your patch should be committed. Will there
> still be a v3 or is this it?
>

Well, I think this is it.

>
>>>   Something to discuss (again) at the BR developer days?
>>>
>>>
>>>> I noticed that some *-config files have just prefix (and maybe
>>>> exec_prefix) but not any includedir or libdir defined inside them
>>>> and just give -I/usr/include for --cflags and -L/usr/lib for --libs
>>>
>>>   Even worse! Which one does that?
>>>
>>
>> Well, at least:
>>
>> giblib-config    --cflags    gives -I/usr/include
>> neon-config    --cflags    gives -I/usr/include
>>
>> But Im using older 2012.08 buildroot so maybe they are fixed now?
>
>  D'oh, I did a quick check in my allpkgconfig:
>
> for i in staging/usr/bin/*-config; \
>   do $i --cflags | grep -e '-I/usr' && echo " --- $i"; \
> done
>
>  24 of the 41 *-config scripts give the wrong cflags (26/40 for
> --libs) (roughly 10 scripts need some other argument than
> --libs/--cflags).
>
>  So I'd say that your patch is sorely needed :-)
>
>
>
>  Regards,
>  Arnout
>
> [snip]

Nicely :-)

Stefan
