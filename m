From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 May 2015 20:06:10 +0200
Subject: [Buildroot] [PATCH] package/sqlite: fix parallel build failures
In-Reply-To: <20150521120742.0b0d7fdc@free-electrons.com>
References: <1432159112-28325-1-git-send-email-yann.morin.1998@free.fr>
 <20150521120742.0b0d7fdc@free-electrons.com>
Message-ID: <20150521180609.GA4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-05-21 12:07 +0200, Thomas Petazzoni spake thusly:
> On Wed, 20 May 2015 23:58:32 +0200, Yann E. MORIN wrote:
> > Fixes:
> >     http://autobuild.buildroot.org/results/aed/aed3690689b60844e3278626da3c3eb75f2a2586/
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/sqlite/0001-fix-parallel-build.patch | 22 ++++++++++++++++++++++
> >  package/sqlite/sqlite.mk                     |  3 +++
> >  2 files changed, 25 insertions(+)
> >  create mode 100644 package/sqlite/0001-fix-parallel-build.patch
> 
> Applied, thanks. I guess you've submitted this patch upstream, right?

TLD;DR: no.

Full story:

  - sqlite uses fossil as its VCS;

  - cloning a fossil repo creates a single file (the DB) in the current
    directory;

  - "checking out" the repository is also done in the curent directory,
    polluting it;

  - there is no "fossil log" command;

  - the content of the fossil repository is clearly not aligned with
    that of the tarball;

  - there is autostuff in the repository, but it is in a sub-dorectory,
    and there is no explanation on how to use it; there is no explanation
    on how to generate the archive from the repository;

  - the mailing list are not very newbie-friendly: they are
    subscription-only (OK) but even the archives require subscription to
    be browsed (not OK).

So, in the end, I just threw in the towel...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
