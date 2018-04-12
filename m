From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 20:31:49 +0200
Subject: [Buildroot] [PATCH v2 6/6] squashfs: add zstd support
In-Reply-To: <20180411212754.GH2328@scaer>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180409200429.22650-6-ps.report@gmx.net>
 <20180411212754.GH2328@scaer>
Message-ID: <20180412203149.2bc59bc9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wed, 11 Apr 2018 23:27:54 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
> 
> On 2018-04-09 22:04 +0200, Peter Seiderer spake thusly:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> [--SNIP--]
> > diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> > index 67025ac68a..bec867d676 100644
> > --- a/package/squashfs/squashfs.mk
> > +++ b/package/squashfs/squashfs.mk
> > @@ -9,7 +9,7 @@ SQUASHFS_SITE = https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
> >  SQUASHFS_SITE_METHOD = git
> >  SQUASHFS_LICENSE = GPL-2.0+
> >  SQUASHFS_LICENSE_FILES = COPYING
> > -SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1 ZSTD_SUPPORT=0
> > +SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
> >  
> >  ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
> >  SQUASHFS_DEPENDENCIES += lz4
> > @@ -46,6 +46,13 @@ else
> >  SQUASHFS_MAKE_ARGS += GZIP_SUPPORT=0
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_SQUASHFS_ZSTD),y)
> > +SQUASHFS_DEPENDENCIES += zstd
> > +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=1 COMP_DEFAULT=zstd
> > +else
> > +SQUASHFS_MAKE_ARGS += ZSTD_SUPPORT=0
> > +endif  
> 
> Please, keep the gzip case last, so that it stays the default. Add the
> zstd case first.

O.k, will fix it on the next patch iteration....

Regards,
Peter

> 
> Regards,
> Yann E. MORIN.
> 
> >  HOST_SQUASHFS_DEPENDENCIES = host-zlib host-lz4 host-lzo host-xz host-zstd
> >  
> >  HOST_SQUASHFS_MAKE_ARGS = \
> > -- 
> > 2.16.3
> >   
> 
