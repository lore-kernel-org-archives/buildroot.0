From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 22:03:31 +0100
Subject: [Buildroot] [PATCH] dependencies.sh: cleanup dependencies.sh
In-Reply-To: <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
References: <1391459047-23665-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52F1132F.1050008@lucaceresoli.net>
 <CAGduivzutuoD1mhfg6Oxo1DYKz+C+kak62Q0c=g_v7TehC3vuA@mail.gmail.com>
Message-ID: <52F2A723.8090401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 23:35, Maxime Hadjinlian wrote:
> 
> On 4 Feb 2014 17:20, "Luca Ceresoli" <luca@lucaceresoli.net
> <mailto:luca@lucaceresoli.net>> wrote:
>>
>> Hi Maxime,
> Hi Luca,
>>
>>
>> Maxime Hadjinlian wrote:
>>>
>>> Cleanup mixed indents and remove commented lines.
>>>
>>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com
> <mailto:maxime.hadjinlian@gmail.com>>
>>> ---
>>>   support/dependencies/dependencies.sh | 214
> +++++++++++++++++------------------
>>>   1 file changed, 107 insertions(+), 107 deletions(-)
>>>
>>> diff --git a/support/dependencies/dependencies.sh
> b/support/dependencies/dependencies.sh
>>> index 47d4d10..06386e6 100755
>>> --- a/support/dependencies/dependencies.sh
>>> +++ b/support/dependencies/dependencies.sh
>>> @@ -1,199 +1,199 @@
>>>   #!/bin/sh
>>>   # vi: set sw=4 ts=4:
>>> -#set -x
>>>
>>>   export LC_ALL=C
>>>
>>>   # Verify that grep works
>>>   echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>>>   if test $? != 0 ; then
>>> -       echo
>>> -       echo "grep doesn't work"
>>> -       exit 1
>>> +echo
>>> +echo "grep doesn't work"
>>> +exit 1
>>>   fi
>>
>>
>> Are you really suggesting we should remove all nesting? Well, I guess
>> there's been a problem with the e-mail or something...
> Well, I asked Peter before doing this, the file contained mixed indents.
> We thought it would be nice to have a consistent indent with the Mk files.

 dependencies.sh is not a .mk file...

 For .mk files it makes some sense not to indent:

- conditions are very rarely nested;

- indentation is already used to indicate commands within a rule;

- it's convenient to have all rules and variable names aligned at column 0.

 For scripts, we do have indentation, but not consistently (sometimes
tab, sometimes 4 spaces). IMHO it _should_ be tab.

 Regards,
 Arnout

> 
> But if we find we don't want that because it removes clarity in the code.
> I can perfectly resend with only the space/tab fixed.
> 
> I really don't have a strong opinion on this one. Thomas Petazzoni and
> Yann E. Morin also found it disturbing.
> Peter what is your decision ?
>>
>> --
>> Luca
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
