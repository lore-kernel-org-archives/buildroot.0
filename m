From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jun 2010 08:57:39 +0200
Subject: [Buildroot] file 5.04 build problem
In-Reply-To: <AANLkTikMAkJuMaruOkIMhJyqeAJIAD9OHdvJ8_B5IgIR@mail.gmail.com>
	(Chris Kerios's message of "Wed, 9 Jun 2010 19:21:42 -0400")
References: <AANLkTimzWZ6hMxsy68DYLja5UmL_KXU4e1_8koRJ4VOU@mail.gmail.com>
	<AANLkTikMAkJuMaruOkIMhJyqeAJIAD9OHdvJ8_B5IgIR@mail.gmail.com>
Message-ID: <878w6ngysc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Kerios <ckerios@gmail.com> writes:

 Chris> ****NEVERMIND****
 Chris> Looked at the instructions deeper in config output and deleted the
 Chris> tgt-config.cache file and restarted make.  Problem went away and build
 Chris> is continuing.  Sorry for the noise.
 Chris> Chris

Still, it's a bug. File should either not override CFLAGS or it should
disable the config cache.

From a quick look, I don't think it needs the special CFLAGS - But I'll
do a testbuild without it and fix.

-- 
Bye, Peter Korsgaard
