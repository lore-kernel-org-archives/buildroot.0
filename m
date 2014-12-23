From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Dec 2014 12:21:36 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy
 location
In-Reply-To: <20141221231948.77de4e62@free-electrons.com>
References: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
 <20141221231948.77de4e62@free-electrons.com>
Message-ID: <20141223112136.GA4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-21 23:19 +0100, Thomas Petazzoni spake thusly:
> On Sat, 13 Dec 2014 18:08:33 +0100, Yann E. MORIN wrote:
> > nmap is looking for pcre headers in pcre/pcre.h which our current
> > version of pcre does not populates.
> > 
> > So, just create those as symlinks to the actual headers.
> 
> Do we want this, or instead do we want to fix nmap and other pcre users
> to use the new location?

I don;t know.

One the one hand, we woudl certainly prefer to fix packages to use the
new location, so we can eventually get rid of our hacks to make them
build when we eventually update them.

On the other hand, I'm afraid this could be an endless hide-and-seek
game, which would take us quite some efforts to upstream our patches,
especially for packages that may still want to build on older systems
with the old layout...

However, for now, the only offender in this respect is nmap, so I can
try to fix it and upstream the fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
