From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 17:32:05 +0200
Subject: [Buildroot] [PATCH 4/7] boot/barebox: do not check hash for
 custom versions
In-Reply-To: <55437C59.2080502@mind.be>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <895f0c166335e5dfb49a30dd8cf0b2986a5f7431.1430260630.git.yann.morin.1998@free.fr>
 <55437C59.2080502@mind.be>
Message-ID: <20150501153205.GC4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 15:15 +0200, Arnout Vandecappelle spake thusly:
> On 29/04/15 00:40, Yann E. MORIN wrote:
[--SNIP--]
> > @@ -18,6 +19,9 @@ else
> >  # Handle stable official Barebox versions
> >  BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
> >  BAREBOX_SITE = http://www.barebox.org/download
> > +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
> > +BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
> > +endif
> >  endif
> 
>  Same comment as for U-Boot.

Same answer. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
