From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Apr 2018 19:46:21 +0200
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
In-Reply-To: <20180425172248.GA25020@scaer>
References: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
 <20180425172248.GA25020@scaer>
Message-ID: <20180425174621.GB25020@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2018-04-25 19:22 +0200, Yann E. MORIN spake thusly:
> On 2018-04-25 10:56 +0200, Luca Ceresoli spake thusly:
> > I noticed a problem with the EXTRA_DOWNLOADS for packages whose "main"
> > download happens using git (most likely applies to other SCMs too).
> 
> Thanks for this report. I can indeed confirm that extra downloads are
> broken on 2018.02.x and master, when the main download is from an SCM.
> 
> As I said on IRC, I think they have always been broken, but we silenly
> failed so far. So, there is no "regresskion" per-se. Just a bug.
> 
> As for master, we no longer silently fail, but we do now error out.
> This could be considered an improvement, no? ;-)
> 
> I am working on a fix, and I already have something that is workable
> now. I jsut need a few tests, and I'll submit it later tonight (or by
> the weeke-end at least).

Wihtout much furhter ado, here's the series in a preliminary state:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/dl

The commit logs are not entirely written (oif at all) yet, but at least,
it would nice if you could have a look and test if that fixes your
use-case.

This is for master, obviously. I'll see if I can do something for
2018.02.x later...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
