From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 May 2015 19:49:36 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150519100045.44f1b3a4@free-electrons.com>
References: <20150519063012.E7D2A100C5F@stock.ovh.net>
 <20150519100045.44f1b3a4@free-electrons.com>
Message-ID: <20150520174936.GA4157@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-05-19 10:00 +0200, Thomas Petazzoni spake thusly:
> >      powerpc |                 sqlite-3081000 | NOK | http://autobuild.buildroot.net/results/aed3690689b60844e3278626da3c3eb75f2a2586/
> 
> Parallel build issue, Yann already reproduced the issue and was
> investigating it yesterday evening, but I'm not sure if he managed to
> find a solution.

Sorry, I haven't had time to commit to this task since monday evening.
I'll resume investigatign tonight.

However, it looks like sqlite does not build a lot of files (something
like 3 or four .o, a .so I think, and an executable) so it looks like a
quick workaround would be to disable parallel builds for sqlite, without
incurring too big a penalty on build time.

If I can't get aroudn a proper fix tonight, I'll submit that workaround.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
