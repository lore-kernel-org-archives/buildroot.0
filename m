From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 13 Oct 2008 08:12:28 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG and Atmel targets
In-Reply-To: <48F1CE78.3040908@control.lth.se>
References: <48F1CE78.3040908@control.lth.se>
Message-ID: <20081013081228.14f1e6c7@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Oct 2008 12:16:24 +0200
Anders Blomdell <anders.blomdell@control.lth.se> wrote:

> in target/device/Atmel/atngw100/Makefile.in there is a line
> 
> BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.9.1.config
> 
> unfortunately this makes it impossible to change busybox config 
> (primarily I want to turn off telnet) to a custom version. What is
> the correct way to handle this?
> 

Well, naming indicates that you will need to add a
busybox-<version>.config file.

It is probably a good idea to scrap the <version> part as well, just
have a generic busybox.config file. Kconfig options should not change
that often, and user will be asked to answer yes/no to new features
most times.

-- 
Best regards,
Hans-Christian Egtvedt
