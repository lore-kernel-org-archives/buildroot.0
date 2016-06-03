From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 16:14:12 +0200
Subject: [Buildroot] [PATCH 4/4] vpnc: add patches to fix build with the
 musl C library
In-Reply-To: <1455145392-2355-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455145392-2355-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160603161412.23540b86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Feb 2016 00:03:12 +0100, Thomas Petazzoni wrote:
> This commit adds hree patches that are needed to fix build issues on
> musl:
> 
>  - <error.h> not available on musl
>  - structure redefinitions due to direct inclusion of kernel headers
>  - missing <sys/ttydefaults.h> inclusion
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...n-t-assume-error.h-is-available-on-all-Li.patch | 54 +++++++++++++++++++++
>  ...p.c-don-t-include-linux-if_tun.h-on-Linux.patch | 56 ++++++++++++++++++++++
>  ...g.c-add-missing-sys-ttydefaults.h-include.patch | 38 +++++++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 package/vpnc/0007-sysdep.h-don-t-assume-error.h-is-available-on-all-Li.patch
>  create mode 100644 package/vpnc/0008-sysdep.c-don-t-include-linux-if_tun.h-on-Linux.patch
>  create mode 100644 package/vpnc/0009-config.c-add-missing-sys-ttydefaults.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
