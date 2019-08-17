From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:41:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lxc: security bump to
 version 3.2.1
In-Reply-To: <20190816170315.8763-1-fontaine.fabrice@gmail.com>
References: <20190816170315.8763-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817154123.377b3d77@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 19:03:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - lxc switched from gnutls to openssl since version 3.2.0 and
>   https://github.com/lxc/lxc/commit/fa2bb6ba532c5e7f92df8cbae50a68af519f9997
> - lxc needs a glibc or musl toolchain since version 3.2.0 and
>   https://github.com/lxc/lxc/commit/6400238d08cdf1ca20d49bafb85f4e224348bf9d
> - This version includes a security fix (named CVE-2019-5736 on runC):
>   https://github.com/lxc/lxc/commit/6400238d08cdf1ca20d49bafb85f4e224348bf9d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We normally apply security bumps to master. But this one seems like a
quite major bump, and it also disables the package for uClibc.

Does it make sense to backport just the security fix in master ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
