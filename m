From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 1 Aug 2014 12:34:47 +0200
Subject: [Buildroot] [PATCH v3 2/3] apply-patches.sh: Use [[...]]
 construct instead of [...] construct
In-Reply-To: <20140731172842.GE3960@free.fr>
References: <1406826517-6106-1-git-send-email-fabio.porcedda@gmail.com>
 <1406826517-6106-3-git-send-email-fabio.porcedda@gmail.com>
 <00392aed-ce27-4eea-985b-75f06f79e0d7@email.android.com>
 <20140731172842.GE3960@free.fr>
Message-ID: <CAHkwnC-tREE2bDckpoXVZKgbpeW-93N_u4Dq421nHKG_obAdUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 31, 2014 at 7:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-07-31 19:19 +0200, Thomas De Schampheleire spake thusly:
>> Fabio Porcedda <fabio.porcedda@gmail.com> schreef:
>> >The [[...]] construct it's an improved and safer construct than the
>> >[...] construct. It's safer because it doesn't do "word splitting" so
>> >we don't need to enclose variable expansion with double quotes, e.g:
>> >
>> >   [ -e "$file" ] -> [[ -e $file ]]
>> >---
>>
>>
>> I'm not so convinced by this patch. [[]] is a bashism, it is not
>>  supported in all shells.
>
> Well, apply-patches is  bash script (it has the correct sha-bang.)
> But it is almost POSIX. The only bashism currently used is the
> 'function' keyword to declare functions. REmove this, and we have a
> POSIX script.
>
>> Yes, using single brackets means that you need to take care,
>> but anyway shell programming has many pitfalls.
>>
>> In the past people have sent patches to make Buildroot
>> more compatible with non-bash shells, so moving in the opposite
>>  direction is not a good idea IMO.


On the TODO list i didn't found a line about removing the use of bash:
 http://elinux.org/Buildroot

I've found just 4 commit made 4 years ago made by Yann, there are
recent commits about that effort?
right now bash is a requirement for buildroot:
Makefile:
# we want bash as shell
SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
         else if [ -x /bin/bash ]; then echo /bin/bash; \
         else echo sh; fi; fi)

It seems to me that right now there is no effort to remove the use of bash.

What are the advantage on removing the use of bash other that no
requring bash? There are platforms supported by buildroot  where is
not available bash?

>
> Agreed. Besides, the gains from that change are not worth it, IMHO.

It's worth or not based also on the effort, because the work is
already done, it's just a gain without effort so IMHO it's worth it.

IMHO rejecting this patch it is like proposing that removing the use
of bash it's worth it, so removing bash is worth it? it is really a
problem requiring bash? there is someone that is working on removing
the use of bash?

I just want to understand properly the situation.

Thanks for reviewing and best regards
-- 
Fabio Porcedda
