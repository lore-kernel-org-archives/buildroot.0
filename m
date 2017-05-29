From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:39:15 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix coldfire compile issue
In-Reply-To: <20170429140303.3433bcf3@free-electrons.com>
References: <20170429073019.GA22285@waldemar-brodkorb.de>
 <20170429140303.3433bcf3@free-electrons.com>
Message-ID: <20170529233915.3bf7326f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 14:03:03 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 29 Apr 2017 09:30:19 +0200, Waldemar Brodkorb wrote:
> > Fixes:
> >   http://autobuild.buildroot.net/results/7e95ac6d78bc1732127bea084b4f791e52637abd
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  ...llow-to-directly-use-pthreads-atomics-com.patch | 65 ++++++++++++++++++++++
> >  package/ffmpeg/ffmpeg.mk                           |  6 ++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 package/ffmpeg/0002-configure-allow-to-directly-use-pthreads-atomics-com.patch  
> 
> I'm hesitating: do we apply this fix, or simply adjust
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS do disallow using ffmpeg on
> BR2_m68k_cf ? After all, who is realistically going to use ffmpeg on
> m68k_cf ?

I've excluded m68k_cf, see
https://git.buildroot.org/buildroot/commit/?id=2d9f199061fa0629847b63e6b6317a7b12a9d99f.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
