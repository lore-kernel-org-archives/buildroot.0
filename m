From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2012 19:11:24 +0100
Subject: [Buildroot] [PATCH 05/51] package/libiscsi: new package
In-Reply-To: <20121129093925.69619997@skate>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-6-git-send-email-yann.morin.1998@free.fr>
 <20121129093925.69619997@skate>
Message-ID: <201212031911.24673.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 29 November 2012 Thomas Petazzoni wrote:
> On Thu, 29 Nov 2012 00:54:04 +0100, Yann E. MORIN wrote:
> > +LIBISCSI_AUTORECONF = YES
> > +# Having a m4/ directory is mandatory for autoreconf to work
> > +define LIBISCSI_CREATE_M4_DIR
> > +	mkdir -p $(@D)/m4
> > +endef
> > +LIBISCSI_PRE_CONFIGURE_HOOKS += LIBISCSI_CREATE_M4_DIR
> 
> I think the reason why AUTORECONF=YES is needed should be mention with
> a comment on top of it. You don't have any patch touching
> configure.{ac,in} or Makefile.am, so the need for AUTORECONF=YES
> doesn't seem very obvious.

Works like a charm without autoreconf. Probably a leftover from debugging
the initial packaging. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
