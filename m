From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 22 Mar 2016 06:10:01 -0500
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <CAHXCMM+P=pQDYUULkW59ggJQpki5PNB5B896PhHmBaQ8c5kjHQ@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <CAFt09wNvtXGcfZ3PFZOgGu+bDvp6mEr44uwxa_ryjeP6DDQKBQ@mail.gmail.com>
 <CAFt09wOp3C44Y7WY48p2P9xKQr_EO7x_mAC7je--M0RwXc83sg@mail.gmail.com>
 <CAHXCMM+vZH6tshQXizYqVag+zeEh-vS17AZTCsdyeY_SsB+E8w@mail.gmail.com>
 <CAFt09wP4mLSaBGoDCrhXsZKj7+JBfd0D5oHCEm5Bhy0Ko8zO4Q@mail.gmail.com>
 <CAFt09wPZo0QL+-3kAo3dHTLLBfzJXyBHXUVy5-qMaRXC3QAEzQ@mail.gmail.com>
 <CAHXCMM+P=pQDYUULkW59ggJQpki5PNB5B896PhHmBaQ8c5kjHQ@mail.gmail.com>
Message-ID: <CAFt09wPqTN0JQwOzEZA6xkj4bP8fmPNVCTsipcRu_vA5M0mj1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Tue, Mar 22, 2016 at 12:55 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Matthew,
>
> On Tue, Mar 22, 2016 at 4:03 AM, Matthew Weber <matt@thewebers.ws> wrote:
>> Samuel,
>>
>> On Mon, Mar 21, 2016 at 6:40 AM, Matthew Weber <matt@thewebers.ws> wrote:
>>> Samuel,
>>>
>>> On Mon, Mar 21, 2016 at 12:21 AM, Samuel Martin <s.martin49@gmail.com> wrote:
>>>> On Mon, Mar 21, 2016 at 2:45 AM, Matthew Weber <matt@thewebers.ws> wrote:
>>>>> Samuel, All,
>>>>>
>>>>> On Sun, Mar 20, 2016 at 8:44 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>>>>> Samuel,
>>>>>>
>>>
>>> <snip>
>>>>
>>
>> Narrowed it down to removing "O=$(realpath $(O))" on line 50 in the
>> Makefile resolves the build error.  If I understand it correctly this
>> is declaring O= empty and it causes the logic on 127 to evaluate to
>> False and O= ends up as empty.
>>
>> I applied your 02/18 patch on top of
>> 0e1547a87cfd51e4fedf1cb7837f77e4f66c4052 when I tested.
>>
> Thanks for investigating this.
> Unfortunately, I could not reproduce this issue here with make-4.1. :-/
> (I wonder whether this could be related to the make version...)
>
> Anyway, following Yann's review, I have reworked this patch [1].
> If you give a try to this patch, care to tell me if it fixes your issue.
>
> [1] https://github.com/tSed/buildroot/commit/c55eeee30fe6106354c0f2cb6ce6ecb46972503a
>

Looks like I have Make 4.0.

Thanks for the patch, output looks like same with that version.  I'll
jump on another buildmachine at work today and see if I can reproduce
this.

-- 
Thanks,
Matt
