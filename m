From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 19 Aug 2016 23:24:56 +0200
Subject: [Buildroot] [PATCH] pcre: fix compile error for m68k coldfire
In-Reply-To: <20160819231348.2127118e@free-electrons.com>
References: <20160818062535.GA28475@waldemar-brodkorb.de>
 <20160819231348.2127118e@free-electrons.com>
Message-ID: <20160819212456.GY22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> So we have several options here:
> 
>  1/ Mark pcre as not available for BR2_BINFMT_FLAT_SEP_DATA. But pcre
>     has gazillions of reverse dependencies, and I expect the issue of
>     -msep-data to show up on many many packages, as soon as they have a
>     fairly large binary size.
> 
>  2/ Actually fix up the problem, but I'm not sure it's even doable.
> 
>  3/ Decide that we don't support BR2_BINFMT_FLAT_SEP_DATA at all on
>     m68k. On master, BR2_BINFMT_FLAT_ONE was not available for m68k due
>     to kernel issues, but they have been resolved, and
>     BR2_BINFMT_FLAT_ONE is now enabled on m68k in the next branch. So I
>     would suggest to also enable BR2_BINFMT_FLAT_ONE on m68k in master,
>     disallow the selection of BR2_BINFMT_FLAT_SEP_DATA. If in the
>     future someone is interested by -msep-data on m68k, this person can
>     always restart the work and see how to fix the issues.

I vote for 3)

thanks for the nice summary,
 Waldemar
