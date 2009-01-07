From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 11:30:28 +0100
Subject: [Buildroot] Buildroot Not Using Saved Config for Linux
In-Reply-To: <BAY124-W513BAFC261A9EA054E0337D2DE0@phx.gbl>
References: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
	<1231266708.32308.211.camel@elrond.atmel.com>
	<BAY124-W513BAFC261A9EA054E0337D2DE0@phx.gbl>
Message-ID: <1231324228.32308.285.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 14:43 -0800 skrev Quick X:
> Ahh, I just noticed that this bug was already subitted here a few months ago at:
> http://lists.busybox.net/pipermail/buildroot/2008-November/024028.html

This line is the problem.

target/device/Atmel/Makefile.in:LINUX26_KCONFIG:=
$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config

This forces the linux to ALWAYS try the config
with an identical kernel major/minor first
if there is one in the board directory.

Not so useful if you have your own project...
Comment that out, and it will work.

The real solution is elsewhere.
I think that if the make saveconfig needs to be updated
so that BR2_BOARD_PATH is $(LOCAL)/$(PROJECT)
I just committed that.

If you update the svn then it might work.




> He words the problem better than I.  Cheers, NB
> _________________________________________________________________
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
