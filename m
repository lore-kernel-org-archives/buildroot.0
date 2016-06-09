From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Jun 2016 00:00:24 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <20160609235011.3bd057ea@free-electrons.com>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160609224203.599c50c1@free-electrons.com>
 <20160609211911.GC3826@free.fr>
 <20160609233816.1a494a7a@free-electrons.com>
 <20160609214806.GE3826@free.fr>
 <20160609235011.3bd057ea@free-electrons.com>
Message-ID: <20160609220024.GA17968@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-09 23:50 +0200, Thomas Petazzoni spake thusly:
> On Thu, 9 Jun 2016 23:48:06 +0200, Yann E. MORIN wrote:
> 
> > > However, since there has been apparently no movement on that side
> > > upstream, then let's just add the dependency that you suggested.  
> > 
> > OK, I guess you meant have Kodi depends on .py files to be presetn (not
> > the other proposal to require .py files), right?
> 
> Correct:
> 	depends on BR2_PACKAGE_PYTHON_PY_ONLY || BR2_PACKAGE_PYTHON_PY_PYC
> or
> 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
> 
> not sure which one is best.

I already choose the first.

Note however that this means we can no longer select python, or we'd
have an impossible situation and a circular dependency. So we need to
also depend on python... :-/

> I am not sure what other way around is possible, but I'm probably
> missing something.

Not as far as I can see...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
