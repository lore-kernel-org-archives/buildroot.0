From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:06:39 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: enable IPv6 if libtirpc
 is selected
In-Reply-To: <20190812181450.70b8c901@gmx.net>
References: <20190812030954.4880-1-unixmania@gmail.com>
 <20190812181450.70b8c901@gmx.net>
Message-ID: <20190812230639.4a7811d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Aug 2019 18:14:50 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> On Mon, 12 Aug 2019 00:09:54 -0300, unixmania at gmail.com wrote:
> 
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > IPv6 support depends on libtirpc, so no not disable it if libtirpc is  
> 
> s/no not/do not/
> 
> > selected. In practice this always enables IPv6, since nfs-utils needs
> > rpcbind, which in its turn always selects libtirpc.  
> 
> Why not simple select it directly?

Because it is an optional dependency and as such is not strictly
required, so we don't typically force such optional dependencies in
Buildroot.

I found the v1 from Carlos to be more appropriate than his v2. If you
want RPC/IPv6 support, then you must enable libtirpc, and nfs-utils.mk
properly uses libtirpc if available.

Arnout, what do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
