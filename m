From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Oct 2012 21:46:31 +0200
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel
	jobs via command line
In-Reply-To: <20120926165756.GB31527@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Wed, 26 Sep 2012 18:57:56 +0200")
References: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
 <87txul7sbc.fsf@macbook.be.48ers.dk>
 <20120926062348.GA31527@game.jcrosoft.org>
 <87a9wd6p66.fsf@macbook.be.48ers.dk>
 <20120926165756.GB31527@game.jcrosoft.org>
Message-ID: <87obkm3rhk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

Hi,

 JC> kconfig overwrite and you can not optarg env as
 JC> BR2_JLEVEL is a int so need to use PARALLEL_JOBS
 >> 
 >> Sorry, I don't understand what you are saying here. BR2_JLEVEL works
 >> fine:
 >> 
 >> make BR2_LEVEL=42
 >> ...
 >> /usr/bin/make -j42 CC="/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc" ..
 Jean-Christophe> here does not work

 Jean-Christophe> I try this

 Jean-Christophe> with a value of BR2_JLEVEL at 4

 Jean-Christophe> BR2_JLEVEL=13 make

That doesn't work. Variables defined on the make commandline take
precedence over definitions in makefiles, but environment variables
don't (and should not, stuff would break all the time).

Just use make BR2_JLEVEL=$BR2_JLEVEL to get your shell to expand the
variable for you.

-- 
Bye, Peter Korsgaard
