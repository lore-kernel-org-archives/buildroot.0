From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Apr 2018 14:12:22 +0200
Subject: [Buildroot] [RFC PATCH 1/3] download/git: fix fetch all refs
 for old git
In-Reply-To: <5ad0f591ed5a9_19072aca94e3dabc58762@ultri4.mail>
References: <20180412174237.GE4221@scaer>
 <5ad0f591ed5a9_19072aca94e3dabc58762@ultri4.mail>
Message-ID: <20180415121222.GC21958@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-13 15:23 -0300, Ricardo Martincoski spake thusly:
> On Thu, Apr 12, 2018 at 02:42 PM, Yann E. MORIN wrote:
> >> -    _git fetch origin -t
> >> +    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"
> > Why don't we just run:
> >     git fetch origin
> >     git fetch origin -t
> 
> One extra connection to the server ...
> but much more readable/maintainable!
> I will do. I will change this patch to Changes Requested.

Thanks. I don't care much about an extra round-trip to the server,
especially if that makes the code easier to read.

> > As I understand it:
> >                     ancient git         | new git
> > --------------------------------------------------------------------
> > git fetch     | fetch all refs but tags | fetches all refs but tags
> > git fetch -t  | fetches only tags       | fetch all refs and tags
> Nit: actually 'git fetch' does fetch some tags, but not necessarily all. Only
> tags in commits also reachable by branches are fetched.

OK, but overall, we would cover all cases with the two git-fetch,
whether we use an old git or a newer one, and that's the important
info.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
