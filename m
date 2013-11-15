From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Nov 2013 21:53:17 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: export PATH
In-Reply-To: <CAHXCMMJnox5o3hfiVgj2vzK=1=pbm85cF+9Jutth-4LRvLB5CA@mail.gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
 <20131111233113.2e11fd88@skate>
 <CAHXCMMJnox5o3hfiVgj2vzK=1=pbm85cF+9Jutth-4LRvLB5CA@mail.gmail.com>
Message-ID: <20131115205317.GG3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, Thomas, All,

On 2013-11-15 21:37 +0100, Samuel Martin spake thusly:
> 2013/11/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> > Dear Samuel Martin,
> >
> > On Mon, 11 Nov 2013 21:59:46 +0100, Samuel Martin wrote:
> > > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > > ---
> > >  Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 4010c65..d587b4f 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -294,6 +294,7 @@ export STAGING_DIR
> > >  export HOST_DIR
> > >  export BINARIES_DIR
> > >  export BASE_DIR
> > > +export PATH:=$(BR2_PATH)
> >
> > Why?
> >
> 
> To me, this could make easier writing post-{build,image} scripts.

Indeed, it *is* usefull for those scripts.

The first thing I do in br.config is to exactly set PATH to include the
host/usr/bin and host/usr/sbin directories in front of the user's PATH.

But maybe we should just set PATH at the time we call them?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
