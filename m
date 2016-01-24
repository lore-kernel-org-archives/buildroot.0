From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:20:41 +0100
Subject: [Buildroot] [PATCH 2/2] Qwt package : added dependency to Qt5
 besides Qt.
In-Reply-To: <56A4244D.3090504@mind.be>
References: <1453484674-8951-1-git-send-email-davepiq@yahoo.fr>
 <1453484674-8951-2-git-send-email-davepiq@yahoo.fr>
 <20160122181941.GB3774@free.fr> <56A4244D.3090504@mind.be>
Message-ID: <20160124162041.GF3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, Arnout, All,

On 2016-01-24 02:09 +0100, Arnout Vandecappelle spake thusly:
> On 22-01-16 19:19, Yann E. MORIN wrote:
> > David, All,
> > 
> > On 2016-01-22 18:44 +0100, David Picard spake thusly:
> [snip]
> >> @@ -21,10 +23,14 @@ config BR2_PACKAGE_QWT_OPENGL
> >>  	bool "OpenGL support"
> >>  	depends on BR2_PACKAGE_HAS_LIBGLES
> >>  	depends on BR2_PACKAGE_HAS_LIBEGL
> >> -	select BR2_PACKAGE_QT_OPENGL_ES
> >> +	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
> >> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE
> > 
> > BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL, so
> > it should have been selected too.
> > 
> > However, I'm a bit worried about the complexity here, and I'd rather
> > that we depend on such support rather than select it. So I'd prefer to
> > see:
> > 
> >     depends on BR2_PACKAGE_QT_OPENGL_ES || BR2_PACKAGE_QT5BASE_OPENGL_LIB
> 
>  In that case, it can probably be removed completely and turned into an
> automatic dependency (i.e. just in the .mk file).
> 
>  I also wouldn't bother with legacy handling when this symbol is removed. The
> legacy .config file will already contain BR2_PACKAGE_QT_OPENGL_ES, so once the
> handling is automatic, you just have to run 'make oldconfig' and it will Just
> Work (TM).

Yes, an automatic dependency in the .mk would be perfectly enough, I
guess.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
