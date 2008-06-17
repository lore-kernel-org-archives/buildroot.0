From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 20:44:09 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20080617155338.GI27792@mx.loc> (Bernhard Fischer's message of
	"Tue\, 17 Jun 2008 17\:53\:38 +0200")
References: <20080617133035.AC6F63C786@busybox.net>
	<20080617155338.GI27792@mx.loc>
Message-ID: <87fxrbj406.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Tue, Jun 17, 2008 at 06:30:35AM -0700, jacmet at uclibc.org wrote:
 >> Author: jacmet
 >> Date: 2008-06-17 06:30:35 -0700 (Tue, 17 Jun 2008)
 >> New Revision: 22401
 >> 
 >> Log:
 >> toolchain/uclibc: strip libpthread

 Bernhard> Those are options in uclibc-menuconfig.

Sorry, I don't see it. Do you mean CONFIG_PTHREADS_DEBUG_SUPPORT?
uclibc (0.9.28.3) doesn't seem to strip libpthread even with that
option disabled.

 Bernhard> By unconditionally stripping it (and not even using the
 Bernhard> flags!) you foobar'ed somebody's setup who wanted to retain
 Bernhard> just uClibc/lib/lib*so's debug symbols.

Notice that I'm stripping the ones in TARGET_DIR, not STAGING_DIR, but
yes - It should probably depend on !CONFIG_BR2_PTHREAD_DEBUG.

-- 
Bye, Peter Korsgaard
