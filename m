From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2018 15:36:55 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <da2cf4b2-2fdf-943e-3a7f-2cd6e89f0920@embecosm.com>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
 <20180821140509.162e6c49@windsurf>
 <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
 <20180821131105.GM15347@scaer>
 <da2cf4b2-2fdf-943e-3a7f-2cd6e89f0920@embecosm.com>
Message-ID: <20180821133655.GN15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2018-08-21 14:28 +0100, Mark Corbin spake thusly:
> On 21/08/18 14:11, Yann E. MORIN wrote:
> > No, I'd prefer if we were to actualyl add a .hash file for linux-headers
> > and for linux as well, btw, with the former being a symlink to the
> > latter.
> >
> > So, when you respin, prepare a series that:
> >
> >  1. adds the help text alone,
> >  2. adds a .hash for linux and a symlink to it from linux-headers
> Does this need populating with just the hashes for the current 'default'
> versions, i.e. 4.17.17, 4.16.18, 4.15.18, 4.14.65,...etc. or all
> possible versions (!!!) from kernel.org?

We indeed only want the ones we explicitly refer to from Config.in.

> I presume that custom versions will remain exempt via
> 'BR_NO_CHECK_HASH_FOR' as originally intended?

Exactly, yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
