From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 22:13:28 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
 from the legal-info
In-Reply-To: <520a1ab5-06bb-7a22-1ace-7b4d1febc2c1@mind.be>
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
 <878ttpbq72.fsf@dell.be.48ers.dk> <20161015153246.GG3668@free.fr>
 <ce7a11dc-d228-5724-9821-5ef47eb670dc@lucaceresoli.net>
 <18b75237-c88f-586e-347c-d1c1a1d15cd5@mind.be>
 <20161015173729.GI3668@free.fr>
 <520a1ab5-06bb-7a22-1ace-7b4d1febc2c1@mind.be>
Message-ID: <20161015201327.GA3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-10-15 20:06 +0200, Arnout Vandecappelle spake thusly:
> On 15-10-16 19:37, Yann E. MORIN wrote:
> > On 2016-10-15 19:22 +0200, Arnout Vandecappelle spake thusly:
> >> On 15-10-16 17:40, Luca Ceresoli wrote:
[--SNIP--]
> >>> I suggest listing the three possible cases:
> >>>  * FOO_GEN_LEGAL_INFO = NO: save nothing
> >>>  * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list only
> >>>  * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list + save source
> >>  I hate that we have all these combinations. That was actually my first thought
> >> when I saw this patch: oh no, yet another variation point. But I don't see a way
> >> to simplify it. So OK.
> > The alternative would be:
> >   - get rid of LIBFOO_REDISTRIBUTE
> >   - add LIBFOO_LEGAL_INFO = {IGNORE,LIST,FULL} (or whatever name/values).
> > 
> > Thomas, Peter and Luca were not very happy with such a tristate, and in
> > retrospect, neither am I...
>  Neither am I.

Eh! ;-)

> >>  One remark though: I think the pre- and post-hooks should still run even if
> >> _GEN_LEGAL_INFO = NO.
> > Not so sure... Such hooks are made to save extra stuff into legal-info,
> > or to prepare the package for legal-info. So, if the package is excluded
> > for legal-info, there is no reason to run those hooks to start with, is
> > there?
>  First of all, both _GEN_LEGAL_INFO and _LEGAL_INFO_HOOKS are package-specific
> so the package knows what it's doing.
> 
>  The reason to run hooks is that you may still want to do *something* in the
> legal info for excluded packages. I can't give a concrete example, but I'm
> thinking along the lines of e.g. doing some check and erroring out, or still
> adding some custom information to legal info. You know, what the hooks are meant
> for in the first place :-) The point is, this option disables the normal
> legal-info, but that doesn't mean that there would be no legal-info at all.

I would argue that, if a packager elected to have its package completely
ignored by the legal-info infra, we should just abide by this wish and
just completely ignore it. Altogether.

Let's see what others think... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
