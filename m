From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 16:20:37 +0200
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install
	to target
In-Reply-To: <5230757A.10201@gmail.com> (Ryan Coe's message of "Wed, 11 Sep
 2013 06:51:54 -0700")
References: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
 <20130911092734.2c4bee5f@skate> <874n9rsiti.fsf@dell.be.48ers.dk>
 <5230757A.10201@gmail.com>
Message-ID: <87vc27qw22.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

Hi,

 Ryan> Without the depmod in the target install, I do not get the necessary
 Ryan> files installed to the target.  I am unable to load modules until I
 Ryan> manually run depmod -a.

Really? LINUX_MAKE_FLAGS expands to .. DEPMOD=$(HOST_DIR)/sbin/depmod,
so we ended up passing 2x DEPMOD= to modules_install.

-- 
Bye, Peter Korsgaard
