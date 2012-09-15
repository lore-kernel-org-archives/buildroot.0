From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Sep 2012 17:04:43 +0200
Subject: [Buildroot] [PATCH] Download packages from github in tar.gz
 format instead git format.
In-Reply-To: <1347714423-13242-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347714423-13242-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CAHXCMM++UpS2jPSMtPwWzLsCKCdJnSqPOzY7MG5XBN+UuZ7yGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nack.

Though github provides a "download" tab, with a button to directly
download the source tarball,
the generated tarball url does contain the beginning of the commit sha1.
So, the download url cannot be easily resolved, at least the current
download infrastructure does not support it.

To, use a fix url stating with "http://github.com/downloads/", the
maintainers of a github project has to upload something.

As ref, a thread also talking about github download urls:
http://lists.busybox.net/pipermail/buildroot/2012-August/057570.html


2012/9/15 Marek Belisko <marek.belisko@open-nandra.com>:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  package/cpuload/cpuload.mk                       |    2 +-
>  package/input-event-daemon/input-event-daemon.mk |    2 +-
>  package/jsmin/jsmin.mk                           |    2 +-
>  package/libiqrf/libiqrf.mk                       |    2 +-
>  package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
>  package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
>  package/socketcand/socketcand.mk                 |    2 +-
>  package/ti-utils/ti-utils.mk                     |    2 +-
>  package/tslib/tslib.mk                           |    2 +-
>  package/yajl/yajl.mk                             |    2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)

BTW, in this list, only yajl does upload some material, but the
tarball of the yajl version we use in BR in is not available for
download on the download page... :(

Regards,

-- 
Sam
