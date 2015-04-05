From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 11:12:04 +0200
Subject: [Buildroot] [PATCH 1/1 v2] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <55206B0F.6080206@proximus.be>
References: <1427919153-16080-1-git-send-email-sagaert.johan@proximus.be>
 <20150401223752.0fd358cf@free-electrons.com>
 <551C6935.3050401@mind.be>
 <20150402000158.0b85c847@free-electrons.com>
 <20150402220612.GD4229@free.fr> <55206B0F.6080206@proximus.be>
Message-ID: <20150405091204.GB4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2015-04-05 00:51 +0200, Johan Sagaert spake thusly:
> Yann E. MORIN schreef op 3/04/2015 om 0:06:
[--SNIP--]
> >Well, I always find it very frustrating to build something that I do not
> >use. 20 seconds is an eternity (even the 15-or-so it takes here).
[--SNIP--]
> What about overhead for checking hashes ?

That's not exactly the same purpose.

Hashes are an integral part of the infrastructure that ensure the
integrity (and authenticity) of the downloaded archives. That's the
reason they are mandatory. Also, hashing is not that slow: sha256 on
~256MiB takes about 1s here, where lzo takes ~20s.

lzo/lz4 on the other hand are a dependency of some optional kernel
features.

> Meanwhile i submitted a new patch with a menu entry in the kernel section.

Thanks! :-) I'll have a look at it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
