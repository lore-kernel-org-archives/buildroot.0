From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:46:28 +0200
Subject: [Buildroot] [PATCH] {linux,
 linux-headers}: fix linux-4.9.133.tar.xz checksum
In-Reply-To: <20181017135519.12202-1-antoine.tenart@bootlin.com>
References: <20181017135519.12202-1-antoine.tenart@bootlin.com>
Message-ID: <20181017214628.5030294b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Oct 2018 15:55:19 +0200, Antoine Tenart wrote:
> The Linux tarball checksum was recently updated, including the one for
> version 4.9.133. The checksum for this particular version of Linux
> misses one character which lead to a build issue as the checksum does
> not match:
> 
> ERROR: linux-4.9.133.tar.xz has wrong sha256 hash:
> ERROR: expected: 3730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
> ERROR: got     : 53730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> This patch fixes it.
> 
> Fixes: 0064c7b25125 ("{linux, linux-headers}: bump 4.{4, 9, 14, 18}.x series")
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> ---
>  linux/linux.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
