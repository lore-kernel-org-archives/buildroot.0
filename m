From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 14:14:24 +0100
Subject: [Buildroot] [PATCH 08/11 v5] package/freerdp: add options to
 enable/disable server and/or client
In-Reply-To: <20150222124815.0b4d9ba4@free-electrons.com>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <44fb109d81db4309f73d7f85fcd533c3f1dee6cb.1424558036.git.yann.morin.1998@free.fr>
 <20150222124815.0b4d9ba4@free-electrons.com>
Message-ID: <20150222131424.GA4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-22 12:48 +0100, Thomas Petazzoni spake thusly:
> One question, see below.
> 
> On Sat, 21 Feb 2015 23:36:21 +0100, Yann E. MORIN wrote:
> > diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> > index cf96ff4..33eacc2 100644
> > --- a/package/freerdp/freerdp.mk
> > +++ b/package/freerdp/freerdp.mk
[--SNIP--]
> > @@ -113,4 +161,10 @@ else
> >  FREERDP_CONF_OPTS += -DWITH_XV=OFF
> >  endif
> >  
> > +else # ! SERVER && ! CLIENT
> > +
> > +FREERDP_CONF_OPTS += -DWITH_X11=OFF
> > +
> > +endif # ! USES_XLIBS
> 
> Is this really ! USES_XLIBS ?

Indeed no, it's a leftover from a previous attempt. It should have been:

    # ! SERVER && ! CLIENT

I'll send a fix-up patch. Sorry for the mess...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
