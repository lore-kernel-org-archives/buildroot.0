From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 18:25:45 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add missing opencv ml
 module dependency
In-Reply-To: <1394060130-4805-1-git-send-email-s.martin49@gmail.com>
References: <1394060130-4805-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140306182545.2988fd8d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed,  5 Mar 2014 23:55:30 +0100, Samuel Martin wrote:
> gst1-plugins-bad source code does include the old-style global opencv
> header "opencv/cv.h", which includes headers from the core, imgproc,
> video, features2d, flann, calib3d, objdetect and legacy modules.
> 
> However, the legacy module, in addition to headers from some of the
> previously listed modules, also includes headers from the ml module.
> 
> Thus, the ml module must be selected to be able to build the legacy
> one, so the gst-plugins-bad's opencv plugin.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d02/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
