From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 16:15:44 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: support building with
 toolchains without native RPC
In-Reply-To: <E2B4183D-A17C-4117-8FB4-879DC988B634@gmail.com>
References: <1437768487-27179-1-git-send-email-patrickdepinguin@gmail.com>
 <20150725121950.GD3662@free.fr>
 <E2B4183D-A17C-4117-8FB4-879DC988B634@gmail.com>
Message-ID: <20150725141544.GF3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-25 15:12 +0200, Thomas De Schampheleire spake thusly:
> On July 25, 2015 2:19:50 PM CEST, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >On 2015-07-24 22:08 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> >> index 2d4f286..05ffaf1 100644
> >> --- a/package/ltp-testsuite/ltp-testsuite.mk
> >> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> >> @@ -19,8 +19,18 @@ endif
> >>  
> >>  # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
> >>  # support.
> >> +LTP_TESTSUITE_CFLAGS = $(filter-out
> >-D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> >> +LTP_TESTSUITE_CPPFLAGS = $(filter-out
> >-D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
> >
> >This hunk does not seem to have anything to do with the issue at hand,
> >namely RPC and musl, nor is it explained in the commit log. Care to
> >explain why filtering it out is needed (in the commit log and a comment
> >in the code), please?
> 
> These lines were already in that file (see removes below); I left the comment clarifying it. 
> I just introduced intermediate variables to cleanly handle the tirpc changes.

Indeed, my bad.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
