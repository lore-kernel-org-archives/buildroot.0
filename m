From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:02:57 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix build for kernel
 headers >= 3.10
In-Reply-To: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
References: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140726090257.0feb0d7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Fri, 25 Jul 2014 22:34:30 -0700, Gary Bisson wrote:
> This package couldn't build using a toolchain with kernel headers >=
> 3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
> videodev2.h, this ioctl should never be used.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Yann, Thomas, all,
> After looking at the source code it appears that nothing justifies the use of
> that obsolete ioctl. Its only purpose is to get the video device name so this
> patch actually removes those unnecessary calls.
> Thanks,
> Gary

So, if I'm correct, this supersedes the patches from Yann
(http://patchwork.ozlabs.org/patch/373813/ and
http://patchwork.ozlabs.org/patch/373814/), right ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
