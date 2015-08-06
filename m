From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:07:10 +0200
Subject: [Buildroot] [PATCH v3] package/eudev: fix build with musl +
 libselinux
In-Reply-To: <1438349093-17604-1-git-send-email-romain.naour@openwide.fr>
References: <1438349093-17604-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150806090710.7f68171e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 31 Jul 2015 15:24:53 +0200, Romain Naour wrote:
> Add a patch to disable mallinfo statistics with musl toolchains
> which doesn't have struct mallinfo.
> 
> Fixes:
> selinux-util.c: In function ?mac_selinux_init?:
> selinux-util.c:70:25: error: storage size of ?before_mallinfo? isn?t known
>          struct mallinfo before_mallinfo, after_mallinfo;
> 
> Add a second patch for strndupa() which is a GNU extension.
> 
> Fixes:
> ./.libs/libudev-core.a(selinux-util.o): In function `mac_selinux_bind':
> selinux-util.c:(.text+0xd94): undefined reference to `strndupa'
> collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
> v3: Don't enclose the timestamp stuff inside HAVE_MALLINFO (ThomasP)
> v2: new patch
> ---
>  .../eudev/0002-build-sys-check-for-mallinfo.patch  | 93 ++++++++++++++++++++++
>  .../eudev/0003-build-sys-check-for-strndupa.patch  | 69 ++++++++++++++++
>  package/eudev/eudev.mk                             |  5 ++
>  3 files changed, 167 insertions(+)
>  create mode 100644 package/eudev/0002-build-sys-check-for-mallinfo.patch
>  create mode 100644 package/eudev/0003-build-sys-check-for-strndupa.patch

I've applied the patch, with the hope that the patches will be merged
upstream. Supporting musl+selinux is a fairly odd setup, so carrying
around forever patches for this specific setup would be a bit annoying.

Can you make sure to keep pushing the patches upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
