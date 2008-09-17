From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 23:35:58 +0200
Subject: [Buildroot] Lighttpd and PCRE
In-Reply-To: <48D0CDD3.4070604@netcentral.co.uk> (Nick Peirson's message of
	"Wed\, 17 Sep 2008 10\:28\:51 +0100")
References: <48D0CDD3.4070604@netcentral.co.uk>
Message-ID: <87ljxqsbep.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nick" == Nick Peirson <nick@netcentral.co.uk> writes:

 Nick> Hi,

 Nick> I'm fairly new to buildroot and cross compiling in general and
 Nick> I've encountered some problems getting PCRE support enabled in
 Nick> lighttpd.

 Nick> Initially PCRE was failing to compile complaining of an unknown
 Nick> option -N, which I tracked down to the the line in the PCRE
 Nick> Makefile:

 Nick> STRIP = true -Not_stripping

Hmm, do you have BR2_STRIP_none set?

 Nick> Commenting this out allow PCRE to compile, however lighttpd
 Nick> failed to compile with an error regarding libc.so.6 conflicting
 Nick> with with libc.so.0. A quick find through my buildroot
 Nick> environment showed no instances of libc.so.6, however it was
 Nick> present on my host system. In an attempt to fix it I changed
 Nick> the line:

Yeah, that's caused by pcre-config returning /usr/lib instead of
$(STAGING_DIR)/usr/lib - I've fixed that now.

With those fixes pcre/lighttpd builds for me (arm9) - Does it still
not work for you?

-- 
Bye, Peter Korsgaard
