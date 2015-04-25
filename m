From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 15:01:02 +0200
Subject: [Buildroot] [PATCH 1/3] support: add script to find maintainers
In-Reply-To: <20150425124626.GC4275@free.fr>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
 <6fa246aa883ffa33c0fbcf7d52e7032b9685bfaf.1427044305.git.yann.morin.1998@free.fr>
 <553B83E3.7010804@mailerd.de> <20150425124626.GC4275@free.fr>
Message-ID: <20150425130102.GE4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-04-25 14:46 +0200, Yann E. MORIN spake thusly:
> On 2015-04-25 14:09 +0200, Andr? Erdmann spake thusly:
[--SNIP--]
> > Not sure if it makes sense to local-scope getopts vars,
> > there's also OPTIND and maybe OPTERR.
[--SNIP--]
> And OPTERR is not something set by bash, it is a variable that bash
> reads to see how to behave on error.  So, as long as it is not set,
> there's no reason to declare it. But of course, there is, since we
> do not want to inhrit it from the user's environment.

Well, we don;t care the value of OPTERR, since the optstring starts with
a colon, and thus there is explicitly no error reporting (except the one
we manually handle). So there's no reason to have a local OPTERR.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
