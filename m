From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 16:08:26 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/dropwatch: bump to version 1.5.1
In-Reply-To: <20190719211003.3678-1-fontaine.fabrice@gmail.com>
References: <20190719211003.3678-1-fontaine.fabrice@gmail.com>
Message-ID: <20190801160826.315f973a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 19 Jul 2019 23:10:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site, see
>   http://git.infradead.org/users/nhorman/dropwatch.git/blob/975fd7331d19a32f6d0f20781dfb19f2d14c3c31:/README
> - Switch to autotools (and so drop second patch on Makefile: if there is
>   some errors raised by -Werror, we'll fix them)
> - Update first patch by upstream commit
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Replace first patch with upstream commit

Applied to master, thanks. Peter and I took the chance of this patch to
have a look at why dropwatch depends on binutils. It's quite crazy, and
totally useless in the context of Buildroot. dropwatch listens for
netlink messages from the kernel about dropped packages. Such messages
include the program counter of where the packet was dropped in the
kernel. It then uses either kallsyms, or libbfd on the kernel modules
in /usr/lib/debug to figure out the kernel function where the packet
drop occurred. Since we don't install kernel modules in /usr/lib/debug,
this is totally useless, and it should be possible to make binutils
an optional dependency of dropwatch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
