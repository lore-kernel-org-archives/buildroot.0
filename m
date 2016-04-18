From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:53:41 +0200
Subject: [Buildroot] [PATCH v4] qt5webkit: restore package
In-Reply-To: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160418225341.58feddd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 15:40:35 +0200, Gary Bisson wrote:
> Although this package has been removed from the official release
> packages since Qt5.6.0, it is still available for users to build
> it from source. This is useful for platforms without GPU since its
> successor (QtWebEngine) requires OpenGL support.
> 
> The package now matches the community-based meta-qt5 Yocto layer,
> using the exact same revision of the qtwebkit source from github:
> https://github.com/meta-qt5/meta-qt5/commit/e434995a
> 
> Here is the project source tree:
> https://github.com/qtproject/qtwebkit
> 
> All the patches have been pulled from Yocto as well.
> 
> Since we are now using the source from the git repository, we need
> to create an empty .git/ folder to force the headers re-generation.
> https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
> 
> Note that GPLv3 license option has been added with this release.
> 
> Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I've fixed the s/LGPLv2+/LGPLv2.1+/ issue in the license information,
and applied. However, it is worth noting that at some point, we will be
forced to remove the packages for software that is unmaintained
upstream. We can keep it for a while, but just like recently libgtk3
was bumped to a version that requires OpenGL because the latest
versions of libgtk3 require it, we will have to do the same for Qt5 if
that's the decision of upstream. People who want something that works
without OpenGL should work with upstream to resolve this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
