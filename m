From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Mar 2018 23:23:42 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301230427.28e24d47@windsurf.lan>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
 <87lgfbiyk8.fsf@dell.be.48ers.dk>
 <20180301170807.2cd21163@windsurf.lan>
 <87a7vriudq.fsf@dell.be.48ers.dk>
 <20180301230427.28e24d47@windsurf.lan>
Message-ID: <20180301222342.GF2449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2018-03-01 23:04 +0100, Thomas Petazzoni spake thusly:
> On Thu, 01 Mar 2018 18:21:53 +0100, Peter Korsgaard wrote:
> >  >> dumb-init doesn't depend on any libraries, so the only issue is static
> >  >> linking with glibc, right?  

One can do a static link with glibc, as long as one does not do any name
resolution (username, hostname, etc...). But basically, static linking
with glibc has long been frowned upon...

> >  > No, you can also have musl or uclibc configured shared-only, which is
> >  > the case by default since BR2_SHARED_LIBS=y.  
> > 
> > Yes, but static linking against libc still works in that case, right?
> 
> I'm not sure you have libc.a with uClibc or musl if you build
> shared-only.

I did a quick build here, and indeed, uClibc-ng does still provide a
libc.a when doing a shared-only build. Same goes for musl.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
