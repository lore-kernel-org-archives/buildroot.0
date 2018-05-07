From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 22:51:05 +0200
Subject: [Buildroot] [PATCH 1/5] package/lua-flu: fix to use system
 xattr header
In-Reply-To: <20180507202934.GF14524@scaer>
References: <20180507212228.42f1f716@windsurf> <20180507202934.GF14524@scaer>
Message-ID: <20180507225105.09f9fd58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 May 2018 22:29:34 +0200, Yann E. MORIN wrote:

> > > diff --git a/package/lua-flu/0001-use-system-xattr-h.patch b/package/lua-flu/0001-use-system-xattr-h.patch
> > > new file mode 100644
> > > index 0000000000..fda03b60c6
> > > --- /dev/null
> > > +++ b/package/lua-flu/0001-use-system-xattr-h.patch
> > > @@ -0,0 +1,161 @@
> > > +Use system <sys/xattr.h>
> > > +
> > > +The one from attr is no longer installed with latest version.
> > > +
> > > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>  
> > 
> > This could have been a Mercurial-formatted patch. I think you know how
> > to use Mercurial :-)  
> 
> Well, to be hionest,m I was indeed preparing the patch for submission
> upstream (now done: https://bitbucket.org/doub/flu/pull-requests/1) and
> I really struggled using hg... :-/

Can I say: "ha ha" ? :-)

> > I do understand all the attr/xattr.h -> sys/xattr.h changes, but I
> > don't understand the ENOATTR -> ENODATA changes. Has the ENOATTR error
> > code disappeared ? What makes ENODATA a suitable replacement ?  
> 
> Oh, right; I forgot to explain that one.
> 
> attr, in <attr/xattr.h>, was doing:
> 
>     #ifndef ENOATTR
>     # define ENOATTR ENODATA
>     #endif
> 
> Ergo, ENOATTR is just ENODATA.

OK, makes sense. Explaining it in the patch description would help,
then.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
