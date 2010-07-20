From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jul 2010 08:45:25 +0200
Subject: [Buildroot] make linux26-menuconfig
In-Reply-To: <001a01cb27ce$6015d1a0$204174e0$@pauljones.id.au> (Paul Jones's
	message of "Tue, 20 Jul 2010 15:42:41 +1000")
References: <001a01cb27ce$6015d1a0$204174e0$@pauljones.id.au>
Message-ID: <87oce2k5x6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul@pauljones.id.au> writes:

 Paul> I?m not sure if this is a bug or not, so I thought I?d ask here.
 Paul> I just spent the last 20 mins trying to figure out why make linux26-menuconfig
 Paul> didn?t work ? it was because I was running it immediately after make
 Paul> menuconfig, so /output/toolchain/bin/sed didn?t yet exist.

Yes, the linux26-menuconfig target was missing a dependency on host-sed
(like uclibc-menuconfig has) - Thanks.

-- 
Bye, Peter Korsgaard
