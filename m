From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 14:27:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/usb_modeswitch: fix parallel
 install
In-Reply-To: <20200517090528.1724124-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 May 2020 11:05:28 +0200")
References: <20200517090528.1724124-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8mkjtno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Extract from bug report:
 > "In usb_modeswitch Makefile dispatcher-script, dispatcher-dynlink and
 > dispatcher-statlink are .PHONY targets. The result is that sources are
 > compiled also when install targets are called.
 > USB_MODESWITCH_INSTALL_TARGET_CMDS calls $(MAKE) which is a call to
 > parallel make eg. make -j9. So the install phase can install empty
 > usb_modeswitch binary (happened once) if the compiler have just cleared
 > the binary and install command installs it before compiler writes the
 > binary. USB_MODESWITCH_INSTALL_TARGET_CMDS should call $(MAKE1)."

 > Instead of disabling parellel install, use install-common target instead
 > of install-{dyn,stat}link targets. Indeed, the dynamic or static
 > usb_modeswitch_dispatcher binary will be built by
 > all-with-{dyn,stat}link-dispatcher targets, there is no need to rebuild
 > it during the install step

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=12911

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
