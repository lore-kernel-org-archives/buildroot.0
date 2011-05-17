From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 May 2011 12:21:53 +0300
Subject: [Buildroot] [PATCH] board: mini2440: Add custom patches and
	configs for 2.6.38 kernel series.
In-Reply-To: <BANLkTi=nd4=RF2mGFMFGZhRp25B+UOmDmw@mail.gmail.com>
References: <1305615351-8516-1-git-send-email-marek.belisko@open-nandra.com>
	<20110517094052.65767f36@surf>
	<BANLkTi=nd4=RF2mGFMFGZhRp25B+UOmDmw@mail.gmail.com>
Message-ID: <201105171221.53871.anarsoul@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 17 May 2011 11:48:56 Belisko Marek wrote:
> Hi Thomes,
> 
> On Tue, May 17, 2011 at 9:40 AM, Thomas Petazzoni
> 
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello Marek,
> > 
> > On Tue, 17 May 2011 08:55:51 +0200
> > 
> > Marek Belisko <marek.belisko@open-nandra.com> wrote:
> >> Mini2440 board have except some patches full support in 2.6.38 kernel.
> >> Just add custom patches and adapt default config to have possibility to
> >> build kernel and barebox.
> >> 
> >> Barebox also need some patches but currently it't impossible to do so
> >> just select latest v2011.05.0 where mini2440 have full support. There is
> >> difference between 64M boards and >128MB boards.
> >> 
> >> Patches for kernel was overtaken from pengutronix OSELAS BSP for
> >> mini2440.
> >> 
> >> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> >> ---
> >>  ...40_mini2440_Add_support_for_new_LCD_panels.diff |   65 +
> >>  ...i2440_Add_touchscreen_support_for_mini2440.diff |   69 +
> >>  ...440_mini2440_Select_touchscreen_by_default.diff |   20 +
> >>  ...e_leds-gpio_driver_for_board_leds_handling.diff |  173 +++
> >>  ...005-Drop_exporting_s3c24xx_ts_set_platdata.diff |   29 +
> >>  .../mini2440/0006-fix_gpio_register.diff           |   40 +
> >>  .../mini2440/0007-speed_up_NAND_mounting.diff      |   35 +
> >>  .../friendlyarm/mini2440/0008-make_all_const.diff  |   26 +
> >>  ...009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff |  165 +++
> >>  .../mini2440/0010-remove_device_file.diff          |   21 +
> >>  .../mini2440/0011-make_debug_decision_const.diff   |   65 +
> >>  .../friendlyarm/mini2440/0012-just_a_cleanup.diff  |   67 +
> >>  .../0013-enable_screen_without_console.diff        |   25 +
> >>  board/friendlyarm/mini2440/0014-add_hwmon.diff     |  108 ++
> > 
> > I don't know if Peter will like the fact of adding such a number of
> > patches for a specific hardware, but anyway.
> 
> I try 3 times post patches upstream but Ben Dooks doens't reply at all so
> those patches are missing.

Yep, these days it's pretty hard to get to Ben Dooks :)

Try to ping Kukjin Kim, he maintains s3c64xx and s5p, but can merge s3c24xx 
stuff aswell if Ben Dooks is busy. If he ignores you, try to push stuff 
through Russell King. Or you can ping bjdooks on irc: 
#s3cxxxx at irc.freenode.org

Regards
Vasily
