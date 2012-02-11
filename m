From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sun, 12 Feb 2012 01:01:51 +0200
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <CAAXf6LXsQCsdwswHGa=Ei-+DkB7OyJbKnz7MhatTeEgCk5MMWw@mail.gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <1328918676-19482-4-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LXsQCsdwswHGa=Ei-+DkB7OyJbKnz7MhatTeEgCk5MMWw@mail.gmail.com>
Message-ID: <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2012 at 10:08 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>
> Op 11 feb. 2012 01:05 schreef "Felipe Contreras"
> <felipe.contreras@gmail.com> het volgende:
>
>
>>
>> These should go into a personal file, like:
>> core.excludesfile=/home/felipec/.gitignore
>> ?.*.sw[nop]
>>
>> Some people might prefer to see patches, rejects and other files in the
>> output of 'git status' (e.g. me).
>>
>> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
>> ---
>> ?.gitignore | ? ?7 -------
>> ?1 files changed, 0 insertions(+), 7 deletions(-)
>>
>> diff --git a/.gitignore b/.gitignore
>> index 685a9c2..1a7d636 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -5,10 +5,3 @@
>> ?/.config.old
>> ?/..config.tmp
>> ?/.config
>> -*.depend
>> -*.o
>> -/*.patch
>> -/*.diff
>> -*.orig
>> -*.rej
>> -*~
>
> I personally don't agree. I don't think such ignores can be in a personal
> gitignore file. Such a personal file will be used for all git repositories,
> and you simply cannot state that no single project will use files with e.g.
> a .orig extension. In my opinion this is project specific.

You can have personal per-project ignore files as well.

> I'm neutral on the .patch and .diff change, but I think that .depend, .o,
> .orig, .rej and ~ backups should remain in .gitignore.

*.o and *.depend should be there, as they are the output of the build system.

*.orig and *.reject and *~ should not, as they depend on the tools.

I suspect *~ comes from vim backups, which many people have disabled,
and many people don't even use vi. Say, I have configured my editor to
save backups with *.bak, should that be on the list? No, that's
_personal_. If you want *~, or *.bak, to be ignored, you can put that
in your global gitignore.

*.orig and *.reject are also not particular to busybox, they can be on
the global gitignore. And some people, like me, want to be able to see
then when typing 'git status'. So this is a _personal_ choice.

Cheers.

-- 
Felipe Contreras
