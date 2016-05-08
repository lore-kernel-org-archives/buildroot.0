From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 May 2016 09:25:27 +0200
Subject: [Buildroot] [PATCH 01/13 v6] support/scripts: add helper to
 hardlink-or-copy
In-Reply-To: <c09bf375-50ae-5e3d-77a1-4637c34bb888@mind.be>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <0b6395f0d572eec63e4f14fd02d094b5b60f3de9.1461881416.git.yann.morin.1998@free.fr>
 <8e95b534-d9f0-5582-a0a8-495e018d88b8@mind.be>
 <20160505223841.GE4367@free.fr>
 <c09bf375-50ae-5e3d-77a1-4637c34bb888@mind.be>
Message-ID: <20160508072526.GA24011@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-05-07 20:44 +0200, Arnout Vandecappelle spake thusly:
> On 05/06/16 00:38, Yann E. MORIN wrote:
> >Arnout, All,
> >
> >On 2016-05-04 00:53 +0200, Arnout Vandecappelle spake thusly:
> >>On 04/29/16 00:27, Yann E. MORIN wrote:
> [snip]
> >>>+# hardlink-or-copy -- helper script to first try to hardlink,
> >>>+# and fallback to copy.
> >>>+HARDLINK_OR_COPY := support/scripts/hardlink-or-copy
> >>
> >> = instead of :=
> >>
> >>
> >> However (and here starts the difference of opinion in coding style): why do
> >>you need to define a variable for this? In general, I'm not a big fan of
> >>variables that just contain a constant string. For numbers, it makes sense,
> >>because a number is meaningless by itself. But a string is already something
> >>that is searchable and identifiable. And in this specific case, the variable
> >>name is even the same as the value... So what's the point? OK, you save 13
> >>characters in every place where you use it (that's in only 2 (TWO) places,
> >>by the way).
> >>
> >> We do have a few existing cases of such variables, but IMHO they are
> >>equally useless. And mostly introduced by you, BTW :-)
> >
> >Well, when the thing s used in multiple places, I find it "better" to
> >use a variable so as to be able to change all locations at once with a
> >single edit (even if we don't plan on renaming or moving it).
> 
>  I was going to build a big argument about why I disagree, but I see in v7
> you already dropped the variable so let's leave it at that :-)

Out of curiosity, what's your argument against having such a variable?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
