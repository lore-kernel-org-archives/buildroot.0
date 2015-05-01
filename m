From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 18:22:34 +0200
Subject: [Buildroot] [PATCH 2/7] pkg-infra: assign BR_NO_CHECK_HASH_FOR
 so it is recursively-expanded
In-Reply-To: <55439FA7.1010807@mind.be>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <e8cce5d9bbb1b75dbf02c0f9ee44ee23a0314d38.1430260630.git.yann.morin.1998@free.fr>
 <55437A92.3060007@mind.be> <20150501152648.GA4206@free.fr>
 <55439FA7.1010807@mind.be>
Message-ID: <20150501162234.GF4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 17:45 +0200, Arnout Vandecappelle spake thusly:
> On 01/05/15 17:26, Yann E. MORIN wrote:
> > On 2015-05-01 15:07 +0200, Arnout Vandecappelle spake thusly:
> >> On 29/04/15 00:39, Yann E. MORIN wrote:
[--SNIP--]
> > Exactly. However, there's nothing like so explained in the make manual.
> 
>  So patch the make manual :-)

Eh! ;-)

[--SNIP--]
> > Do you prefere I use your even-more-simplified test-case, or may I keep
> > the reduced test-case I provided that ressemble our current code-path?
> 
>  Well, the relevant part of our current code path (taking your example) is:
> 
> export FOO
> FOO += $(BAR_S)
> BAR_S = bar.tar
> 
>  Whether or not BAR_V and FOO are defined in two separate conditional branches
> and whether or not BAR_S contains a reference to BAR_V is really irrelevant.
> 
>  If you want to make it resemble our code path more, then just use the real
> variable names:
> 
> export BR_NO_CHECK_HASH_FOR
> BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
> XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2

Right, will switch to using those three lines.

> >>>  # Expressly do not check hashes for those files
> >>> -export BR_NO_CHECK_HASH_FOR
> >>> +# It needs to be assigned so as to be a recursively-expanded variable, and
> >>> +# so that it can be assigned inside conditionals.
> >>
> >> # Exported variables default to immediately expanded,
> > 
> > I would avoid stating that. That's the behaviour we observed, but
> > nothing is said about that in the make manual. If a future version of
> > make changes that behaviour, the comment would be wrong.
> 
>  Then say "in some versions of make".

OK.

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
