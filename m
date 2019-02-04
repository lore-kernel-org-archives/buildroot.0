From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 11:20:52 +0100
Subject: [Buildroot] [PATCH v2 4/6] ffmpeg: bump to version 4.1.
 ffserver is not supported anymore.
In-Reply-To: <ea-mime-5c58064e-3d38-4e513c2d@www-5.netcourrier.com>
References: <20190202155400.6547fba9@windsurf>
 <ea-mime-5c58064e-3d38-4e513c2d@www-5.netcourrier.com>
Message-ID: <20190204112052.284bbbea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Feb 2019 10:30:54 +0100 (CET)
lpdev at cordier.org wrote:

> > I'd like to hear from Bernd about this ffmpeg bump. If I remember well,
> > major ffmpeg bumps are typically breaking some APIs, causing build
> > issues with packages that use ffmpeg.
> 
> According to my experience with FFMpeg, API are marked as deprecated.
> They can still be used and linked correctly against all application.

Did you see the feedback from Bernd ? I know Bernd always forgets to Cc
people when replying, so make sure to check the mailing list for his
reply.

> However, the behaviour of the program can differ. What about creating
> a ffmpeg4 package, just like opencv2/3 packages?

Apparently, except for gstreamer1/gst1-libav that needs to be fixed for
ffmpeg 4.x, all other packages have already been fixed to work with
ffmpeg 4.x. So there is no reason to introduce a separate ffmpeg4
package. It would create more complexity/

> > If ffserver is no longer supported, we want to move this option to
> > Config.in.legacy so that users who have configurations with this
> > enabled are aware.
> 
> This does not appear in the official documentation. Would it be
> possible to add it?

Patches welcome ! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
