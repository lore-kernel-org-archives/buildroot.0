From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 09:06:14 +0200
Subject: [Buildroot] [PATCH v5] bcache-tools: Adding package.
In-Reply-To: <20140806214852.GG1587@free.fr>
References: <1407259782-6012-1-git-send-email-jcd@tribudubois.net>
 <20140806214852.GG1587@free.fr>
Message-ID: <20140807090614.574ba202@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 6 Aug 2014 23:48:52 +0200, Yann E. MORIN wrote:

> > +# The bcache-tools Makefile expects the man8 directory to exist.
> > +define BCACHE_TOOLS_INSTALL_MAN8
> > +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
> > +endef
> 
> In Buildroot, the man pages are simply removed from the target/ dir jsut
> prior to generatign the filesystem images.
> 
> Then, why not simply patch the Makefile to not install them in the first
> place? Like, in a post-extract hook.

I disagree. I would prefer to make a patch that actually fixes the
installation of the man pages and submit this patch upstream. This way,
when upstream releases a new version, we can get rid of the patch, and
simply do "make install" without any other thing to do. Buildroot will
take care of removing the man pages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
