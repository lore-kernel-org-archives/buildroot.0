From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 5 May 2013 22:19:32 +0200
Subject: [Buildroot] [PATCH 1/1] ser2net: add default init script
In-Reply-To: <20130505145814.GB3246@free.fr>
References: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
 <20130505135025.GA3246@free.fr>
 <20130505143252.GA13672@game.jcrosoft.org>
 <20130505145814.GB3246@free.fr>
Message-ID: <20130505201932.GB13672@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16:58 Sun 05 May     , Yann E. MORIN wrote:
> Jean-Christophe, All,
> 
> On Sun, May 05, 2013 at 04:32:52PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 15:50 Sun 05 May     , Yann E. MORIN wrote:
> > > Jean-Christophe, All,
> > > 
> > > See my comments inlined below.
> > > 
> > > On Sun, May 05, 2013 at 02:43:05PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > > add option to specify the configuration file
> > > > 
> > > > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > > > ---
> > > >  package/ser2net/Config.in  |    9 +++++++++
> > > >  package/ser2net/S50ser2net |   48 ++++++++++++++++++++++++++++++++++++++++++++
> > > >  package/ser2net/ser2net.mk |   27 +++++++++++++++++++++++++
> > > >  3 files changed, 84 insertions(+)
> > > >  create mode 100644 package/ser2net/S50ser2net
> > > > 
> > > > diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
> > > > index e3b8870..3480d85 100644
> > > > --- a/package/ser2net/Config.in
> > > > +++ b/package/ser2net/Config.in
> > > > @@ -8,5 +8,14 @@ config BR2_PACKAGE_SER2NET
> > > >  
> > > >  	  http://ser2net.sourceforge.net
> > > >  
> > > > +if BR2_PACKAGE_SER2NET
> > > > +
> > > > +config BR2_PACKAGE_SER2NET_CONF
> > > > +	string "Configuration file"
> > > > +	help
> > > > +	  Configuration file.
> > > 
> > > I think we should provide a default, basic configuration file that we
> > > install unconditionnally to the rootfs. The user will then be free to
> > > provide a post-build script to tweak that file.
> > 
> > I hate post-build it's not trackable and as it's completly board specific with
> > x serial to export I do not want a generic file
> 
> It's not about what *you* want, it's about what is *best* for Buildroot
> and *all* its users, *and* is maintenable and easily reproduced (which
> pointing to a config file outside of the buildroot tree is definitely
> not) *and* can fit your use case (which what I suggest should).

I want to put the ser2net.conf in the tree not our of tree
> 
> We're speaking about a _default_ and _simple_ configuration file. Of
> course it can not cover all use cases, but just exporting a single
> serial port would be enough. Customisation beyond that is really part of
> the post-build scripts.
the problem here which port you export?

the ttyS0? no it's mostly the default console

how could you even think of any generic file as the name of the port(s) and
configuration is board specific

This will be completly board specific

Best Regards,
J.
