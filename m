From: Andrew Webster <Awebster@arcx.com>
Date: Fri, 10 Jun 2016 14:39:30 +0000
Subject: [Buildroot] [PATCH 01/10] firmware-imx: bump to version 5.4
In-Reply-To: <CAAMH-yups+jDRFZzHRb6v3ytxdjYahYo9UfUOxFvHP4kR17VWA@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <642a0f54088507a92effa0f935950326f752d0c8.1464958470.git.awebster@arcx.com>
 <CAAMH-ysqVQDCw1_OmC79tqOEKrTftaOJk=0gNrW7-j3fNMHURQ@mail.gmail.com>
 <282d0384157042e28d80a63646119b3b@WEBMAIL.arcx.com>
 <CAAMH-ysUdKhcab9-F6CjhYJQVFsq__jQ__pOQUU7+Hf03ipofg@mail.gmail.com>
 <f591ff346077434c852150ce14b43300@WEBMAIL.arcx.com>
 <CAAMH-yups+jDRFZzHRb6v3ytxdjYahYo9UfUOxFvHP4kR17VWA@mail.gmail.com>
Message-ID: <d70473a4d7d24a658eb74b1e708835ae@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Gary Bisson
> Sent: Friday, June 10, 2016 4:47 AM

> > > >> > This patch is based on the Yocto equivalent:
> > > >> > https://github.com/Freescale/meta-fsl-arm/commit/dbb8773
> > > >>
> > > >> Please share how you've tested the VPU firmware for instance.
> > > >
> > > > I followed the same tests from your previous version bumps (e.g.
> > > > gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm
> > > ! matroskademux ! imxvpudec ! imxipuvideosink).  I can add the test(s) performed to the commit messages if you like.
> > >
> > > Yes please, at least in the cover letter so anyone knows how to make sure the package actually works.
> > >
> >
> > Given that the gstreamer-0.10 plugins from NXP are no longer being updated, and don't seem to work with the new packages (or
> maybe I didn't configure things properly), do you know of another way to test the imx-codec, imx-parser, and imx-vpuwrap packages?
> 
> Why do you say it doesn't seem to work with new packages? Up until now it was still working, do you have a build failure? If so, we
> need to deprecate the gst-fsl-plugins of Gstreamer0.10.

The build was successful, but I was having run-time issues.  gst-launch-0.10 would start and claim to be playing, but I saw nothing.  There were VPU errors in the kernel log. 
This may have been a build failure of some kind, because after a full re-build, it now seems to be working.  I am still suspicious that there may be problem.

However, given that it builds, I guess there is no immediate need remove it.  Note that support was removed from Yocto in https://github.com/Freescale/meta-fsl-arm/commit/83b240e.

> Regarding the packages, yes right now they are only used by the
> Gstreamer0.10 plugins. There's another Gstreamer1.0 plugin provided by NXP that makes use of those packages but I've always
> preferred the clean and open-source Gstreamer-imx implementation so I never bothered integrating it (and don't plan to). If we have
> to deprecate the
> Gstreamer0.10 FSL plugins, then we can ask ourselves the question as to whether or not we should keep those packages.

I would think that these could be useful even without the gst0.10 plugins (e.g. for Kodi), but they would become more difficult to run-time test.

Andrew 
