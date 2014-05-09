From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 May 2014 11:03:28 +0200
Subject: [Buildroot] [PATCH] cmake: forward HOST_{C,
	LD}FLAGS as cmake flags
In-Reply-To: <CAHkwnC8QS49A0f61Y=PtzguQ4Y+uC4D81j2DDkGKk5TOQ2iZnQ@mail.gmail.com>
References: <1399586335-22928-1-git-send-email-s.martin49@gmail.com>
 <536C9159.9050900@lucaceresoli.net>
 <CAHkwnC8QS49A0f61Y=PtzguQ4Y+uC4D81j2DDkGKk5TOQ2iZnQ@mail.gmail.com>
Message-ID: <CAHXCMM+mmpy2AkdqhD39Zg3=3aBF7_XaY=bWkFeoR7T3g1us=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 9, 2014 at 10:33 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Fri, May 9, 2014 at 10:27 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Hi Samuel,
>>
>>
>> Samuel Martin wrote:
>>>
>>> During the CMake bootstrap phase, the {C,LD}FLAGS set in the bootstrap
>>> environment are not forwarded/converted as CMake flags.
>>>
>>> The CMake build contains a bootstrap phase building a minimal CMake
>>> program using a standard Makfile, then reconfigures itself with this
>>> minimal program.
>>>
>>> On system with no ncurses installed, and because the prefix option
>>> points to $(HOST_DIR)/usr, if host-cmake was built after host-ncurses,
>>> then ncurses libraries and headers are correctly find (in the host tree)
>>
>>
>> s/find/found/.

good catch!

>>
>>
>>> during the second configuration (because of the prefix). However, it
>>> fails at building ccmake (the curses interface) because the
>>> CMAKE_C_FLAGS, CMAKE_CXX_FLAGS and CMAKE_EXE_LINKER_FLAGS do not
>>> point to the host tree.
>>>
>>> Because these flags are needed when running the bootstrap script,
>>> this patch makes sure the same flags are set when running the second
>>> configuration.
>>>
>>> Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>
>>
>> In general I'm OK with this fix once it is, well... fixed according to
>> Fabio's comment.
>>
>> But I still think disabling ccmake and other host tools that Buildroot
>> does not use would be a good idea. I agree with Thomas when he says
>> building host-cmake takes really long, although I am not sure we can
>> save a lot of time.
>>
>> So I'd proceed quickly with this fix, and later disable unneeded tools
>> and see how much time we can save.
>
> I think the same so after the revision of this patch  is sent i will
> sent a revision of my patch rebased on this one.
> That is also useful to remove a optionally unspecified dependency for
> the sake of reproducible builds.
>

Sure, do it! :-)

> Samuel could you also break lines longer than 80 characters?

Will do.

>
> Thanks
> --
> Fabio Porcedda

Regards,

-- 
Samuel
