From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:49:21 +0200
Subject: [Buildroot] [PATCH] procps-ng: fix BR2_STATIC_LIBS=y build
In-Reply-To: <1470561551-22910-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470561551-22910-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809154921.187d5a3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 11:19:11 +0200, Thomas Petazzoni wrote:
> The procps-ng package currently fails to build on BR2_STATIC_LIBS=y
> configurations. Indeed, by default NUMA support is enabled, and it
> requires dlopen(). As hinted by the configure script, passing
> --disable-numa allows to disable NUMA support.
> 
> However, once this is done, another issue pops up: dlopen() is also used
> by the SELinux support. But even when SELinux support is disabled, the
> procps-ng code incorrectly includes <dlfcn.h>. This is addressed by the
> addition of a patch.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b385bf435085728aece6323a5006ba9fa6631744/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...put.c-include-dlfcn.h-only-when-necessary.patch | 32 ++++++++++++++++++++++
>  package/procps-ng/procps-ng.mk                     |  6 ++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
