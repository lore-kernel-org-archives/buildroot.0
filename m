From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 14:49:42 +0200
Subject: [Buildroot] ccache directory
In-Reply-To: <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 24 Jul 2011 13:23:13
 +0200")
References: <CAAXf6LUROj4Pg2TLKETfo5SNYuC=teuFbcHEyhELuvmmTNTwvw@mail.gmail.com>
 <20110720181955.36911f14@skate> <87livs1xv4.fsf@macbook.be.48ers.dk>
 <20110721075819.5a535238@skate>
 <CAAXf6LUHjWVv794Voi40DPOy+QAaZNpdVKp8Z-k=yFcRtxay-Q@mail.gmail.com>
Message-ID: <874o2byhax.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:


Hi,

 >> That's another possibility, but I find it quite confusing to have some
 >> parameters set by environment variables, and some other by
 >> configuration options.

 Thomas> The disadvantage with this particular configuration variable, is that
 Thomas> it requires a forced recompilation of host-ccache in order for changes
 Thomas> to this variable to take effect.

 Thomas> Another solution is to remove the hardcoded cache directory, use the
 Thomas> CCACHE_DIR environment variable, but let buildroot set that variable
 Thomas> based on BR2_CCACHE_DIR (a configuration option). This addresses
 Thomas> Thomas' point regarding mixing environment variables and configuration
 Thomas> options, and my request of being able to change the cache directory
 Thomas> and making sure these changes are automatically in effect.

 Thomas> What do you think?

Yes, something like:

# use BR setting if not set in environment
ifndef CCACHE_DIR
CCACHE_DIR:=$(call qstrip,BR2_CCACHE_DIR)
endif

export CCACHE_DIR

in the toplevel Makefile.

-- 
Bye, Peter Korsgaard
