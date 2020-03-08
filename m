From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 22:28:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with opencv3
In-Reply-To: <CAPi7W83cDsLz5jfZdOzL62QAJXNe-swYUOX+b4kiEvMYjexmYQ@mail.gmail.com>
References: <20200228133809.687495-1-fontaine.fabrice@gmail.com>
 <20200308154220.1b2ccc1d@windsurf.home>
 <CAPi7W83cDsLz5jfZdOzL62QAJXNe-swYUOX+b4kiEvMYjexmYQ@mail.gmail.com>
Message-ID: <20200308222849.10e6d47d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Mar 2020 16:49:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Thanks for looking into this. I must say I don't feel very confident
> > about the fix. Have you been able to trace which change in OpenCV
> > caused this build issue ?  
> The issue is raised by
> https://github.com/opencv/opencv/pull/11159/commits/7f9253ea0a9fe2635926379420002dbf0c3fce0f
> which changed the CV_RGB definition from cvScalar to cv::Scalar
> however cvRectangle was not updated and still waits for a CvScalar
> color.
> So, a better fix would be to remove the reference on CV_RGB and use
> directly cvScalar. I'll send a v2 if you agree that this is a better
> proposal.

I don't really know what is the right way of fixing this. Have you paid
attention to compatibility with OpenCV 2.x, if VLC can build with
OpenCV 2.x ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
