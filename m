From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 29 Oct 2009 22:01:10 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E2539B@mi8nycmail19.Mi8.com>
References: <20091025224056.59c9a6ef@surf><20091027090628.0aa7b0df@surf>
	<20091029163916.49c81f50@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901E2539B@mi8nycmail19.Mi8.com>
Message-ID: <1256850070.2291.1304.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 29 octobre 2009 ? 13:11 -0400, H Hartley Sweeten a ?crit :
> On Thursday, October 29, 2009 8:39 AM, Thomas Petazzoni wrote:
> > I have one naming issue in the generic package infrastructure
> > (package/Makefile.package.in) on which I'd like to get your input. The
> > generic package infrastructure let the package specific .mk file
> > specify what the configure, build and install steps should do, by
> > defining variables :
> > 
> >  <PKG>_CONFIGURE for configure
> >  <PKG>_BUILD for build
> > 
> > for installation, I wanted to use
> > 
> >  <PKG>_INSTALL_STAGING for staging installation
> >  <PKG>_INSTALL_TARGET for target installation
> > 
> > but these variables are already existing boolean variables (YES/NO)
> > that allows the package to specify whether it wants TARGET installation
> > and/or STAGING installation. So we have a naming conflict, that I
> > solved by using
> > 
> >  <PKG>_INSTALL_STAGING_CMDS
> >  <PKG>_INSTALL_TARGET_CMDS
> > 
> > for the variables that a package specific .mk must define to list the
> > operations to be performed at staging install and target install. But I
> > don't like this naming since it isn't coherent with <PKG>_CONFIGURE and
> > <PKG>_BUILD.
> > 
> > Any suggestion ?
> 
> How about changing the boolean variables to:
> 
> <PKG>_STAGING_INSTALL to indicate a STAGING installation is wanted
> <PKG>_TARGET_INSTALL to indicate a TARGET installation is wanted
> 
> Then you can use:
> 
> <PKG>_INSTALL_STAGING for staging installation
> <PKG>_INSTALL_TARGET for target installation

Sound confusing...

I would rather prefer <PKG>_INSTALL_TARGET or <PKG>_HAS_INSTALL_TARGET.
