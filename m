From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
Date: Fri, 29 Apr 2016 13:40:51 +0200
Subject: [Buildroot] [PATH RFC] Fix glmark2 error with Vivante
Message-ID: <1461930052-21032-1-git-send-email-mylene.josserand@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While using Vivante OpenGL driver, I got an error on glmark2 :
   "Checking for 'gbm' : not found
    The configuration failed [...]"

This is due to the fact that, with Vivante driver, mesa3d is not
configured to enable "gdm" (as BR2_PACKAGE_MESA3D_OPENGL_EGL=n).
As the gdm is used only on "drm" flavors of glmark2, this patch
proposes to check if the MESA3D OpenGL is enabled before adding
"drm" flavors on configuration (so the need of "gbm").

This is a RFC patch because I do not really know how all OpenGL stuff
are handled in buildroot and maybe, this is not the best way to do it.

If you have any ideas, remarks or questions, do not hesitate.

Best regards,

Myl?ne Josserand (1):
  glmark2: check mesa3d opengl when adding drm

 package/glmark2/glmark2.mk | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.8.0.rc3
