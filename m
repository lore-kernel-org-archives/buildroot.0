From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Mar 2010 09:43:55 +0100
Subject: [Buildroot] X11R7.5 git branch
In-Reply-To: <4B8AB776.40204@gmail.com>
References: <4B8AB776.40204@gmail.com>
Message-ID: <20100302094355.58cb7de8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paulius,

On Sun, 28 Feb 2010 20:35:34 +0200
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> As we have discussed earlier I have put all my X11R7.5 work in:
> 
> git://gitorious.org/takeme-buildroot/takeme-buildroot.git x11r75
> 
> Should I post patch series to the list?

For me, having your git tree was enough.

Generally, it looks very good and I think it can be merged as is. I
appreciate the removal of all obsolete packages.

I have a few questions though :

 *) On many packages, but not all, you added FOOBAR_LIBTOOL_PATCH=NO.
    What has driven your choice of applying or not applying the libtool
    patch ?

 *) I imagine that all the patches you are dropping for the different
    packages have been merged upstream and are no longer needed ?

 *) I think the xf86-video-wsfb could just be removed. But this can be
    done later, if you don't want to rebase all your patch set.

 *) Concerning the dependency of xcb-util on gperf on the host, we have
    to decide whether gperf is a mandatory tool for Buildroot (in which
    case it should be added to toolchain/dependencies/dependencies.sh)
    or if we should build it, in which case, we need to add a
    host-gperf dependency.

 *) The xfont_font-util package should be fixed, as we discussed
    recently on the list. This post-install.sh script assuming that
    some tools are installed on the host is ugly. We must determine
    whether xfont_font-util should be built for the host, for the
    target or for both. But this can be done after merging your patch
    set, of course.

Thanks a lot for all this work!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
