From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 08:42:37 +0100
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_zero_plus2_defconfig:
 bump BSP versions
In-Reply-To: <20210127060520.616445-4-geomatsi@gmail.com>
References: <20210127060520.616445-1-geomatsi@gmail.com>
 <20210127060520.616445-4-geomatsi@gmail.com>
Message-ID: <c3d4a094-b4cb-dbed-2526-71ea4d702df5@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/2021 07.05, Sergey Matyukevich wrote:
> Bump Linux to 5.10.10 and U-Boot to 2020.10. In the new kernel sunxi-mmc
> driver has been switched to asynchronous probe. As a result, mmc indexes
> can be shuffled breaking board boot. Add patch that pins mmc indexes to
> their original ordered values.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed, thanks. Another option would be to move to finding the rootfs 
by label like I recently did for the orangepi r1:

https://git.buildroot.net/buildroot/commit/?id=34cce93adb06608992023c44fa3245d1f1a3deb4

https://git.buildroot.net/buildroot/commit/?id=38d04e6b13410f79ab18044737bdb078c637136a

-- 
Bye, Peter Korsgaard
