From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:55:37 +0200
Subject: [Buildroot] [PATCH] board/raspberrypi: use kernel Bluetooth mode
In-Reply-To: <20210714145132.533559-1-john@metanate.com>
References: <20210714145132.533559-1-john@metanate.com>
Message-ID: <20210720215537.3f47b47e@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 14 Jul 2021 15:51:32 +0100
John Keeping <john@metanate.com> wrote:

> The default setting with miniuart-bt requires hciattach which is a
> deprecated utility in BlueZ.  Setting the krnbt parameter switches to
> the modern method of using serdev in the kernel removing the need for
> any userspace configuration to enable the Bluetooth controller.
> 
> This is documented as applying to all Raspberry Pi variants so just
> enable it globally.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  board/raspberrypi/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Peter, Yann: I have read your reviews, and they both have good points.
However, I think John's patch keeps the state of a minimal defconfig,
it only makes it a bit easier to have operational Bluetooth. I
certainly don't mind seeing further improvements on how our RPi support
is done, but I believe John's patch was OK as-is as it improves the
situation for users, without any specific downside that I can think of.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
