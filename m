From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Nov 2017 15:13:59 +0200
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <3065e82a-8fd5-422c-8734-2fa4257bdc8d@cesnet.cz>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
 <3065e82a-8fd5-422c-8734-2fa4257bdc8d@cesnet.cz>
Message-ID: <20171113131359.56x2divtwvqmzcni@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Mon, Nov 13, 2017 at 01:51:01PM +0100, Jan Kundr?t wrote:
> On pond?l? 13. listopadu 2017 13:27:02 CET, Baruch Siach wrote:
> > Create a uEnv.txt file, and store it in /boot.
> 
> Hi Baruch, does U-Boot auto-load this file on each and every boot?

That depends on the default U-Boot environment. In the case of the 
Macchiatobin the built-in default is empty, and the SPI flash stored 
environment is not in a known state. So you must load uEnv.txt manually on 
every boot to make sure your environment is in a known state.

> If not, than I suggest to name it differently -- perhaps uEnv-recovery.txt. 
> I would expect that any change in a /boot/uEnv.txt somehow propagates to 
> U-Boot environment during the next boot.

That's a good idea.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
