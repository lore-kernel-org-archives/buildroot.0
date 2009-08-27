From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Aug 2009 14:37:32 +0200
Subject: [Buildroot] make saveconfig
In-Reply-To: <9DCCC94F884C46E192B0F4D49A7964B2@apexjs> (Sagaert Johan's
	message of "Thu\, 27 Aug 2009 01\:51\:43 +0200")
References: <9DCCC94F884C46E192B0F4D49A7964B2@apexjs>
Message-ID: <874ortmnzn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,

Please send buildroot related mails to the buildroot list instead of
directly to me.

 Sagaert> Peter
 Sagaert> Before the final 2009.08 release
 
 Sagaert> Any idea why buildroot tries to build package/config/conf
 Sagaert> when i run make saveconfig.
 
 Sagaert> Why is there in project/project.mk a dependency
 Sagaert> package/config/conf for the saveconfig target ?  I would
 Sagaert> think that saveconfig would make just simple copies of the
 Sagaert> config files.

Sorry, no idea. The saveconfig is something Ulf added a long time ago
- But you're right, I don't see why it should be needed for saveconfig
/ getconfig, so I'll remove it.
 
 Sagaert> U boot related :
 
 Sagaert> Only U-boot 2008.10 2009.03 and 2009.06 can be selected, but
 Sagaert> under target/ device/Atmel/arch-arm/u-boot there is
 Sagaert> directory related to u-boot 2009.01

 Sagaert> Why is the 2009.01 release removed from the buildroot menu ?
 Sagaert> There is something to fix on this issue i think.

2009.01 is still there, but marked as deprecated (select Build
Options->Show packages that are deprecated or obsolete to see it). The
real question is why 2008.10 isn't marked as deprecated yet. I vaguely
remember something about 2009.01 being broken on avr32 or similar, but
I guess we can deprecate 2008.10 by now.

-- 
Bye, Peter Korsgaard
