From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Dec 2015 23:39:31 +0100
Subject: [Buildroot] [PATCH v7 20/33] package/enlightenment: bump to
 version 0.19.12
In-Reply-To: <5668AC6C.4090802@openwide.fr>
References: <1449523775-6582-1-git-send-email-romain.naour@openwide.fr>
 <1449523775-6582-21-git-send-email-romain.naour@openwide.fr>
 <20151208110626.GG4188@free.fr> <5668AC6C.4090802@openwide.fr>
Message-ID: <20151209223931.GE3743@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-12-09 23:34 +0100, Romain Naour spake thusly:
> Le 08/12/2015 12:06, Yann E. MORIN a ?crit :
> > On 2015-12-07 22:29 +0100, Romain Naour spake thusly:
> >> Use the newly added libefl package wich provide a new version
> >> of efl libraries.
> >> This new version needs libelementary dependency.
> >>
> >> Update upstream url, add hash file and use xz archive.
> >>
> >> Select png and jpeg image loader since enlightenment_start
> >> fail at runtime if png and jpeg image loader are not
> >> available in elf libraries.
> >>
> >> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> >> ---
> >> v6: disable systemd and linux-pam explicitely since it's auto
> >>     detected. (A patch adding their support can be added latter)
> > [--SNIP--]
> >> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
> >> index ddebe06..f2e0bc3 100644
> >> --- a/package/enlightenment/enlightenment.mk
> >> +++ b/package/enlightenment/enlightenment.mk
[--SNIP--]
> >>  ENLIGHTENMENT_CONF_OPTS = \
> >>  	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> >>  	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
> >> -	--disable-rpath
> >> +	--disable-pam \
> >> +	--disable-rpath \
> >> +	--disable-systemd
> > 
> > What if libefl has systemd support but enlightenment hasn't?
> 
> You're right, systemd should be enabled in this case...
> But I haven't fully tested enlightenment with systemd.
> Maybe we can drop the systemd support for libefl for now ?

If you have not tested it, then don't add it, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
