From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 15:15:30 +0200
Subject: [Buildroot] [PATCH v4 1/1] Added linux drivers backports project
In-Reply-To: <20150419110326.31c34542@free-electrons.com>
References: <1429311670-7831-1-git-send-email-petr.vorel@gmail.com>
 <20150419110326.31c34542@free-electrons.com>
Message-ID: <20150419131529.GH4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Petr, All,

On 2015-04-19 11:03 +0200, Thomas Petazzoni spake thusly:
--SNIP--]
> I wanted to apply your patch, and did a couple of updates to it (see
> below). However, there's a more fundamental problem to this package: it
> expects the linux package to be extracted/configured *before* the
> configuration of linux-backports. Unfortunately, this is not the case:
> 'linux' is only in LINUX_BACKPORTS_DEPENDENCIES, so it's only
> guaranteed to be here when linux-backports gets configured, not before.
[--SNIP--]
> I'm not sure yet of the possible solutions to this: add 'linux' to
> LINUX_BACKPORT_PATCH_DEPENDENCIES ? Use the linux extension mechanism
> as suggested by Arnout ?

Adding 'linux' to _PATCH_DEPENDENCIES will not be enough, because all
_PATCH_DEPENDENCIES guarantees is that such dependencies are extracted
and patched, not that they are configured/built or whatever.

So, the only option left would be to treat them as a linux extension,
and drop the build+install commands from linux-backports, and use the
integration strategy (instead of the packaging strategy), see:
    https://backports.wiki.kernel.org/index.php/Documentation/integration

However, it seems to be quite involved...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
