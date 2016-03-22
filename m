From: Matthew Weber <matt@thewebers.ws>
Date: Mon, 21 Mar 2016 22:03:43 -0500
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <CAFt09wP4mLSaBGoDCrhXsZKj7+JBfd0D5oHCEm5Bhy0Ko8zO4Q@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <CAFt09wNvtXGcfZ3PFZOgGu+bDvp6mEr44uwxa_ryjeP6DDQKBQ@mail.gmail.com>
 <CAFt09wOp3C44Y7WY48p2P9xKQr_EO7x_mAC7je--M0RwXc83sg@mail.gmail.com>
 <CAHXCMM+vZH6tshQXizYqVag+zeEh-vS17AZTCsdyeY_SsB+E8w@mail.gmail.com>
 <CAFt09wP4mLSaBGoDCrhXsZKj7+JBfd0D5oHCEm5Bhy0Ko8zO4Q@mail.gmail.com>
Message-ID: <CAFt09wPZo0QL+-3kAo3dHTLLBfzJXyBHXUVy5-qMaRXC3QAEzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Mon, Mar 21, 2016 at 6:40 AM, Matthew Weber <matt@thewebers.ws> wrote:
> Samuel,
>
> On Mon, Mar 21, 2016 at 12:21 AM, Samuel Martin <s.martin49@gmail.com> wrote:
>> On Mon, Mar 21, 2016 at 2:45 AM, Matthew Weber <matt@thewebers.ws> wrote:
>>> Samuel, All,
>>>
>>> On Sun, Mar 20, 2016 at 8:44 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>>> Samuel,
>>>>
>
> <snip>
>>

Narrowed it down to removing "O=$(realpath $(O))" on line 50 in the
Makefile resolves the build error.  If I understand it correctly this
is declaring O= empty and it causes the logic on 127 to evaluate to
False and O= ends up as empty.

I applied your 02/18 patch on top of
0e1547a87cfd51e4fedf1cb7837f77e4f66c4052 when I tested.


-- 
Thanks,
Matt
