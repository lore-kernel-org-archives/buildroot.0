From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:04:02 +0200
Subject: [Buildroot] [PATCH 03/14] package/x11-video-drivers: do not
 select, but depends on mesa3d
In-Reply-To: <cd22d0eb51964f177d803ef07c5050147df30f9e.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
 <cd22d0eb51964f177d803ef07c5050147df30f9e.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <20140417230402.253ba4e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Apr 2014 18:04:15 +0200, Yann E. MORIN wrote:

> Currently, X.Org drivers that need mesa3d forcibly select it.

[...]

>  package/x11r7/xdriver_xf86-video-ati/Config.in        | 5 ++++-
>  package/x11r7/xdriver_xf86-video-glint/Config.in      | 5 ++++-
>  package/x11r7/xdriver_xf86-video-intel/Config.in      | 8 ++++++--
>  package/x11r7/xdriver_xf86-video-mach64/Config.in     | 3 +++
>  package/x11r7/xdriver_xf86-video-mga/Config.in        | 5 ++++-
>  package/x11r7/xdriver_xf86-video-openchrome/Config.in | 5 ++++-
>  package/x11r7/xdriver_xf86-video-r128/Config.in       | 5 ++++-
>  package/x11r7/xdriver_xf86-video-savage/Config.in     | 5 ++++-
>  package/x11r7/xdriver_xf86-video-sis/Config.in        | 5 ++++-
>  package/x11r7/xdriver_xf86-video-tdfx/Config.in       | 5 ++++-
>  package/x11r7/xdriver_xf86-video-vmware/Config.in     | 5 ++++-
>  11 files changed, 45 insertions(+), 11 deletions(-)

I know the dependency on mesa3d is not something added by your patch,
but I'm wondering: do all these drivers actually *require* mesa3d ?
Isn't it possible to build for example, the Intel X.org driver, for
just 2D acceleration purposes? Or does even 2D acceleration relies on
an OpenGL implementation being available, these days?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
