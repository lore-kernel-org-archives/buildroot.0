From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 18:24:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: use pkg-config to
 find openssl
In-Reply-To: <20190322203459.27576-1-fontaine.fabrice@gmail.com>
References: <20190322203459.27576-1-fontaine.fabrice@gmail.com>
Message-ID: <20190325182413.21a32d3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 22 Mar 2019 21:34:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openssl can have multiples dependencies such as libatomic on sparcv8
> 32 bits so drop first patch and add a new patch to use pkg-config
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ressl.patch => 0001-enable-libressl.patch} |  0
>  .../0001-fix-openssl-static-link.patch        | 30 --------
>  ...re.ac-use-pkg-config-to-find-openssl.patch | 69 +++++++++++++++++++
>  package/fetchmail/fetchmail.mk                |  7 +-
>  4 files changed, 70 insertions(+), 36 deletions(-)
>  rename package/fetchmail/{0002-enable-libressl.patch => 0001-enable-libressl.patch} (100%)
>  delete mode 100644 package/fetchmail/0001-fix-openssl-static-link.patch
>  create mode 100644 package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch

Applied to master, thanks. Really great to see this effort towards
using pkg-config in more packages, and great as well to see that you
have already submitted this patch for upstream inclusion. Keep up the
good work!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
