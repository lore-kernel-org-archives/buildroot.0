From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:54:31 +0100
Subject: [Buildroot] [PATCH] package/glmark2: needs gcc >= 4.9 for C++14
In-Reply-To: <1487500538-4627-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 19 Feb 2017 11:35:38 +0100")
References: <1487500538-4627-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y3x1rgmg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fixes:
 >     http://autobuild.buildroot.org/results/511/51162285d197deabb63727c19cdf5512b0e68f29/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Cc: Spenser Gilliland <spenser@gillilanding.com>
 > ---
 >  package/glmark2/Config.in | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
 > index c8380b1..9f0f9fb 100644
 > --- a/package/glmark2/Config.in
 > +++ b/package/glmark2/Config.in
 > @@ -10,11 +10,16 @@ config BR2_PACKAGE_GLMARK2_GL
 >  	depends on BR2_PACKAGE_HAS_LIBGL
 >  	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 
 > +comment "glmark2 needs a toolchain w/ gcc >= 4.9"
 > +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 > +
 >  comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 >  	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
 
 >  config BR2_PACKAGE_GLMARK2
 >  	bool "glmark2"
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14

Strangely enough glmark doesn't even explicitly depend on
BR2_INSTALL_LIBSTDCPP (it does indirectly because of mesa), so committed
after adding that.

-- 
Bye, Peter Korsgaard
