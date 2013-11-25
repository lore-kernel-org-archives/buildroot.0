From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Nov 2013 10:17:13 +0100
Subject: [Buildroot] [PATCH v2 2/2] libglib2: the system PCRE needs to
	have UTF and UCP enabled
In-Reply-To: <1385365774.2810.1.camel@sven> (Sven Neumann's message of "Mon,
 25 Nov 2013 08:49:34 +0100")
References: <1385157507.14731.31.camel@bender>
 <87eh68nk15.fsf@dell.be.48ers.dk> <1385365774.2810.1.camel@sven>
Message-ID: <87y54clu1y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > Hello,
 > On Fr, 2013-11-22 at 23:33 +0100, Peter Korsgaard wrote:
 >> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
 >> 
 >> > If glib2 is compiled with the system PCRE instead of the included
 >> > copy, then that system PCRE needs to have support for UTF-8 and
 >> > Unicode properties enabled. Otherwise you will get such warnings
 >> > at run-time:
 >> 
 >> > GLib-CRITICAL **: PCRE library is compiled without UTF8 support
 >> > GLib-CRITICAL **: PCRE library is compiled without UTF8 properties support
 >> 
 >> > Signed-off-by: Sven Neumann <neumann@teufel.de>
 >> 
 >> Committed to next, thanks.

 > May I suggest that you also merge this to the stable tree. Otherwise
 > glib2 will be unusable on any system that also has pcre selected (which
 > is for example pulled in by gnutls).

Hmm, ok - That wasn't completely clear to me. So even though it's just a
warning, this is something critical?

When was this introduced? By the 2.36.1 -> 2.36.3 bump or is 2013.08
also affected?

For the future, it is nice if patches that should go to the current
release are clearly marked as such.

-- 
Bye, Peter Korsgaard
