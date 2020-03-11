From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:42:56 +0100
Subject: [Buildroot] [PATCH v6 09/28] package/quazip: Convert to qmake
 infra
In-Reply-To: <d138dcb2-3946-c711-d8ee-a7491bf5979b@andin.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-10-anaumann@ultratronik.de>
 <20200217225752.74c34031@windsurf>
 <d138dcb2-3946-c711-d8ee-a7491bf5979b@andin.de>
Message-ID: <20200311224256.7be1235b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 11:00:07 +0100
Andreas Naumann <dev@andin.de> wrote:

> > A prefix of $(STAGING_DIR)/usr looks wrong, as prefix is normally where
> > the things will be once installed in the target. Do we really need to
> > do this change?  
> 
> I agree it's probably not how PREFIX is intended to be used. But after 
> all the project doesnt seem to support cross-compile/install properly as 
> you can see by the need to explicitly set INSTALL_ROOT to a different 
> path for staging/target.

Well, in fact the current install procedure for quazip is perfect, as
you don't have to do the horrible rsync dance that we have to do for
other Qt packages. The fact that INSTALL_ROOT is different for staging
and target is *perfect*, it is exactly how INSTALL_ROOT should be have
in the first place: like DESTDIR.

So I'd really like to see more research done on this package, to
understand why we need to bogus PREFIX= variable, and make sure it
behaves like other packages.

It would in fact be ideal if all other Qt packages could properly
support INSTALL_ROOT like quazip does.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
