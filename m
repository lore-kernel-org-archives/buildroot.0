From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:42:44 +0100
Subject: [Buildroot] [PATCH 2/2] cage: package des not require locale
 support
In-Reply-To: <20201122160008.44129-2-paul@crapouillou.net> (Paul Cercueil's
 message of "Sun, 22 Nov 2020 16:00:08 +0000")
References: <20201122160008.44129-1-paul@crapouillou.net>
 <20201122160008.44129-2-paul@crapouillou.net>
Message-ID: <87d003u4vf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

s/des/does/, and the prefix should be package/cage, not just cage:

Committed with that fixed, thanks.

 > Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
 > of wlroots, but wlroots does not depend on it anymore.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  package/cage/Config.in | 4 +---
 >  1 file changed, 1 insertion(+), 3 deletions(-)

 > diff --git a/package/cage/Config.in b/package/cage/Config.in
 > index c8097751f0..3bef08f037 100644
 > --- a/package/cage/Config.in
 > +++ b/package/cage/Config.in
 > @@ -3,16 +3,14 @@ comment "cage needs udev, mesa3d w/ EGL and GLES support"
 >  		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
 >  		!BR2_PACKAGE_HAS_UDEV
 
 > -comment "cage needs a toolchain w/ threads, locale, dynamic library"
 > +comment "cage needs a toolchain w/ threads, dynamic library"
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 > -		!BR2_ENABLE_LOCALE || \
 >  		BR2_STATIC_LIBS
 
 >  config BR2_PACKAGE_CAGE
 >  	bool "cage"
 >  	depends on !BR2_STATIC_LIBS # wlroots
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
 > -	depends on BR2_ENABLE_LOCALE # wlroots
 >  	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 >  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
 >  	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
 > -- 
 > 2.29.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
