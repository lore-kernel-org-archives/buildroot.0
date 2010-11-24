From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 15:33:06 +0100
Subject: [Buildroot] CTRL+C in menuconfig deletes .config
In-Reply-To: <20101116154822.56bea50f@surf> (Thomas Petazzoni's message of
	"Tue, 16 Nov 2010 15:48:22 +0100")
References: <201011160923.42622.vapier@gentoo.org>
	<20101116154822.56bea50f@surf>
Message-ID: <87tyj66bbx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> After a quick dig in Buildroot git history, I found the commit that
 Thomas> introduced this:

 Thomas> commit 153b1beaeb02e1d4780428c0387b7003644e402b
 Thomas> Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
 Thomas> Date:   Fri Jul 27 12:37:30 2007 +0000

 Thomas>     - fix building mconf with curses flags
 Thomas>     - make sure to rm .config when the first 'make menuconfig' was
 Thomas>       interrupted and thus no .config.cmd was created.

 Thomas> The test "test -f $(CONFIG_DIR)/.config.cmd" is supposed to prevent the
 Thomas> behaviour you're seeing, but the thing is that this file no longer
 Thomas> seems to be generated. I haven't had the time to understand why.

I believe it was from one of the mconf changes Bernhard did that we're
not using anymore. I've removed it in git.

-- 
Bye, Peter Korsgaard
