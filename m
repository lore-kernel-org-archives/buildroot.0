From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 17:04:00 +0200
Subject: [Buildroot] [PATCH] docs/manual: always point to the correct
 license file
In-Reply-To: <20180610164526.39af76ed@windsurf>
References: <20180602080101.23051-1-yann.morin.1998@free.fr>
 <20180610164526.39af76ed@windsurf>
Message-ID: <20180610150400.GD2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-06-10 16:45 +0200, Thomas Petazzoni spake thusly:
> On Sat,  2 Jun 2018 10:01:01 +0200, Yann E. MORIN wrote:
> > The manual is GPL-2, and points to the COPYING file in the repository.
> > When we do a rendering of the manual for a specific version, that URL
> > is currently always poitning to the latest version of the COPYING file.
> > 
> > If we ever have to change the content of that file (e.g. to add a new
> > exception, more clarifications, a license change, or whatever), then
> > an old manual would point to that newer version, which would then be
> > incorrect.
> > 
> > Include the sha1 of the commit in the URL, so that the manual always
> > point to the tree at the time the manual was rendered, not the time
> > it is consulted. Contrary to the informative text above, use the full
> > sha1, not the shortened one.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> >  docs/manual/manual.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> To be honest, I am not sure how likely it is that the COPYING file ever
> changes. The copyright is owned by all the authors of the project, so a
> license change would be very difficult to do.

Well, that is for cases where we would add a new exclusion clause (e.g.
like we have for the patches we carry), or whatever change we may have
in this file. Any such change is in fact a license change of the works
as a whole, even when such a change is comp[atible with the existing
license clauses.

For example, if I were to rewrite the manual entirely from scratch,
without re-using parts of the current one, and decided to put that
work under CC-BY-SA-3.0 instead of GPL-2.0, then we would add an
exception for the manual. That exception would be invalid for manuals
rendered from current versions of Buildroot.

For example. ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
