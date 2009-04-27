From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 12:11:47 +0200
Subject: [Buildroot] svn commit: [26202] trunk/buildroot/toolchain/uClibc
In-Reply-To: <1240820767.6699.2.camel@sven> (Sven Neumann's message of "Mon\,
	27 Apr 2009 10\:26\:07 +0200")
References: <20090424184219.14D7077148@busybox.osuosl.org>
	<1240820767.6699.2.camel@sven>
Message-ID: <87hc0ah0d8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Hi,
 Sven> On Fri, 2009-04-24 at 18:42 +0000, jacmet at uclibc.org wrote:
 >> Author: jacmet
 >> Date: 2009-04-24 18:42:18 +0000 (Fri, 24 Apr 2009)
 >> New Revision: 26202
 >> 
 >> Log:
 >> toolchain/uClibc: 0.9.30.1 getaddrinfo fix for intfs without address

 Sven> Does this fix the issues that are the reason for
 Sven> UCLIBC_SUPPORT_AI_ADDRCONFIG not being enabled by default or is this
 Sven> unrelated? Otherwise perhaps the default could be changed now, which
 Sven> would us allow to get the gupnp stack into buildroot (see
 Sven> https://bugs.busybox.net/show_bug.cgi?id=35).

I don't think so. This fixes a runtime crash with interfaces without a
configured address, and the SUPPORT_AI_ADDRCONFIG thing was a build
time breakage.

But I'll give it a test.

-- 
Bye, Peter Korsgaard
