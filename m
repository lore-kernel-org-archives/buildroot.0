From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 10:04:22 +0100
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <20170215085551.w5a33zivzcpo4t3w@lukather>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
 <20170213223117.0125c14e@free-electrons.com>
 <CAOMZO5Dwdu5-+bV=TXA6=-wg+=W05BhE1eEYhzZk6zV71MUBdA@mail.gmail.com>
 <20170214091803.70ab8d9a@free-electrons.com>
 <20170214092400.4g7lp3xj5z5zgxo2@lukather>
 <20170214112349.55c30c40@free-electrons.com>
 <20170215085551.w5a33zivzcpo4t3w@lukather>
Message-ID: <20170215100422.01a48874@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 09:55:51 +0100, Maxime Ripard wrote:

> Moving gbm to a virtual package is quite far from now, but still
> having something to grep for when we move to that would be great.

To solve that, I think a simple comment is quite good, like:

package/efl/Config.in:  depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
package/qt5/qt5base/qt5base.mk:# Uses libgbm from mesa3d
package/weston/Config.in:# Uses libgbm from mesa3d
package/x11r7/xdriver_xf86-video-amdgpu/Config.in:      depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
