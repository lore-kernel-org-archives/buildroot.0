From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:27:20 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.16.0
In-Reply-To: <9daaa8be5e94df18acead6765c39e987b6e33570.1525199982.git.baruch@tkos.co.il>
References: <9daaa8be5e94df18acead6765c39e987b6e33570.1525199982.git.baruch@tkos.co.il>
Message-ID: <20180501212720.1e5c93d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 21:39:42 +0300, Baruch Siach wrote:
> Drop uClibc-ng compatibility patch. Current uClibc-ng provides the
> needed definitions.
> 
> Drop the libc-config.h musl compatibility workaround patch. iproute2
> update its headers copy to current kernel version for which this
> workaround is no longer needed.
> 
> Don't modify tc/Makefile to make XT_LIB_DIR get the value of
> IPT_LIB_DIR. Pass the correct value directly in CFLAGS.
> 
> Add a patch removing arpd dependency on threading support.
> 
> Rename IPROUTE2_WITH_IPTABLES to IPROUTE2_DISABLE_IPTABLES which better
> describes what it does.
> 
> Don't patch the configure script for the cross compiler. The CC
> environment variable is enough.
> 
> Don't force the CCOPTS make variable. The CFLAGS environment variable
> does the trick for target code.
> 
> Don't patch CCOPTS out of netem/Makefile. The CBUILD_CFLAGS environment
> variable can pass the host CFLAGS to host code.
> 
> The ifcfg script is now POSIX shell compatible. Remove its installation
> dependency on bash.
> 
> Pass installation DESTDIR in the environment. Don't force SBINDIR, DOCDIR, and
> MANDIR. The default values are fine.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...workaround-to-the-libc-compat.h-copy.patch | 38 ------------
>  .../0001-arpd-remove-pthread-dependency.patch | 37 ++++++++++++
>  ...-local-PF_VSOCK-AF_VSOCK-definitions.patch | 58 -------------------
>  package/iproute2/iproute2.hash                |  2 +-
>  package/iproute2/iproute2.mk                  | 39 +++----------
>  5 files changed, 46 insertions(+), 128 deletions(-)
>  delete mode 100644 package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
>  create mode 100644 package/iproute2/0001-arpd-remove-pthread-dependency.patch
>  delete mode 100644 package/iproute2/0002-ss-add-local-PF_VSOCK-AF_VSOCK-definitions.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
