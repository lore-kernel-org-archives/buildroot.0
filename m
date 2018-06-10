From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 10:35:44 +0200
Subject: [Buildroot] [PATCH] docs/manual: document filesystems
In-Reply-To: <20180610081217.GB2471@scaer>
References: <20180609094647.21460-1-yann.morin.1998@free.fr>
 <1806912659.2037633.1528582803656.JavaMail.zimbra@datacom.com.br>
 <20180610081217.GB2471@scaer>
Message-ID: <20180610083544.GC2471@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, Arnout, All,

On 2018-06-10 10:12 +0200, Yann E. MORIN spake thusly:
> On 2018-06-09 19:20 -0300, Carlos Santos spake thusly:
[--SNIP--]
> > Packages are supposed to install, remove or modify files in the global
> > $(TARGET_DIR) hierarchy.

I forgot to say that this will no longer be true when we (eventually)
introduce the top-level parallel build, because, as Arnout already said,
each package will install in its own, private copy of TARGET_DIR, not
only that, but also its private STAGING_DIR and HOST_DIR as well.

One thing that Arnout suggested, is to (mostly) get rid of TARGET_DIR,
in favour of a package-prefix FOO_TARGET_DIR (amd similarly for
filesystems).

However I still don't think that is a good idea, because that would
allow packages to easily find and write into another package's
TARGET_DIR. Using a single TARGET_DIR, instead, will make it harder
(but not impossible, agreed).

Ditto filesystems.

So I believe we still want to keep a context-specific TARGET_DIR. It is
easier to use, it is more stable, we can update it at will, and it makes
it harder for packages and filesystems to do weird stuff.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
