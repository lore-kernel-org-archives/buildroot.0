From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 5 Nov 2016 09:43:54 -0400
Subject: [Buildroot] [PATCH] pseudo: fix build for python3 based distros
In-Reply-To: <20161105134305.463e1cc2@free-electrons.com>
References: <20161105035549.18698-1-gael.portay@savoirfairelinux.com>
 <20161105035549.18698-2-gael.portay@savoirfairelinux.com>
 <20161105134305.463e1cc2@free-electrons.com>
Message-ID: <20161105134352.GA26483@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Nov 05, 2016 at 01:43:05PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  4 Nov 2016 23:55:49 -0400, Ga?l PORTAY wrote:
> > Pseudo is not python3 friendly. It causes build failure on distros using
> > python3 as default python interpretor.
> > 
> > ./maketables enums/*.in
> >   File "./makewrappers", line 327
> >     return """/* This function is not called if pseudo is configured --enable-force-async */
> >                                                                                            ^
> > TabError: inconsistent use of tabs and spaces in indentation
> >   File "./maketables", line 76
> >     print "Flags: set for %s" % self.name
> >                             ^
> > SyntaxError: Missing parentheses in call to 'print'
> > make[2]: *** [Makefile:150: wrappers] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[2]: *** [Makefile:147: tables] Error 1
> > 
> > Those patches make pseudo works with python2 and python3.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  .../0001-Fix-mixed-tab-space-indentation.patch     | 105 ++++++++++
> >  .../0002-Fix-missing-parentheses-at-print.patch    | 190 ++++++++++++++++++
> >  .../0003-Make-it-compatible-with-python3.patch     | 215 +++++++++++++++++++++
> >  3 files changed, 510 insertions(+)
> >  create mode 100644 package/pseudo/0001-Fix-mixed-tab-space-indentation.patch
> >  create mode 100644 package/pseudo/0002-Fix-missing-parentheses-at-print.patch
> >  create mode 100644 package/pseudo/0003-Make-it-compatible-with-python3.patch
> 
> Applied to master, thanks. My understanding is that you are already in
> touch with upstream to get them merged, right?
> 

Okay, perfect. Thanks!

Indeed, I am in touch with Seebs. He is in cc.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
