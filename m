From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:06:00 +0100
Subject: [Buildroot] [PATCH v3 1/1] libxmlrpc: bump to 1.39.11
In-Reply-To: <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
References: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
 <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20161204150600.0bfe0ead@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 11:50:44 +0100, Alvaro G. M wrote:
> Previous version patches are still needed, but they have been
> upgraded to apply cleanly.
> 
> This also reverts aa9fde1c459dbc20b268694eafd7a1d3341dbf76, as that
> patch is already on upstream.
> 
> Signed-off-by: Alvaro Gamez <alvaro.gamez@hazent.com>
> ---
>  package/libxmlrpc/0001-fix-gennmtab-build.patch    |  2 +-
>  .../libxmlrpc/0004-use-correct-curl-config.patch   | 36 +++-------------------
>  package/libxmlrpc/0006-narrowing.patch             | 20 ------------
>  package/libxmlrpc/libxmlrpc.hash                   |  2 +-
>  package/libxmlrpc/libxmlrpc.mk                     |  4 +--
>  5 files changed, 9 insertions(+), 55 deletions(-)
>  delete mode 100644 package/libxmlrpc/0006-narrowing.patch

This update is causing a bunch of build failures:

  http://autobuild.buildroot.net/?reason=libxmlrpc-1.39.11

All of them look like this:

make[3]: Entering directory `/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++'
/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++/Makefile:109: depend.mk: No such file or directory
cat /dev/null >depend.mk
ln -s /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11 srcdir
ln -s /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11 blddir
make[3]: Leaving directory `/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++'

Could you have a look and provide a patch to fix this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
