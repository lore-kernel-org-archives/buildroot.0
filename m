From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:26:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: separate user and system
 arch on powerpc64le
In-Reply-To: <25181d88c76029050a2f8535172838dc0a7f53f5.1481254393.git.sam.bobroff@au1.ibm.com>
References: <25181d88c76029050a2f8535172838dc0a7f53f5.1481254393.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161210152648.23bf53e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Dec 2016 14:33:15 +1100, Sam Bobroff wrote:
> QEMU provides a single system emulator that supports both powerpc64
> and powerpc64le with a target called 'ppc64-softmmu', but it provides
> a different usermode emulator for each one (with targets
> 'ppc64le-linux-user' and 'ppc64-linux-user').
> 
> Due to this asymmetry it is not possible to support both cases with
> the single arch value used in the package file. This patch introduces
> an additional value into the package configuration,
> HOST_QEMU_SYS_ARCH, so that both cases can be supported.
> 
> Fixes commit d2ff457e88ff4106f97e29516d467978827d30c2
> and autobuilder failture
> http://autobuild.buildroot.net/results/a2d63e21c3e82c36f4a975e90ed56faba18e97a5
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> Hi Buildroot,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
