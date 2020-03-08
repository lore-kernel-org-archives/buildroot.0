From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Mar 2020 23:17:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with opencv3
In-Reply-To: <20200308222849.10e6d47d@windsurf.home>
References: <20200228133809.687495-1-fontaine.fabrice@gmail.com>
 <20200308154220.1b2ccc1d@windsurf.home>
 <CAPi7W83cDsLz5jfZdOzL62QAJXNe-swYUOX+b4kiEvMYjexmYQ@mail.gmail.com>
 <20200308222849.10e6d47d@windsurf.home>
Message-ID: <CAPi7W802_feMUmLpkUNySUuH1atvmAFE5V3E8BkxCTJkRFNt2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le dim. 8 mars 2020 ? 22:28, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sun, 8 Mar 2020 16:49:07 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Thanks for looking into this. I must say I don't feel very confident
> > > about the fix. Have you been able to trace which change in OpenCV
> > > caused this build issue ?
> > The issue is raised by
> > https://github.com/opencv/opencv/pull/11159/commits/7f9253ea0a9fe2635926379420002dbf0c3fce0f
> > which changed the CV_RGB definition from cvScalar to cv::Scalar
> > however cvRectangle was not updated and still waits for a CvScalar
> > color.
> > So, a better fix would be to remove the reference on CV_RGB and use
> > directly cvScalar. I'll send a v2 if you agree that this is a better
> > proposal.
>
> I don't really know what is the right way of fixing this. Have you paid
> attention to compatibility with OpenCV 2.x, if VLC can build with
> OpenCV 2.x ?
The second version is building fine with OpenCV 2.x which is not the
case for the first one. So I'll send a v2.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
