From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:10:12 +0100
Subject: [Buildroot] [PATCH v2] boost: bump to version 1.63.0
In-Reply-To: <20170312121638.14911-1-joerg.krause@embedded.rocks>
References: <20170312121638.14911-1-joerg.krause@embedded.rocks>
Message-ID: <20170312141012.6eaa564f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 13:16:38 +0100, J?rg Krause wrote:
> Remove getchar() patch which has been applied upstream.
> 
> Add recommanded post-release patch from upstream to fix 64-bit atomic
> operations on 32-bit x86 with gcc versions older than 4.7.
> 
> Add a patch from upstream to fix FPE issue with uClibc-based toolchains.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * include FPE patch
> ---
>  ...ted-register-usage-in-x86-DCAS-asm-blocks.patch |  65 +++++++++++
>  ...fix-getchar-with-uclibc-and-gcc-bug-58952.patch |  45 --------
>  package/boost/0005-fix-test-of-fpe-support.patch   | 119 +++++++++++++++++++++
>  package/boost/boost.hash                           |   5 +-
>  package/boost/boost.mk                             |   2 +-
>  5 files changed, 187 insertions(+), 49 deletions(-)
>  create mode 100644 package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
>  delete mode 100644 package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
>  create mode 100644 package/boost/0005-fix-test-of-fpe-support.patch

Applied to master, thanks. Let's see what the autobuilders have to
say :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
