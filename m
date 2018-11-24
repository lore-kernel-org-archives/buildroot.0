From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:51:40 +0100
Subject: [Buildroot] [PATCH 1/1] gcc/config/riscv: define _REENTRANT for
 RISC-V when -pthread is passed
In-Reply-To: <20181122133112.26701-1-mark.corbin@embecosm.com>
References: <20181122133112.26701-1-mark.corbin@embecosm.com>
Message-ID: <20181124115140.4d74678f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 13:31:12 +0000, Mark Corbin wrote:
> The detection of pthread support fails on RISC-V unless _REENTRANT
> is defined. Added the CPP_SPEC definition from gcc 8.1.0 to correct
> this.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  ...TRANT-for-RISC-V-when-pthread-is-pas.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/gcc/7.3.0/1001-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch

Applied to master, thanks. I have also reverted all the
package-specific fixes we had to add _REENTRANT to fix this RISC-V
issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
