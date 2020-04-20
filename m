From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:54:41 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: fix build failure with
 musl libc
In-Reply-To: <20200417153314.37637-1-giulio.benetti@benettiengineering.com>
References: <20200417153314.37637-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200420075441.174bcf23@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 17:33:14 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Musl libc defines time_t as 64-bit causing printf() to fail since it
> tries to pass time_t as a 32-bit("%ld"). So let's add upstream patch[1]
> to fix this issue.
> 
> [1]:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cb75ec49c0a92f55b2241eb1cd95a3fdf63f0dac
> 
> Fixes:
> http://autobuild.buildroot.net/results/35ce3dbd63a658953008ce7e7b99e0580d3f2c4b
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-nfs-utils-print-time-in-64-bit.patch | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 package/nfs-utils/0001-nfs-utils-print-time-in-64-bit.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
