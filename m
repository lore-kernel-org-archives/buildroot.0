From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:37:17 +0100
Subject: [Buildroot] [PATCH] sngrep: use pkg-config to discover OpenSSL
 to fix static linking
In-Reply-To: <1488636958-5291-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488636958-5291-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305213717.2ae92fcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 15:15:58 +0100, Thomas Petazzoni wrote:
> Building sngrep with OpenSSL support in static linking configurations
> currently fails due to undefined symbols in the OpenSSL library. It's
> the usual problem with using AC_CHECK_LIB() to discover libraries
> instead of the pkg-config based PKG_CHECK_MODULES().
> 
> Therefore, this commit introduces a patch that switches to using
> pkg-config to discover OpenSSL. A preliminary patch is needed, without
> which appending to LIBS/CFLAGS doesn't work. Both patches have been
> submitted upstream.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/911143de823b2c749ac0a59dfa06adb6ddd3de50/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-src-Makefile.am-don-t-use-VPATH.patch     | 43 +++++++++++++
>  ...e.ac-switch-to-pkg-config-to-find-openssl.patch | 75 ++++++++++++++++++++++
>  package/sngrep/sngrep.mk                           |  2 +-
>  3 files changed, 119 insertions(+), 1 deletion(-)
>  create mode 100644 package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
>  create mode 100644 package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
