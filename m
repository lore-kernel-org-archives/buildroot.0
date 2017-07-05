From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jul 2017 09:09:16 +0200
Subject: [Buildroot] [PATCH 02/13] core/pkg-download: change all helpers
 to use common options
In-Reply-To: <add0922b-b2ac-81cd-03a6-1dd86487a926@mind.be>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-3-maxime.hadjinlian@gmail.com>
 <fbacea0c-0c08-d8d0-9cda-3e404207ab1d@mind.be>
 <20170704231413.GC3499@scaer>
 <add0922b-b2ac-81cd-03a6-1dd86487a926@mind.be>
Message-ID: <20170705070916.GD3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-05 02:38 +0200, Arnout Vandecappelle spake thusly:
> On 05-07-17 01:14, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2017-07-05 01:09 +0200, Arnout Vandecappelle spake thusly:
> >> On 04-07-17 18:22, Maxime Hadjinlian wrote:
> >>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>> diff --git a/support/download/check-hash b/support/download/check-hash
> >>> index c1ff53c02b..bf2dbb1a8b 100755
> >>> --- a/support/download/check-hash
> >>> +++ b/support/download/check-hash
> >>> @@ -19,7 +19,7 @@ set -e
> >>>  #   3:  the hash file exists and there was no hash to check the file against
> >>>  #   4:  the hash file exists and at least one hash type is unknown
> >>>  
> >>> -while getopts :q OPT; do
> >>> +while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> >>
> >>  This doesn't make sense to me: the global DL_GETOPTS are never passed to
> >> check-hash, and you're not using any of them. So I'd keep the explicit :q here.
> > 
> > It took me a bit of time to understand what you meant, because
> > BR_BACKEND_DL_GETOPTS is actually exported by dl-wrapper, and it is
> > dl-wrapper that calls check-hash. So let me rephrase it, and you'll tell
> > me if I understood correctly:
> > 
> >     This doesn't make sense to me: none of the variabels from
> >     BR_BACKEND_DL_GETOPTS are ever passed to check-hash, so [...]
> 
>  Yes, that's what I meant. I guess I don't formulate very clearly at 01:09 (much
> less at 02:38...)

Oh come on, you woke up at 11 in the morning! Aha! ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
