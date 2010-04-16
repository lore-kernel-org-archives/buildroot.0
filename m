From: Andrew Porritt <aporritt@gogo-robot.com>
Date: Fri, 16 Apr 2010 17:29:56 +0100
Subject: [Buildroot] Where does 'BOARD_NAME' Makefile.in variable come
 from?
In-Reply-To: <hqa2ka$uek$1@dough.gmane.org>
References: <hqa2ka$uek$1@dough.gmane.org>
Message-ID: <4BC89084.1090404@gogo-robot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think you pass it in on the command line. E.g.:

make BOARD_NAME=at91sam9261ek

On 16/04/2010 17:18, Grant Edwards wrote:
> I'm looking at the default config files and Makefile.in files for the
> Atmel boards, and they all reference a variable named "BOARD_NAME".
> For example from target/device/Atmel/at91sam9261ek/Makefile.in:
>
> ifeq ($(strip $(BOARD_NAME)),at91sam9261ek)
> LINUX_BOARD_NAME:=at91sam9261ek
> ...
>
> And from at91sam9263ek_defconfig
>
> BR2_TARGET_AT91BOOTSTRAP_BOARD="$(BOARD_NAME)"
>
> But, I can't figure out where BOARD_NAME comes from or how it differs
> from BR2_BOARD_NAME.  Can somebody point me towards a clue?
>
>    
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100416/bf36865f/attachment.htm>
