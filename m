From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu, 08 Oct 2020 09:49:34 +0200
Subject: [Buildroot] [PATCH v2 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201006231402.710d1b52@windsurf.home>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
 <20201006153726.790986-2-antoine.tenart@bootlin.com>
 <20201006210902.GV11621@scaer> <20201006231402.710d1b52@windsurf.home>
Message-ID: <160214337437.3197.3418103978190386992@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quoting Thomas Petazzoni (2020-10-06 23:14:02)
> On Tue, 6 Oct 2020 23:09:02 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Basically, I fiond it dubious that a filesystem option depens on a
> > package being enabled or not.
> 
> True, but what do you suggest? That we unconditionally enable xattr
> support when generating a JFFS2 image?

Enabling xattr support unconditionally would be consistent with what is
done with ext images (mkfs.extX does copy the xattr by default unless
explicitly disabled).

Should I post a v3 with the condition on BR2_PACKAGE_LIBSELINUX removed?

Thanks,
Antoine


-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
