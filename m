From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:36:34 +0200
Subject: [Buildroot] [PATCH v2] arch/x86: remove support for i386
In-Reply-To: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1460928694-22593-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160418233634.0abb1d22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:31:34 +0200, Thomas Petazzoni wrote:
> The Linux kernel doesn't even support i386 anymore, there is no NPTL
> support for i386 and uClibc-ng only supports NPTL on x86, so there is
> essentially no usable thread implementation. Most likely glibc and
> musl also don't support i386 either. So it's time to remove the
> support for this architecture variant.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - Add Config.in.legacy entry, as suggested by Arnout.
>  - Remove i386 reference in qemu.mk, as noticed by Arnout.
> ---
>  .defconfig                             | 1 -
>  Config.in.legacy                       | 6 ++++++
>  arch/Config.in.x86                     | 5 -----
>  package/openssl/openssl.mk             | 5 -----
>  package/qemu/qemu.mk                   | 1 -
>  package/uclibc/Config.in               | 3 +--
>  toolchain/toolchain-common.in          | 3 ---
>  toolchain/toolchain-external/Config.in | 3 +--
>  8 files changed, 8 insertions(+), 19 deletions(-)

Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
