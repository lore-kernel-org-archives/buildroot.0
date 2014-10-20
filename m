From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:07:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: enable building of
 boost_log
In-Reply-To: <20141020170223.GC3742@free.fr>
References: <1413811644-28525-1-git-send-email-yannickkiekens@gmail.com>
 <20141020170223.GC3742@free.fr>
Message-ID: <20141020170703.GE3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yannick, All,

On 2014-10-20 19:02 +0200, Yann E. MORIN spake thusly:
> On 2014-10-20 15:27 +0200, Yannick Kiekens spake thusly:
[--SNIP--]
> > diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> > index 46a98e8..06969b4 100644
> > --- a/package/boost/boost.mk
> > +++ b/package/boost/boost.mk
> > @@ -25,8 +25,7 @@ HOST_BOOST_FLAGS = --without-icu \
> >  
> >  # atomic library compile only with upstream version, wait for next release
> >  # coroutine breaks on some weak toolchains and it's new for 1.54+
> > -# log breaks with some toolchain combinations and it's new for 1.54+
> 
> As you remove a comment that warns that log is broken in some cases, it
> would be nice if you were to explain why this comment no longer applies.
> 
> For example, you could format your commit log as thus (reason totally
> made up for the sake of the example, adapt):
> 
>     package/boost: enable building of boost_log
> 
>     In the current version of boost, boost_log is now considered stable
>     and maintained. The failures caused by "some toolchain combinations"
>     no longer occur.
> 
>     Signed-off-by: [YOU]
> 
>     ---
>     Tested with these toolchains:
>       - uClibc, arm, static only
>       - uClibc, x86_64
> 
> Note the '---' line: you can add such a line in your commit log, and it
> will appear as-is in the mail you send. However, git is smart enough so
> that when the maintainer applies the patch, git removes it.

Sorry, I meant:
    [...] git removes it, and whatever follows (but keeps the patch, of
    course).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
