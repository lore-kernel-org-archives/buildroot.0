From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:46:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnss: fix build failure on
 RHEL 7
In-Reply-To: <20191212140118.90730-2-giulio.benetti@benettiengineering.com>
References: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
 <20191212140118.90730-2-giulio.benetti@benettiengineering.com>
Message-ID: <20191223234604.58342012@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Dec 2019 15:01:17 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> -DLINUX flag was passed to OS_CFLAGS instead of DEFINES, but OS_CFLAGS
> is only used when cross-compiling, not when native building.
> 
> Add patch to fix build failure on RHEL 7 host by substituting OS_CFLAGS
> with DEFINES.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Patch is pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1603398
> ---
>  ...-nsinstall.c-build-failure-on-RHEL-7.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libnss/0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
