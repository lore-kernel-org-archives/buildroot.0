From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 23:02:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Xilinx zc706
In-Reply-To: <1426060630-13680-1-git-send-email-jordi.montagne66@gmail.com>
References: <1426060630-13680-1-git-send-email-jordi.montagne66@gmail.com>
Message-ID: <20150720230252.2910022a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jordi Montagne,

On Wed, 11 Mar 2015 08:57:10 +0100, Jordi Montagne wrote:
> This is a Xilinx Zynq (xc7z045) development board, based on Xilinx Zynq
> (xc7z045).
> 
> This support is based on Avnet Zedboard defconfig/readme.
> 
> Signed-off-by: Jordi Montagne <jordi.montagne66@gmail.com>
> ---
> Changes since v1:
>  * use EABIHF instead of EABI
>  * some fix on readme.txt (thanks Thomas Petazzoni)
> ---
>  board/xilinx/zc706/readme.txt | 57 +++++++++++++++++++++++++++++++++++++++++++
>  configs/zc706_defconfig       | 27 ++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 board/xilinx/zc706/readme.txt
>  create mode 100644 configs/zc706_defconfig

I've finally applied your patch, after some minor changes:

    [Thomas:
     - minor fixes in the readme.txt
     - rename defconfig from zc706_defconfig to xilinx_zc706_defconfig.]

However, in the mean time, the zedboard_defconfig has been quite
significantly improved. Especially, it no longer requires the special
ps7_init.c/h from the Xilinx SDK. See the following commits for details:

  http://git.buildroot.net/buildroot/commit/?id=ee845a46e2e7d60ac52c38555c183020ce8cd711
  http://git.buildroot.net/buildroot/commit/?id=aabe23f8615f065d7bf62801d38efd17125e78d0
  http://git.buildroot.net/buildroot/commit/?id=46d6a561be418e67c3f859f7d3e7461b2a663749
  http://git.buildroot.net/buildroot/commit/?id=c139f0cce7d78e21b67f4649541a25ae8b5251f4

Maybe you can have a look at the new Zedboard support and update the
ZC706 support as well?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
