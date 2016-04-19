From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:13:58 +0200
Subject: [Buildroot] [PATCH 3/4] linux-headers: rename _AS_KERNEL to
	_FROM_KERNEL
In-Reply-To: <1461099155-30702-4-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-4-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160419231358.61e8f0c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 16:52:34 -0400, Vivien Didelot wrote:
> BR2_KERNEL_HEADERS_AS_KERNEL is confusing when making the choice between
> downloading the headers from an independent kernel source, and using the
> headers found in the kernel built by Buildroot.
> 
> Rename it to BR2_KERNEL_HEADERS_FROM_KERNEL.
> 
> In the meantime, document this distinction between the two choices.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

I tend to disagree here. The headers are not "from" the kernel, since
in practice, we download the kernel source code twice and extract it
twice. So the "as kernel" really seem better. It could be "like kernel"
as well, but "from kernel" seems wrong.

However, I'm all for improving the help texts to make this clearer.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
