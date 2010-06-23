From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 23:02:55 +0200
Subject: [Buildroot] Storing board configuration ?
In-Reply-To: <20100620143535.38416ef6@surf> (Thomas Petazzoni's message of
	"Sun, 20 Jun 2010 14:35:35 +0200")
References: <20100620143535.38416ef6@surf>
Message-ID: <87eifx5uo0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> But if we do that, we would have to modify the main Makefile so that
 Thomas> when an user does "make foobar_defconfig", configs/foobar_defconfig is
 Thomas> used and for all options non-specified in the defconfig, the default
 Thomas> options would be choosen. So something like :

 Thomas> %_defconfig: $(TOPDIR)/configs/%_defconfig
 Thomas>         cp $^ .config
 Thomas>         @yes "" | $(MAKE) oldconfig

 Thomas> What do you think about this ?

I like it. It will ofcourse hide any new questions you might have wanted
to get asked about, but that's not so bad.

-- 
Bye, Peter Korsgaard
