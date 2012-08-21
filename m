From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 13:57:06 +0200
Subject: [Buildroot] [PATCHv6] vlc: New package
In-Reply-To: <1342502199-6723-1-git-send-email-ismael.luceno@gmail.com>
References: <1342502199-6723-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <20120821135706.3c8238b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 02:16:39 -0300,
Ismael Luceno <ismael.luceno@gmail.com> a ?crit :

> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>

I'm seeing some kconfig warnings with VLC:

warning: (BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG && BR2_PACKAGE_VLC_SVG) selects BR2_PACKAGE_LIBRSVG which has unmet direct dependencies (BR2_PACKAGE_LIBGTK2 && BR2_USE_WCHAR)
warning: (BR2_PACKAGE_GST_FFMPEG && BR2_PACKAGE_VLC_POSTPROC) selects BR2_PACKAGE_FFMPEG_POSTPROC which has unmet direct dependencies (BR2_PACKAGE_FFMPEG && BR2_PACKAGE_FFMPEG_GPL)
warning: (BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG && BR2_PACKAGE_VLC_SVG) selects BR2_PACKAGE_LIBRSVG which has unmet direct dependencies (BR2_PACKAGE_LIBGTK2 && BR2_USE_WCHAR)
warning: (BR2_PACKAGE_GST_FFMPEG && BR2_PACKAGE_VLC_POSTPROC) selects BR2_PACKAGE_FFMPEG_POSTPROC which has unmet direct dependencies (BR2_PACKAGE_FFMPEG && BR2_PACKAGE_FFMPEG_GPL)

Also, could you update the patch to include licensing informations, and
use the $(eval $(autotools-package)) line at the end of the .mk file?

I've started testing the patch, but downloading all the dependencies
over 3G is very inconvenient. If nobody works on this in the mean time,
I'll try to have a look when I get access to a proper Internet
connection.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
