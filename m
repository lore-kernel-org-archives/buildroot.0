From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 19:43:10 +0200
Subject: [Buildroot] [PATCH 10/30] package/matchbox: remove superfluous
 conditional includes
In-Reply-To: <55396BAB.2020206@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <71ea29cc98ad7d3f0278f14b50837784776b12ca.1429725549.git.yann.morin.1998@free.fr>
 <55396BAB.2020206@mind.be>
Message-ID: <20150424174310.GE4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-24 00:01 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
> > Now that the matchbox package no longer forcibly add entries to the
> > PACKAGES list, and entirely relies on having proper packages, we can
> > safely include all matchbox sub-packages .mk files, and the pkg-infra
> > will take care of building only those that are enabled.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  This could already been done after patches 1 and 2.

It might be possible to do so, but I'd prefer all matchbox packages to
be converted/cleaned-up first, in case there's an unwanted side-effect
in the package infra about a package with no Kconfig entry.

So, I'm not moving that patch (also due to some lazyness in testing
there would be no problem! ;-] ).

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
