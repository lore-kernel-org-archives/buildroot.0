From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Mon, 23 Sep 2019 16:55:17 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <87tv93w43e.fsf@dell.be.48ers.dk>
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
 <87tv93w43e.fsf@dell.be.48ers.dk>
Message-ID: <b7b94ae1-538a-039e-98bc-5f210a769c4d@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23.9.2019 16.10, Peter Korsgaard wrote:
>>>>>> "Timo" == Timo Ketola <Timo.Ketola@exertus.fi> writes:
> 
>  > When booting with 'console=<empty>' in the kernel command line (as e.g.
>  > U-Boot does with silent flags in effect), opening /dev/console fails.
>  > That is fatal in the /init script and kernel will panic. It is also
>  > needless, because the kernel tries to open it anyway (well, as long as
>  > we have console node in initramfs /dev; cpio.mk creates that alright).
> 
> Also when devtmpfs is used? We manually mount devtmpfs in the initramfs,
> so the kernel presumably cannot have opened /dev/console before
> executing /init, and we do not add a static device node for
> /dev/console.

But I thought BR does just that here:

https://git.busybox.net/buildroot/tree/fs/cpio/cpio.mk

line 24, 25

-- 

Timo
