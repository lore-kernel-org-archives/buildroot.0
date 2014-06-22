From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 00:40:49 +0200
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <53A759EB.8090702@zacarias.com.ar>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622215442.4c060328@free-electrons.com>
 <53A759EB.8090702@zacarias.com.ar>
Message-ID: <20140622224049.GF21768@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-22 19:34 -0300, Gustavo Zacarias spake thusly:
> On 06/22/2014 04:54 PM, Thomas Petazzoni wrote:
> 
> >> +	  GeoIP is a C library that enables the user to find geographical
> >> +	  and network information of an IP address.
> >> +	  To use this library, you need to download MaxMind's free GeoLite or
> >> +	  commercial GeoIP binary databases into the target's /usr/share/GeoIP
> >> +	  directory in uncompressed form.
> > 
> > Wouldn't it make sense to create a package for the free database, so
> > that GeoIP can be useful out of the box?
> 
> As the current infra is right now, not really, even with fixes i
> wouldn't go for it.
> That's because the tarball naming is fixed (no hash, timestamp or
> anything) and they change at least daily, so an old
> sources.buildroot.net copy/mirror could be really old.
> Even if we can say "don't mirror it" the same can happen to people with
> their local copy.

Then would it make sense to package geoipudate instead, either or both
as a target and/or a host package:
    https://github.com/maxmind/geoipupdate

    The GeoIP Update program performs automatic updates of GeoIP2 and
    GeoIP Legacy binary databases.

That way, the user can get it with a post-build script, and/or a
cron-like job on the target, to be up-to-date.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
