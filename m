From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:22:40 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.63.0
In-Reply-To: <20170310201512.12260-1-joerg.krause@embedded.rocks>
References: <20170310201512.12260-1-joerg.krause@embedded.rocks>
Message-ID: <20170310222240.3f70bc41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 21:15:12 +0100, J?rg Krause wrote:
> Remove getchar() patch which has been applied upstream.
> 
> Add recommanded post-release patch from upstream to fix 64-bit atomic
> operations on 32-bit x86 with gcc versions older than 4.7.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...ted-register-usage-in-x86-DCAS-asm-blocks.patch | 65 ++++++++++++++++++++++
>  ...fix-getchar-with-uclibc-and-gcc-bug-58952.patch | 45 ---------------
>  package/boost/boost.hash                           |  5 +-
>  package/boost/boost.mk                             |  2 +-
>  4 files changed, 68 insertions(+), 49 deletions(-)
>  create mode 100644 package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
>  delete mode 100644 package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch

Applied to master, thanks. Since Boost is a package that often causes
some build issues in other packages when it's upgraded, it would be
good if you could keep an eye on the autobuilders in the next few days,
and see if there's anything boost related.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
