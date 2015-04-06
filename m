From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 10:56:02 +0200
Subject: [Buildroot] Target to create missing hashes.
In-Reply-To: <5521BE08.9020304@proximus.be>
References: <5521BE08.9020304@proximus.be>
Message-ID: <20150406085602.GA4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2015-04-06 00:58 +0200, Johan Sagaert spake thusly:
> Would be nice to have a convenience make target to create missing hashes.
> (Comes in handy for custom packages not available in upstream buildroot, or
> when bumping versions before posting the patches to the mailing list.)
> 
>  make  <pkg>-sha256_hash

Well, we do not want the hashes to be automatically created, because we
want them to come from upstream if possible, and only if upstream does
not provide hashes do we locally compute them.

So, we can't offer an automatic way to create hashes. It has to be a
manual process.

> Maybe the missing hash warnings should also be redirected to a file
> .missing_hashes, they mostly go unnoticed otherwise while building.

Well, I have a series that makes missing hashes a hard error (when the
.hash file exists), so that will be caught fairly easily! ;-) And a
missing .hash file would become a warning for now, with the ultimate
goal of making it a hard error in the future (because we do not have
enough packages with a .hash file for now).

There is the idea floatign around of creating a check-package (or
check-patch) script that could be used to validate a new package, and
checking a .hash file exists could be part of that script.

Any taker? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
