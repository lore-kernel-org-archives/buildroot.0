From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Feb 2018 09:58:32 +0200
Subject: [Buildroot] How to change UART1 to UART3 on i.M6Q?
In-Reply-To: <1519378150006-0.post@n4.nabble.com>
References: <1519378150006-0.post@n4.nabble.com>
Message-ID: <20180225075832.wkkumlnymhllr4e7@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julia,

On Fri, Feb 23, 2018 at 02:29:10AM -0700, Julia Ding wrote:
> I'm using 'imx6-sabresd_qt5_defconfig' this config.
> 
> I want to change UART1 to UART3.
> 
> Don't know how to change it.
> 
> Can someone give me some clue? Thanks.

I assume that you you want the console over UART3 instead of UART1.

At the Buildroot configuration you only need to change the value of 
BR2_TARGET_GENERIC_GETTY_PORT from ttymxc0 to ttymxc2.

Whether this works or not depends also on the kernel device-tree. 
Specifically, pin-control, pin-mux, and UART settings. You might also need to 
change the U-Boot configuration. This is just a clue, as you asked. The 
details are not in scope for this list.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
