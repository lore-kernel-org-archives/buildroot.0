From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Jul 2015 17:38:33 +0200
Subject: [Buildroot] [PATCH] tor: fix building if GCC's C standard is
	not gnu99
In-Reply-To: <1435832055-11204-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 2 Jul 2015 13:14:15 +0300")
References: <1435832055-11204-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87twtmy3gm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Up to date tor (at least starting from 0.2.6) requires compiler with C99
 > plus some extensions support.

 > If default GCC's C standard < c99 (that's the case@least for ARC)
 > you'll see this on attempt to build tor:
 -----------------------> 8--------------------
 > src/common/address.c: In function ''tor_addr_parse_PTR_name':
 > src/common/address.c:502:5: error: 'for' loop initial declarations are only allowed in C99 mode
 >      for (int i = 0; i < 16; ++i) {
 >      ^
 > src/common/address.c:502:5: note: use option -std=c99 or -std=gnu99 to compile your code
 -----------------------> 8--------------------

 > Once you follow compiler advice and enable c99 support with "-std=c99"
 > you'll pass that failure but will see tons of other errors, see
 > https://www.mail-archive.com/tor-dev at lists.torproject.org/msg06273.html

 > And only g99 resolves all problems at once.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
