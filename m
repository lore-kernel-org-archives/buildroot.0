From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 09:56:41 +0100
Subject: [Buildroot] [PATCH 03/10] libmad: install pkgconfig file
In-Reply-To: <874o94dkhb.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Thu, 20 Jan 2011 09:53:36 +0100")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-4-git-send-email-gustavo@zacarias.com.ar>
	<874o94dkhb.fsf@macbook.be.48ers.dk>
Message-ID: <87zkqwc5rq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Gustavo> +Description: MPEG Audio Decoder
 Gustavo> +Requires:
 Gustavo> +Version: 0.15.1b
 Gustavo> +Libs: -L${libdir} -lmad -lm

 Peter> Do we really need -lm? It's not in mad.pc on my Debian machine, and I
 Peter> don't see any use of math.h in libmad.

From the Debian package changelog:

   * Don't set -lm in the mad.pc file.  libmad doesn't use any math function.

http://packages.debian.org/changelogs/pool/main/libm/libmad/libmad_0.15.1b-5/changelog

Committed without -lm, thanks.

-- 
Bye, Peter Korsgaard
