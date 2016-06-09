From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 21:28:20 +0200
Subject: [Buildroot] [PATCH 2/2] python-meson: new package
In-Reply-To: <20160609195954.52b9a527@itchy>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160608222250.6d493138@free-electrons.com>
 <20160609195954.52b9a527@itchy>
Message-ID: <20160609212820.6816f3db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 9 Jun 2016 19:59:54 +0200, Eric Le Bihan wrote:

> It is true that all the "docs/manual/adding-packages*.txt" files refer
> to a dedicated infrastructure, whereas what is needed here is an
> example of Makefile using the generic-package infrastructure. There is
> an exception to the rule, though: docs/manual/adding-packages-gettext.txt.
> 
> So, IMHO, a new document named "docs/manual/adding-packages-meson.txt" should 
> fit.

Sounds good.

> However, I could provide a real package infrastructure named "meson-package",
> but as stated in the discussion about adding support for Cargo [1] (the Rust
> package manager), to provide such infrastructure, at least one package using
> it should also be provided (it is sensible to have a working example of 
> the infrastructure).

I would not say one, but at least 4-5 packages, with a pretty good
confidence that more packages would be added later on.

> > > +
> > > +define HOST_PYTHON_MESON_REMOVE_GUI_TOOL
> > > +	rm -f $(HOST_DIR)/usr/bin/mesongui.py
> > > +endef    
> > 
> > Not sure removing stuff from the host variant is really useful.  
> 
> This program needs PyQt5, which may not be installed by default by the
> most popular GNU/Linux distributions. The user may be tempted to use
> it: the execution will fail and this may result in an unnecessary
> Buildroot bug report. To avoid this, I chose to remove it.

We don't bother doing such cleanup steps for host packages, I really
don't think it's worth it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
