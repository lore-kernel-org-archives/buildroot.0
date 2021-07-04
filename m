From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 14:09:59 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210704113208.GC2521@scaer>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210704111539.3ce01855@windsurf>
 <87k0m61gxf.fsf@dell.be.48ers.dk> <20210704113208.GC2521@scaer>
Message-ID: <20210704120959.GD2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas?, All,

On 2021-07-04 13:32 +0200, Yann E. MORIN spake thusly:
> On 2021-07-04 13:01 +0200, Peter Korsgaard spake thusly:
> > >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> >  > On Tue,  1 Jun 2021 16:34:07 +0200
> >  > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> >  >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >  >> 
> >  >> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
> >  >> it is set, then the assert statement is compiled away.
> >  >> 
> >  >> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> >  >> default case).
> >  >> 
> >  >> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >  > So, I would like to challenge whether this change is really a good
> >  > idea. Since this has been merged, we had to add a significant number of
> >  > patches to undefine NDEBUG.

"Significant", being just 2 packages I had to revert as they do not have
corresponding upstream changes, or upstream expressly refused to support
NDEBUGi: bitcoin and weston. A few others have had the NDEBUG changes
accepted upstream, and for some wee even have updated to a version with
those patches.

Plus 6 patches pending in patchwork:
  - gcc: the issue is not trivial: -Werror or -DNDEBUG?
  - sane-backends: merged upstream
  - tor: can't build with NDEBUG
  - casync: can't with NDEBUG
  - qemu: can't with NDEBUG
  - xen: is already using NDEBUG, but causes -Werror issues

So, that's 8 packages affected by NDEBUG, of which 6 or 7 are going to be
an issue. I would not call that 'significant' yet.

However, as I said earlier, I still think this is not worth the effort,
indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
