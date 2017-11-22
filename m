From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 09:49:26 +0100
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171122083709.lwprqlkpjcyzour3@sapphire.tkos.co.il>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122085327.084ef828@windsurf.lan>
 <20171122083709.lwprqlkpjcyzour3@sapphire.tkos.co.il>
Message-ID: <20171122094926.17e557d2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Nov 2017 10:37:10 +0200, Baruch Siach wrote:

> > If it's a runtime dependency...
> >   
> > > -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> > > +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs  
> > 
> > ...you don't need to list it in <pkg>_DEPENDENCIES.  
> 
> This is probably right in this case, since there is no in-tree host-rauc 
> dependency. But in the general case a host package might be used at any point 
> in the build. So you need to make sure that, e.g., host-squashfs is ready when 
> host-rauc is to run, right?

Hum, you are right. I was thinking that host-rauc tools would be use
only in a post-image script, or after the build has finished. But
indeed, the tools can also be used by another package that depends on
host-rauc.

So: you're right, adding host-squashfs to <pkg>_DEPENDENCIES is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
