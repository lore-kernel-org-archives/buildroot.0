From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:26:30 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181009220852.4309-5-aperez@igalia.com>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com>
Message-ID: <20181010212630.7f47270e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 01:08:52 +0300, Adrian Perez de Castro wrote:
> This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
> gets passed), which makes the webkitgtk build system assume GStreamer-GL
> is available, while actually it is not.
> 
> Also, use "imply" to select the needed GStreamer-GL component, because
> in general it is preferred due to better performance.
> 
> This fixes some autobuilder failures like the following:
> 
>   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674

What is fixing the autobuilder issue exactly? Explicitly disabling
-DUSE_GSTREAMER_GL=OFF when the plugin is not available ? Or having it
enabled by the "imply" ?

In the former case, then I believe we need two patches: one fixing the
autobuilder issue (i.e just the part in the .mk file) that we can
backport to older Buildroot versions as needed, and another one adding
the imply.

This usage of "imply" would be the first in Buildroot. Peter, Arnout,
Yann, anything against it ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
