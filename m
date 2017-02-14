From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 11:23:49 +0100
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <20170214092400.4g7lp3xj5z5zgxo2@lukather>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
 <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
 <20170214091803.70ab8d9a@free-electrons.com>
 <20170214092400.4g7lp3xj5z5zgxo2@lukather>
Message-ID: <20170214112349.55c30c40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 10:24:00 +0100, Maxime Ripard wrote:

> Actually, it doesn't depend on a specific GLES / EGL implementation,
> but it does depend on Mesa for GBM. There are alternative
> implementation of GBM as well, so having something like:
> 
> depends on BR2_PACKAGE_HAS_LIBEGL
> depends on BR2_PACKAGE_HAS_LIBGLES
> depends on BR2_PACKAGE_MESA3D # GBM implementation
> 
> Seems more natural

In principle, I would agree, but we pass --enable-gbm only when
BR2_PACKAGE_MESA3D_OPENGL_EGL=y. So with your proposal, we could end up
in a situation where libgbm isn't.

Try a build with just BR2_PACKAGE_MESA3D=y, libgm isn't
built/installed. So if we want to do this, perhaps we need a separate
BR2_PACKAGE_MESA3D_LIBGBM option?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
