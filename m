From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 18:47:21 +0100
Subject: [Buildroot] [PATCH 1/4] legal-info: extract even
 no-redistribute packages
In-Reply-To: <5328841D.8030100@lucaceresoli.net>
References: <cover.1395097170.git.yann.morin.1998@free.fr>
 <5d5bddd893ac6d6af3bf8caad0e27cfd78b2b960.1395097170.git.yann.morin.1998@free.fr>
 <5328841D.8030100@lucaceresoli.net>
Message-ID: <20140318174721.GA26810@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-03-18 18:36 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> >will not try to extract it first.
[--SNIP--]
> >-# Packages that have a tarball need it downloaded and extracted beforehand
> >-$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
> >+# We need to download the package sources if we are to save it
> 
> Minor nit: package sources <-> save them   (plural)
>        or: package archive <-> save it     (singular)

Yep, thanks! :-)

> This is so smaller than the overall improvement in the patch, and it's
> only in a comment which is understandable anyway, so I would tag this
> patch as Reviewed-by me. But the recently established policy is that
> "If you reviewed a patch and have comments on it, you should simply
> reply to the patch stating these comments, without providing a
> Reviewed-by or Acked-by tag.".
> 
> So I cannot tag here, sorry, but fix this and I'll do so.

Yep, no problem. :-)

> BTW, what if I have comments but would commit as is and improve in a
> successive patch? Should I add Acked/Review-by? This is the case here,
> actually.

I really depends. My opinion is that, on complex changes (like the
switch to the new site), it is important to get the new functionality in
place, and improve gradually, or it would take like forever before it is
ready. And since the new website was entirely replacing the old one
(rather than be a gradual upgrade), it would have never been possible to
update the new website with the incremental changes going into the old
one. So, at one point in time we had to switch for good.

In this case, it's not the same: we are gradually improving existing
code, so I believe the way you did is OK. If you hadn't caught the typo,
it would have been possible to send a follow-up patch fixing it, but
since you spotted it, better fix it first. So I'll fix and respin the
series.

Thanks for the continued reviews! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
