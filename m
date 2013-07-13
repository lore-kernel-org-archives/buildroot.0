From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 19:14:41 +0200
Subject: [Buildroot] [PATCH v5 2/3] ti-gfx: add new package
In-Reply-To: <CAEBucnCzR0mMnch+TbcFZJ3o=fBTDM5NZ1BwoRUhOzROiU+fiQ@mail.gmail.com>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
 <20130713161147.7ef19265@skate>
 <CAEBucnCzR0mMnch+TbcFZJ3o=fBTDM5NZ1BwoRUhOzROiU+fiQ@mail.gmail.com>
Message-ID: <20130713191441.17ffdb9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sat, 13 Jul 2013 12:08:45 -0500, Spenser Gilliland wrote:

> > No, if you have introduced the powervr virtual package, then libegl
> > should not directly depend on ti-gfx, but instead libegl should depend
> > on powervr, which itself will depend on ti-gfx.
> 
> I don't believe this to be correct.  There is not specific dependency
> chain as each powervr package implements its own set of egl/gles/vg.
> The point of the PowerVR package is for each package that takes
> advantage of PowerVR specific features.  IE. QT4.
> 
> Therefore, ti-gfx should depend on libgles, libegl,and powervr.

I guess you mean "should provide" and not "should depend". But ok, as
discussed on IRC, I see what you mean. We consider libegl, libgles2 and
powervr to be separate virtual features, and it happens that ti-gfx
provides all of them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
