From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Apr 2017 23:13:06 +0200
Subject: [Buildroot] [PATCH v5 08/19] reproducible: try to detect most
 common errors
In-Reply-To: <20170401165059.1f3f9ad5@free-electrons.com>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-9-git-send-email-jezz@sysmic.org>
 <20170401165059.1f3f9ad5@free-electrons.com>
Message-ID: <20170401211306.GB3663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, J?r?me, All,

On 2017-04-01 16:50 +0200, Thomas Petazzoni spake thusly:
> On Tue, 20 Dec 2016 14:46:25 +0100, J?r?me Pouiller wrote:
> > Some package includes some information from build environment in their results.
> > This practice is incompatible with reproducible builds.
> > 
> > This patch scans final target to research most common patterns.
> > 
> > Since we only search fixed strings (grep is called with -F), this search is
> > fast (on my station, 60ms for a target of 40MB).
> > 
> > Note, it could be a good idea to also match current user name. However, build
> > path often contains username and, until now, we do not try to avoid build path
> > in result.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> 
> I am not entirely convinced it makes sense to grep more or less
> randomly in all files specifically for those strings.

Indeed. My hostnames usually cary some computer-related keywords, which
can very well occur in binary files (e.g. 'segfault').

> Or perhaps, we should have a separate shell scripts that checks for
> several classes of obviously non-reproducible behaviors?

Indeed, but such a script can only be a helper that a user would
voluntarily run on their own.

We can't have such a script automatically run, because those strings can
be too common.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
