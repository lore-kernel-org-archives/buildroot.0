From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 18:19:03 +0200
Subject: [Buildroot] [git commit] kmod: disable manpages for host-kmod
In-Reply-To: <b95086f02b4d393fa6f90f388a0f20d3@www.sysmic.org>
References: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
 <b95086f02b4d393fa6f90f388a0f20d3@www.sysmic.org>
Message-ID: <20130904181903.165c5cd4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 04 Sep 2013 17:50:47 +0200, J?r?me Pouiller wrote:

> >  ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> >  KMOD_CONF_OPT += --disable-manpages
> >  endif
> What happens when BR2_HAVE_DOCUMENTATION is enabled? I think same 
> problem happens.
> 
> We should add a dependency to host-libxslt and I think we can pass 
> variable XSLTPROC= to ./configure to use a specific location of 
> xsltproc.

Yes, we normally should. But nobody seems to be testing or using
BR2_HAVE_DOCUMENTATION. I would personally be in favor of just getting
rid of BR2_HAVE_DOCUMENTATION. Who needs the documentation to be
installed on the target?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
