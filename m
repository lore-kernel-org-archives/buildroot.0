From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Dec 2015 22:42:29 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151202073542.GY23754@vapier.lan>
References: <20151202073542.GY23754@vapier.lan>
Message-ID: <20151206214229.GE4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

On 2015-12-02 02:35 -0500, Mike Frysinger spake thusly:
> the busybox.net software has been languishing for quite a long time,
> so i gave it a strong kick today.  just about every piece of software
> has been upgraded on the box including bugzilla.  my various testing
> looks like it still works, but if you guys notice anything weird, feel
> free to let me know.

Yes, I've noticed that buildroot.org has switched to https with:
    Strict-Transport-Security: max-age=63072000; includeSubDomains

Unfortunately, we do have subdomains that are not https-enabled, and are
on another machine:
    http://autobuild.buildroot.org/

But now, because of https-sts, this sub-domain is no longer reachable.

To be noted, once a browser has seen the hsts settings once, it will keep
them for how long it has been specified, that is 63072000 seconds in our
case, which is about 730 days, or 2 years.

Which means anyone that has visited buildroot.org will be blocked from
the sub-domains for the next two years (unles sthey switch to https
too).

What can we do about this?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
