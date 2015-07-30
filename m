From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:31:22 +0200
Subject: [Buildroot] [PATCH 44/47] package/kodi-visualisation-shadertoy:
 new package
In-Reply-To: <1437597069-6448-45-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-45-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730153122.3947e6f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:31:06 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-visualisation-shadertoy/Config.in        |    6 ++++++
>  .../kodi-visualisation-shadertoy.mk                   |   17 +++++++++++++++++
>  package/kodi/Config.in                                |    4 ++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/kodi-visualisation-shadertoy/Config.in
>  create mode 100644 package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk

This package didn't build properly in OpenGL ES / EGL configuration
with rpi-userland, because the FindOpenGLES2 logic was only taking into
account the header paths for glesv2 but not egl, which lead to build
failures due to the funky header locations used by rpi-userland.

So I've added a patch
0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch to fix
that. If you could submit it upstream, it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
