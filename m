From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 14 Feb 2012 10:50:32 +0100
Subject: [Buildroot] [PATCH 3/3] .gitignore: remove wrong entries
In-Reply-To: <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <1328918676-19482-4-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LXsQCsdwswHGa=Ei-+DkB7OyJbKnz7MhatTeEgCk5MMWw@mail.gmail.com>
 <CAMP44s10qfDsyg69vHqsR-Lu3V9uJoJH6AY46xETJ=T-ijhxQA@mail.gmail.com>
Message-ID: <CAAXf6LWet8=sL9Yv64L=ccL_p3aNprM2iyj5seQOriM8gi9FLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[resend correctly to the list]

Hi,

On Sun, Feb 12, 2012 at 12:01 AM, Felipe Contreras
<felipe.contreras@gmail.com> wrote:
> On Sat, Feb 11, 2012 at 10:08 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>>
>> Op 11 feb. 2012 01:05 schreef "Felipe Contreras"
>> <felipe.contreras@gmail.com> het volgende:
>>
>>
>>>
>>> These should go into a personal file, like:
>>> core.excludesfile=/home/felipec/.gitignore
>>> ?.*.sw[nop]
>>>
>>> Some people might prefer to see patches, rejects and other files in the
>>> output of 'git status' (e.g. me).
>>>
>>> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
>>> ---
>>> ?.gitignore | ? ?7 -------
>>> ?1 files changed, 0 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index 685a9c2..1a7d636 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -5,10 +5,3 @@
>>> ?/.config.old
>>> ?/..config.tmp
>>> ?/.config
>>> -*.depend
>>> -*.o
>>> -/*.patch
>>> -/*.diff
>>> -*.orig
>>> -*.rej
>>> -*~
>>
>> I personally don't agree. I don't think such ignores can be in a personal
>> gitignore file. Such a personal file will be used for all git repositories,
>> and you simply cannot state that no single project will use files with e.g.
>> a .orig extension. In my opinion this is project specific.
>
> You can have personal per-project ignore files as well.

Ok, I wasn't aware of that (not using git).

>
>> I'm neutral on the .patch and .diff change, but I think that .depend, .o,
>> .orig, .rej and ~ backups should remain in .gitignore.
>
> *.o and *.depend should be there, as they are the output of the build system.
>
> *.orig and *.reject and *~ should not, as they depend on the tools.
>
> I suspect *~ comes from vim backups, which many people have disabled,
> and many people don't even use vi.

It's difficult to quantify 'many' here. I can just as safely say that
many people do use vi and many people have not disabled ~ backups.

> Say, I have configured my editor to
> save backups with *.bak, should that be on the list? No, that's
> _personal_. If you want *~, or *.bak, to be ignored, you can put that
> in your global gitignore.
>
> *.orig and *.reject are also not particular to busybox, they can be on
> the global gitignore. And some people, like me, want to be able to see
> then when typing 'git status'. So this is a _personal_ choice.

I'm sure you mean buildroot here.

If you are to remove all these entries from the .gitignore file, you
are basically forcing people to create such a personal .gitignore
file. The defaults of the buildroot project are no longer sane.

To be honest, I'm not sure if your use case of seeing all files with
plain 'git status' is a common one, and thus whether it's worth
changing the experience for all other people just for that. In my
opinion, the default should be ok for most people.
Doesn't git provide an option to git-status to see ignored files? I
know Mercurial does. One could argue that it'd be better to submit a
patch to git for such an option.
Alternatively, you are free the gitignore file on a branch in your repository.

Note that this is just my view on this. I have no authority whatsoever.
I'm looking forward to input from other developers...

Best regards,
Thomas
