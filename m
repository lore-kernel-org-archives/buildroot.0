From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 21:55:40 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: fix build issue
 without libuuid
In-Reply-To: <1470425509-26718-1-git-send-email-romain.naour@gmail.com>
References: <1470425509-26718-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160806215540.38dff27b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 21:31:49 +0200, Romain Naour wrote:
> Since enlightenment 0.20 uuid.h is always included in e_pixmap.c but
> libuuid is checked at configure time only when wayland support is
> enabled.
> 
> Include uuid.h must guarded by HAVE_WAYLAND.
> 
> Fixes:
>   CC       src/bin/src_bin_enlightenment-e_pixmap.o
> src/bin/e_pixmap.c:16:18: fatal error: uuid.h: No such file or directory
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...uid.h-only-when-Wayland-support-is-enable.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
