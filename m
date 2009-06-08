From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jun 2009 17:07:13 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based devices
In-Reply-To: <1244473080-8195-2-git-send-email-daniel@caiaq.de> (Daniel Mack's
	message of "Mon\, 8 Jun 2009 16\:58\:00 +0200")
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
	<1244473080-8195-2-git-send-email-daniel@caiaq.de>
Message-ID: <87prdesr1a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> Devices based on Freescale's MXC SoCs need some extra
 Daniel> attention to start the gettys from init. In particular, the
 Daniel> /dev/ttymxc0 inode needs to be created and added to inittab
 Daniel> and securetty.

Why are you using the armltd stuff with a freescale board? It would
imho be nicer to just add the ttymxcX nodes to the serial console
selection of target/generic (BR2_TARGET_GENERIC_GETTY).

On a related note, I think the /etc/securetty files are more trouble
than they are worth - We should probably remove the feature from the
default busybox configs.

-- 
Bye, Peter Korsgaard
