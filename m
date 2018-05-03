From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 May 2018 22:04:15 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180503215631.6f62e406@windsurf>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf>
Message-ID: <20180503200415.GC2453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2018-05-03 21:56 +0200, Thomas Petazzoni spake thusly:
> On Wed,  2 May 2018 12:05:08 +0300, Stefan Becker wrote:
> > crypt() is an optional glibc feature. Some distros, like Fedora 28, are
> > phasing it out to be replaced with libxcrypt [1]. Unfortunately this
> > change is only ABI compatible, not source code compatible, i.e. the code
> > will compile with warnings about undefined crypt(), but the resulting
> > binary will crash.
> > 
> > Follow the guidance in the Fedora bug and include crypt.h when
> > _XOPEN_CRYPT is not defined.
> > 
> > [1] https://bugzilla.redhat.com/show_bug.cgi?id=1566464
> > 
> > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> > ---
> >  package/mkpasswd/mkpasswd.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> Applied to master, thanks.

Although in the long run, I believe it might be preferrable that we
ditch our own bundled version, and switch to making our whois package a
hot pacakge, and use that as the provider for mkpasswd.

Stefan, would you want to do that? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
