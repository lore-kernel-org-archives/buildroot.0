From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Apr 2018 18:47:31 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Avoid executing 'git log' each
 time SOURCE_DATE_EPOCH is used
In-Reply-To: <4cda6a08-dab5-0901-802c-4ea2d7818cea@origamienergy.com>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
 <1523010383-27024-1-git-send-email-james.byrne@origamienergy.com>
 <20180407143358.GA2341@scaer>
 <4cda6a08-dab5-0901-802c-4ea2d7818cea@origamienergy.com>
Message-ID: <20180409164731.GB2312@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-04-09 16:50 +0100, James Byrne spake thusly:
> On 07/04/18 15:33, Yann E. MORIN wrote:
[--SNIP--]
> >So, I am still opposed to the second change.
> In both of your examples it will still work as expected since the
> buildroot makefile is always invoked with "-C /path/to/buildroot", which
> means that when the 'git log' command is executed the current directory
> is always '/path/to/buildroot' and so the commit date will be the date
> of the tree that the Buildroot makefile is in.

Indeed, you are absolutely right. I was  totally oblivious to that
fact, even though I moderately participated in that...

> If you think you might change your mind I will submit that change as a
> new patch, as I still think it makes a better default, but if you don't
> agree then I won't bother as it's a very minor thing, and as you say it
> can easily be overridden by setting SOURCE_DATE_EPOCH in the environment.

So, with your explanations above, I am no longer opposed to that second
change.

Be sure to provide adequate explanations in the commit log, though.
Maybe something that list the two cases:

  - if Buildroot is a git tree on its own, then the 'git log' will act
    on that tree because we always cd into Buildroot's tree;

  - if Buildroot is just a sub-directory in a upper-layer git tree, then
    the git log would act on that directory.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
