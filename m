From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Apr 2020 13:57:34 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-04-25
In-Reply-To: <CAJiuCcdouYYbp1yvQcjpE5-E5S2xXsUf02Boccwz+PPos0BgEQ@mail.gmail.com>
References: <5ea529b6.1c69fb81.2cc08.1f4eSMTPIN_ADDED_MISSING@mx.google.com>
 <CAJiuCcdouYYbp1yvQcjpE5-E5S2xXsUf02Boccwz+PPos0BgEQ@mail.gmail.com>
Message-ID: <20200426135734.3d370dbe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Apr 2020 12:24:20 +0200
Cl?ment P?ron <peron.clem@gmail.com> wrote:

> > Build failures related to your defconfigs:
> >
> >                         defconfig |                        link to the job
> > ----------------------------------+--------------------------------------------------------------
> >                       beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/526035566
> >  
> 
> The defconfig is missing HOST_PYTHON is this something that should
> also trigger on computer where python-dev is installed?

It's a Python 2.x vs. Python 3.x issue. the beelink_gs1 defconfig properly has:

BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

which pulls in host-python and host-swig as dependencies of uboot.
Unfortunately, recent versions of U-Boot (since 2020.01) are now using
python3 in the pylibfdt code, so we need to have a dependency on
host-python3. 

There is some on-going discussion about this on
http://patchwork.ozlabs.org/project/buildroot/patch/20200425000629.2068191-1-heiko at sntech.de/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
