From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 May 2014 18:03:09 +0200
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <5369F20B.5030903@ozlabs.org>
References: <20131111215435.GC3510@free.fr>
 <5369F20B.5030903@ozlabs.org>
Message-ID: <20140507160308.GA3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-05-07 16:42 +0800, Jeremy Kerr spake thusly:
> > We would like to suggest that the web GUI and the pwclient CLI both
> > display such tags besides each patch, a bit like (hypotetical output of
> > pwclient):
> 
> OK, I have some progress on this one; but wanted to make sure what I'm
> doing is in the direction that'd be generally useful for you.
> 
> How's this look?
> 
>   http://ozlabs.org/~jk/tmp/patchwork-ART.png

Yes, that's good!

I believe you will also add this in the pwclient output, right?

> - there are title attributes on the column header, so you get a tooltip
> saying "Acked-by / Reviewed-by / Tested-by" when hovering over it. The
> actual numbers have specific tooltips too (eg, "2 Acked-by").
> 
> Also, are you wanting to filter by the presence of these tags? Just
> non-zero? How about sorting?

Filtering would be a plus, sure. I'd like to have those filters:

  - has a non-zero A/R/T sum
    -> as a maintainer, I want to handle patches that have already been
       acked/reviewed/tested

  - has a zero A/R/T sum
    -> as a contributor, I want to review patches that have not already
       been acked/reviewed/tested

Maybe something like:

    pwclient list [-t|--tag N]

where N is the A/R/T sum you want to filter on.

> Anyone have objections to adding a small column to the default patch
> lists? Does anyone want to *not* have this information present?

In Buildroot and crosstool-NG, we do use A/R/T. Other projects (eg. VLC)
does not use those flags, so it should be possible to enable/disable
those flags, and disabled by default (to be backward compatible with
existing management scripts.)

In pwclient, maybe show the A/R/T flags only if filtering on them was
requested.

Thanks for putting some efforts in that! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
