From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 17:23:28 +0200
Subject: [Buildroot] [PATCH 1/1] tinydtls: fix issue on u_intXX_t being
	undefined
In-Reply-To: <1472421431-1103-1-git-send-email-fabrice.fontaine@orange.com>
 (Fabrice Fontaine's message of "Sun, 28 Aug 2016 23:57:11 +0200")
References: <1472421431-1103-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <87k2ez61lb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/928be69f90476e6b04be3a1afd3b74112bcac0a0

 > As define in sha2/README, by default, tinydtls uses u_intXX_t data types
 > for 8 bit, 32 bit, and 64 bit unsigned integer type definitions.
 > To use uintXX_t data types as defined by recent ANSI C standards and as
 > included in the inttypes.h header file, SHA2_USE_INTTYPES_H has to be
 > define at compile time.

 > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Reworded slightly to mention that this is a fix for building against
musl and committed, thanks.

-- 
Bye, Peter Korsgaard
