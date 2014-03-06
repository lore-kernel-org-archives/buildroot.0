From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 11:31:47 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add missing opencv ml
 module dependency
In-Reply-To: <53184691.40008@imgtec.com>
References: <1394060130-4805-1-git-send-email-s.martin49@gmail.com>
 <53184691.40008@imgtec.com>
Message-ID: <20140306113147.2935873b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 6 Mar 2014 09:57:37 +0000, Vicente Olivert Riera wrote:
> On 03/05/2014 10:55 PM, Samuel Martin wrote:
> > gst1-plugins-bad source code does include the old-style global opencv
> > header "opencv/cv.h", which includes headers from the core, imgproc,
> > video, features2d, flann, calib3d, objdetect and legacy modules.
> >
> > However, the legacy module, in addition to headers from some of the
> > previously listed modules, also includes headers from the ml module.
> >
> > Thus, the ml module must be selected to be able to build the legacy
> > one, so the gst-plugins-bad's opencv plugin.
> >
> > Fixes:
> >    http://autobuild.buildroot.net/results/d02/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
> >
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >   package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> > index 0685322..2c5c290 100644
> > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> > @@ -434,6 +434,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
> >   	select BR2_PACKAGE_OPENCV_LIB_FLANN
> >   	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> >   	select BR2_PACKAGE_OPENCV_LIB_LEGACY
> > +	select BR2_PACKAGE_OPENCV_LIB_ML
> >   	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> >   	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> >   	help
> >
> 
> Maybe your BR tree wasn't up to date in the moment to write this patch. 
> Look at this:
> 
> http://git.buildroot.net/buildroot/commit/?id=3324f4e8b69ab49783a233b27c9b2edeecedb5ce

And? Samuel is just adding one more line here, in addition to the lines
you added in the commit you're pointing at.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
