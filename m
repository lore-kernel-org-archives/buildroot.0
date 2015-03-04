From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:39:21 +0100
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: custom dts path - build
 dtb only from *.dts files
In-Reply-To: <1425221504-28223-1-git-send-email-ivo.slanina@gmail.com>
References: <1425221504-28223-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <20150304233921.4637fdef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivo Slanina,

On Sun,  1 Mar 2015 15:51:44 +0100, Ivo Slanina wrote:
> When building device tree blobs from custom *.dts files, buildroot
> initializes KERNEL_DTS_NAME variable from all given file names.
> This causes that user can't provide one *.dts file and some other
> *.dtsi files as dependencies.
> 
> Problem is fixed by adding filter for initializing KERNEL_DTS_NAME
> variable with *.dts files only. All user provided files are copied
> into kernel source tree, but only file names suffixed with *.dts
> are used for building appropriate *.dtb files.
> 
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>

Thanks, applied!

I've only added a comment in the linux.mk file itself to explain why we
are doing this .dts filtering.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
