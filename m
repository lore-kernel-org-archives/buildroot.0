From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 15:29:09 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/luvi: bump version to 2.8.0
In-Reply-To: <3c2105ff5b2fb60820f63e1d7851ddda2ec48355.camel@embedded.rocks>
References: <20180819120219.28721-1-bernd.kuhls@t-online.de>
 <3c2105ff5b2fb60820f63e1d7851ddda2ec48355.camel@embedded.rocks>
Message-ID: <20181010152909.2f85fd4c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, Bernd,

On Tue, 21 Aug 2018 20:52:45 +0200, J?rg Krause wrote:

> > -LUVI_VERSION = v2.7.6
> > -LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
> > -LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
> > +LUVI_VERSION = v2.8.0
> > +LUVI_SITE = https://github.com/luvit/luvi.git
> > +LUVI_SITE_METHOD = git
> > +LUVI_GIT_SUBMODULES = YES
> >  LUVI_LICENSE = Apache-2.0
> >  LUVI_LICENSE_FILES = LICENSE.txt
> >  LUVI_DEPENDENCIES = libuv luajit luv host-luajit  
> 
> I am not so happy about the version bump as version 2.8.0 does only
> updates the projects submodules, which we are not using at all.
> Instead, we always build luvi with dependencies provided as packages in
> Buildroot.
> 
> Bumping to version 2.8.0 has the drawback that fetching the package
> needs much longer now due to the git submodules than fetching the
> tarball and building against the packages provided by Buildroot.

Should we revert this 2.8.0 bump then ? If you want to do that, could
you send a patch, and made add a comment in luvi.mk that explains why
bumping to 2.8.0 is useless ?

Also, luvi 2.8.0 has been causing a number of build failures:
http://autobuild.buildroot.net/?reason=luvi-v2.8.0. They need to be
fixed, or indeed reverting will be the only solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
