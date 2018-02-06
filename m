From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 13:43:13 +0100
Subject: [Buildroot] [PATCH 1/5] package/x11r7/xlib_libxshmfence: fix
 build with glibc 2.27
In-Reply-To: <20180205205716.4279-1-romain.naour@gmail.com>
References: <20180205205716.4279-1-romain.naour@gmail.com>
Message-ID: <20180206134313.7eacbaad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Feb 2018 21:57:12 +0100, Romain Naour wrote:
> With glibc 2.27 memfd_create() is inside a _GNU_SOURCE guard, so call
> AC_USE_SYSTEM_EXTENSIONS to get this defined.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...onfigure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch | 30 ++++++++++++++++++++++
>  .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  3 +++
>  2 files changed, 33 insertions(+)
>  create mode 100644 package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch

Thanks, I've applied the series to the next branch.

For PATCH 1, I added a reference to the upstream commit you've
backported, as suggested by Yann.

For PATCH 5, I added the references to the CVEs being fixed, tweaked
the commit log about license file hashes, and changed the title to
"security bump".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
