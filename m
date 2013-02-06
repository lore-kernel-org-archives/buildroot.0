From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 19:51:25 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <511003DD.4080305@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <453ed921e8645a7271b1b67d1c05ee96819a871b.1359993560.git.yann.morin.1998@free.fr>
 <511003DD.4080305@mind.be>
Message-ID: <201302061951.25769.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Monday 04 February 2013 Arnout Vandecappelle wrote:
> On 04/02/13 17:01, Yann E. MORIN wrote:
> > +	printf '#!/bin/sh\nexec %s -m %s "$$@"\n'   \
> > +	       $(HOST_DIR)/usr/bin/bmake            \
> > +	       $(HOST_DIR)/usr/share/pmake/mk       \
> > +	       >$(HOST_DIR)/usr/bin/pmake
> > +	chmod 0755 $(HOST_DIR)/usr/bin/pmake
> 
>   I should have mentioned this earlier of course, but:
> 
>   I would prefer to have a package/pmake/pmake script that discovers the 
> mk path based on ${0%/*}. That immediately makes it relocatable :-)

Nice catch, indeed! Done. :-)

Thank you,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
