From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:34:48 +0200
Subject: [Buildroot] [PATCH 2/2 v4] odroid-mali: New Package.
In-Reply-To: <trinity-433daad2-ef46-4fa5-91d7-8ad0ed76e138-1469366971377@3capp-mailcom-bs05>
References: <20160724055602.7159-1-daggs@gmx.com>
 <20160724055602.7159-2-daggs@gmx.com>
 <20160724144418.79f779f4@free-electrons.com>
 <trinity-433daad2-ef46-4fa5-91d7-8ad0ed76e138-1469366971377@3capp-mailcom-bs05>
Message-ID: <20160724153448.2e33f760@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 15:29:31 +0200, daggs wrote:

> > >  package/Config.in                    |  1 +
> > >  package/odroid-mali/Config.in        | 21 +++++++++++++++++++++
> > >  package/odroid-mali/odroid-mali.hash |  2 ++
> > >  package/odroid-mali/odroid-mali.mk   | 36 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 60 insertions(+)
> > >  create mode 100644 package/odroid-mali/Config.in
> > >  create mode 100644 package/odroid-mali/odroid-mali.hash
> > >  create mode 100644 package/odroid-mali/odroid-mali.mk  
> >   
> > > +	depends on BR2_PACKAGE_ODROID_SCRIPTS  
> > 
> > Why do you have this dependency?  
> 
> because afaiu, this will not work if the scripts form odroid-scripts got executed.

I guess you meant "if the scripts from odroid-scripts were *not*
executed", right ?

If that's the case, then I believe a "select
BR2_PACKAGE_ODROID_SCRIPTS" is probably better.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
