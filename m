From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jun 2009 20:05:51 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based	devices
In-Reply-To: <20090608152024.GA5158@mx.loc> (Bernhard Reutner-Fischer's
	message of "Mon\, 8 Jun 2009 17\:20\:24 +0200")
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
	<1244473080-8195-2-git-send-email-daniel@caiaq.de>
	<20090608152024.GA5158@mx.loc>
Message-ID: <87ljo2sirk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Mon, Jun 08, 2009 at 04:58:00PM +0200, Daniel Mack wrote:
 >> Devices based on Freescale's MXC SoCs need some extra attention to start
 >> the gettys from init. In particular, the /dev/ttymxc0 inode needs to be
 >> created and added to inittab and securetty.

 Bernhard> I think it would be easier to just sed them out if it's not
 Bernhard> a device that has /dev/ttymxc and leave them in inittab and
 Bernhard> securetty otherwise.

Or use the infrastructure we have in target/generic for just this.

-- 
Bye, Peter Korsgaard
