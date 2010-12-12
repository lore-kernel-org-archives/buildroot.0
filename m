From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 12:31:50 +0100
Subject: [Buildroot] [PATCH 07/15] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <87bp4slyo4.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87bp4slyo4.fsf@macbook.be.48ers.dk>
Message-ID: <20101212123150.77a2569e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 23:42:03 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Does it really not work on uClibc? This is afaik the first package we
> have that is glibc only.

ltp-testsuite uses sigset(), which is obsolete. uClibc can implement
it, but not with our default configuration. I thought ltp-testsuite was
not of sufficiently general usage to decide to make the change of our
default uClibc configuration. The option is
UCLIBC_HAS_OBSOLETE_BSD_SIGNAL.

BTW, I have the same problem with the mrouted package, which needs
UCLIBC_SUPPORT_AI_ADDRCONFIG enabled in uClibc to compile. For this
package, I just added a comment in the Config.in help text mentionning
this. Should I do the same with ltp-testsuite ?

I'm not sure how to handle those types of packages, that can work with
uClibc, but not with our default uClibc configuration, and who are
probably not of enough general use to require a change of our default
uClibc configuration.

Thoughts ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
