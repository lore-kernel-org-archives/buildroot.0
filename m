From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2013 19:27:44 +0200
Subject: [Buildroot] [PATCH 4/6] mesa3d: reorganize, modularize,
 and bump to version 9.1.6
In-Reply-To: <1377373321-29732-5-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-5-git-send-email-spenser@gillilanding.com>
Message-ID: <521B9010.4000004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/13 21:41, Spenser Gilliland wrote:
> move mesa3d out of xorg as it is not really an Xorg component.
>
>
> Signed-off-by: Spenser Gilliland<spenser@gillilanding.com>
> ---
>   package/Config.in                                  |   1 +
>   package/mesa3d/Config.in                           | 172 +++++++++++++++++++++
>   package/mesa3d/mesa3d-cross-glsl-compiler.patch    |  41 +++++
>   package/mesa3d/mesa3d-gbm-without-dri.patch        |  30 ++++
>   package/mesa3d/mesa3d.mk                           | 149 ++++++++++++++++++
>   package/opengl/Config.in                           |   3 +
>   package/opengl/libegl/libegl.mk                    |   4 +
>   package/opengl/libgl/libgl.mk                      |  20 +++
>   package/opengl/libgles/libgles.mk                  |   4 +
>   package/opengl/libopenvg/libopenvg.mk              |   4 +
>   package/x11r7/Config.in                            |   1 -
>   package/x11r7/mesa3d/Config.in                     |  15 --
>   package/x11r7/mesa3d/mesa3d-uclibc-locale.patch    |  56 -------
>   package/x11r7/mesa3d/mesa3d.mk                     |  40 -----
>   .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
>   15 files changed, 430 insertions(+), 114 deletions(-)
>   create mode 100644 package/mesa3d/Config.in
>   create mode 100644 package/mesa3d/mesa3d-cross-glsl-compiler.patch
>   create mode 100644 package/mesa3d/mesa3d-gbm-without-dri.patch
>   create mode 100644 package/mesa3d/mesa3d.mk
>   create mode 100644 package/opengl/libgl/libgl.mk
>   delete mode 100644 package/x11r7/mesa3d/Config.in
>   delete mode 100644 package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
>   delete mode 100644 package/x11r7/mesa3d/mesa3d.mk

  Hi Spenser,

  I think this patch should be split up into two or three patches:

- Move out of X tree

- Modularize

- Bump

(not necessarily in that order).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
