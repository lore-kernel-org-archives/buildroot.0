From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 15 Feb 2017 09:55:51 +0100
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <20170214112349.55c30c40@free-electrons.com>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
 <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
 <20170214091803.70ab8d9a@free-electrons.com>
 <20170214092400.4g7lp3xj5z5zgxo2@lukather>
 <20170214112349.55c30c40@free-electrons.com>
Message-ID: <20170215085551.w5a33zivzcpo4t3w@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2017 at 11:23:49AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Feb 2017 10:24:00 +0100, Maxime Ripard wrote:
> 
> > Actually, it doesn't depend on a specific GLES / EGL implementation,
> > but it does depend on Mesa for GBM. There are alternative
> > implementation of GBM as well, so having something like:
> > 
> > depends on BR2_PACKAGE_HAS_LIBEGL
> > depends on BR2_PACKAGE_HAS_LIBGLES
> > depends on BR2_PACKAGE_MESA3D # GBM implementation
> > 
> > Seems more natural
> 
> In principle, I would agree, but we pass --enable-gbm only when
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y. So with your proposal, we could end up
> in a situation where libgbm isn't.

He, I thought this was a bad choice and why I said like :)

Obviously, this isn't a good candidate.

> Try a build with just BR2_PACKAGE_MESA3D=y, libgm isn't
> built/installed. So if we want to do this, perhaps we need a separate
> BR2_PACKAGE_MESA3D_LIBGBM option?

Maybe, we could also just depend on BR2_PACKAGE_MESA3D_OPENGL_EGL for
now (in addition to the virtual packages).

Moving gbm to a virtual package is quite far from now, but still
having something to grep for when we move to that would be great.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170215/b30d45d5/attachment.asc>
