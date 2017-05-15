From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:01:18 +0200
Subject: [Buildroot] [PATCH v2] package/efl: fix unmet dependencies
In-Reply-To: <20170508211149.1964-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 8 May 2017 23:11:49 +0200")
References: <20170508211149.1964-1-yann.morin.1998@free.fr>
Message-ID: <87wp9iib1t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > EFL's elput selects libinput but forgot to propagate its dependencies.
 > Which requires they be propagated further to a second sub-option, then
 > to a third one.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@openwide.fr>

 > ---
 > Changes v1 -> v2:
 >   - porpagate dependency to comments as well  (Romain)
 >   - fix commit log typoes  (Romain, me)
 > ---
 >  package/efl/Config.in | 16 ++++++++++------
 >  1 file changed, 10 insertions(+), 6 deletions(-)

 > diff --git a/package/efl/Config.in b/package/efl/Config.in
 > index 371ed3f0d4..7b29e57c0a 100644
 > --- a/package/efl/Config.in
 > +++ b/package/efl/Config.in
 > @@ -178,13 +178,15 @@ config BR2_PACKAGE_EFL_WAYLAND
 >  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
 >  	depends on BR2_PACKAGE_EFL_EEZE # efl drm
 >  	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 > +	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput

Committed to 2017.02.x after fixing the s/linput/libinput/ typo, thanks.

-- 
Bye, Peter Korsgaard
