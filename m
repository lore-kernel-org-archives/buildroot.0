From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:57:04 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: add an option to control
 USE_GSTREAMER_GL
In-Reply-To: <20181025002738.27486-1-aperez@igalia.com>
References: <20181025002738.27486-1-aperez@igalia.com>
Message-ID: <20181031105704.0e824ff6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Oct 2018 03:27:38 +0300, Adrian Perez de Castro wrote:
> This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
> gets passed), which makes the webkitgtk build system assume GStreamer-GL
> is available, while actually it is not.
> 
> Also, providing an option to manually disable usage of GStremer-GL can
> help with certain target configurations in which using OpenGL for video
> handling might result in incorrect rendering.
> 
> This fixes some autobuilder failures like the following:
> 
>   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
>   http://autobuild.buildroot.net/results/00c1a8ea23a99728a4f3f4478705f2383414ae41
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/Config.in    | 15 +++++++++++++++
>  package/webkitgtk/webkitgtk.mk |  7 +++++++
>  2 files changed, 22 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
