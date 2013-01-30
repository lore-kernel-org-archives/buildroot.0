From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2013 06:58:32 +0200
Subject: [Buildroot] making a second small failsafe file system
In-Reply-To: <1359509586.7974.207.camel@genx>
References: <1359509586.7974.207.camel@genx>
Message-ID: <20130130045831.GA12106@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

On Tue, Jan 29, 2013 at 05:33:06PM -0800, John Stile wrote:
> I have a board with 8Mb of NOR and 256Mb of NAND.
> 
> I plan to normally use NAND, divided into redundant halves, but if
> neither half can boot, I would like a failsafe minimal file system on
> NOR in order to re-image NAND over the network.
> 
> What are my options?  

My solutions was a tiny initramfs embedded in the kernel image. This initramfs 
contains (almost) only a statically built busybox binary. The /init script of 
initramfs execs a shell as a fallback when the main filesystem is not 
mountable.

You'll probably wan a uClibc toolchain for this busybox image (if you don't 
use one already) to keep its size minimal.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
