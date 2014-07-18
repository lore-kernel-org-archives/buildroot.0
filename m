From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 20:04:33 +0200
Subject: [Buildroot] [PATCH] python: fix termios build for xtensa
In-Reply-To: <768f113a0cb394fde79b38ef52056ff8e335df0a.1405654360.git.baruch@tkos.co.il>
References: <768f113a0cb394fde79b38ef52056ff8e335df0a.1405654360.git.baruch@tkos.co.il>
Message-ID: <20140718200433.5c2dff64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 18 Jul 2014 06:32:40 +0300, Baruch Siach wrote:
> The xtensa ioctls.h header references struct serial_multiport_struct that is
> not defined in this header or included headers. ioctls.h also references
> tty_struct that is not exported to userspace at all. Add a patch fixing these
> issues.
> 
> This is only a workaround as the real problem should be fixed in the kernel
> (by removing all struct references like all other archs). But since we support
> older kernel versions we'll have to carry this patch for some time.
> 
> Fixes:
> http://autobuild.buildroot.net/results/12b/12b5612828d7f1fc7d1f69fc01341d5a6e628db5/
> 
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../python-015-serial-ioctl-workaround.patch       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/python/python-015-serial-ioctl-workaround.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
