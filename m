From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:46:52 +0200
Subject: [Buildroot] [PATCH] eudev: add patch to fix getrandom() system
 call on ARM64
In-Reply-To: <1470301486-1223-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470301486-1223-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160804224652.702c42ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 11:04:46 +0200, Thomas Petazzoni wrote:
> When the kernel headers in the toolchain don't provide __NR_getrandom,
> eudev has a predefined set of values. However, the provided value for
> ARM64 is incorrect, and causes a runtime problem on this architecture
> when old kernel headers (not providing __NR_getrandom) are used.
> 
> This commit adds a patch to eudev to fix this issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...missing.h-fix-getrandom-system-call-numbe.patch | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/eudev/0002-src-shared-missing.h-fix-getrandom-system-call-numbe.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
