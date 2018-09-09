From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:22:18 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: do not use ldconfig when
 building the host variant
In-Reply-To: <20180831211240.20322-1-thomas.petazzoni@bootlin.com>
References: <20180831211240.20322-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180909152218.1f038fc7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 23:12:39 +0200, Thomas Petazzoni wrote:
> Since commit 93acaa5a573865afc7a8c0912a7037965eb845a6 ("e2fsprogs:
> build shared library for the host"), we are building shared libraries
> in host-e2fsprogs instead of static libraries. A consequence of this
> is that the e2fsprogs build system tries to run ldconfig on the host,
> which fails when running as non-root:
> 
> /usr/sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
> make[3]: [Makefile:441: install-shlibs] Error 1 (ignored)
> 
> Tell the configure script to use "true" as ldconfig in order to avoid
> this problem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Both patches applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
