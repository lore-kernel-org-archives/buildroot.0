From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 3 May 2014 14:09:28 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test using fork() when
 fork() is no available
In-Reply-To: <20140502174538.34097974@skate>
References: <1399040498-30168-1-git-send-email-s.martin49@gmail.com>
 <20140502174538.34097974@skate>
Message-ID: <CAHXCMMJeRdto+G08pFGNBq8aUNsCUiqKWrxp5P9bG50z4=TEjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, May 2, 2014 at 5:45 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Fri,  2 May 2014 16:21:38 +0200, Samuel Martin wrote:
>> zeromp's configure script correctly detects the fork availability, but
>> unconditionally build all tests.
>>
>> This patch just disables the piece of code using fork() in the given
>> test. This avoids the autoreconf step of the package.
>
> Huh, but then it completely breaks the test, no? Would it be better to
> find an upstreamable solution instead?

I don't think so.
Zeromq code already uses "#ifdef HAVE_FORK ... #endif" to protect the
section using fork; I just did the same in the test source (disabling
most/all of this test, so it now has not real meaning when fork() is
not available).

BTW, I've just come up with a proper solution just by hacking the
autotools (<ironic>my favorite build-system! </ironic>), so I'll
repost this fix shortly.

Regards,

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
