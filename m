From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 08:56:32 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
In-Reply-To: <1348297189-29498-1-git-send-email-sho@relinux.de>
References: <1348297189-29498-1-git-send-email-sho@relinux.de>
Message-ID: <20121025085632.30c9878f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Sat, 22 Sep 2012 08:59:49 +0200, Stephan Hoffmann wrote:
> Implementation of an interface connecting TUIO messages and QT events
> 
> https://github.com/x29a/qTUIO
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  build-tested with a minimal internal toolchain for ARM.
> ---
>  package/Config.in       |    6 ++++
>  package/qtuio/Config.in |   18 ++++++++++++
>  package/qtuio/qtuio.mk  |   70 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 package/qtuio/Config.in
>  create mode 100644 package/qtuio/qtuio.mk

Looks like it breaks the build in certain configurations:
http://autobuild.buildroot.net/results/c4a12fe6b8e7eb8c31ee2fd48893480bd098a008/build-end.log

It seems like a debug version of the library, named libqTUIO_d.so, has
been generated, which prevents the install rules from working.

Could you have a look into this? Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
