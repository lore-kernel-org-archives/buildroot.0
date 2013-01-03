From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 00:40:03 +0100
Subject: [Buildroot] [PATCH 2/2] liblinebreak: new package
In-Reply-To: <CAOWBBJxG=-FBHe42_tm6RymLzgCTHy4vA6D5f25jvjJwuAYrmg@mail.gmail.com>
 (Mikhail Boiko's message of "Sun, 23 Dec 2012 23:39:49 +0200")
References: <CAOWBBJxG=-FBHe42_tm6RymLzgCTHy4vA6D5f25jvjJwuAYrmg@mail.gmail.com>
Message-ID: <87ehi1omy4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mikhail" == Mikhail Boiko <mikhailboiko85@gmail.com> writes:

 Mikhail> +++ b/package/liblinebreak/liblinebreak.mk
 Mikhail> @@ -0,0 +1,14 @@
 Mikhail> +#############################################################
 Mikhail> +#
 Mikhail> +# liblinebreak
 Mikhail> +#
 Mikhail> +#############################################################
 Mikhail> +
 Mikhail> +LIBLINEBREAK_VERSION = 2.1
 Mikhail> +LIBLINEBREAK_SOURCE = liblinebreak-$(LIBLINEBREAK_VERSION).tar.gz
 Mikhail> +LIBLINEBREAK_SITE = http://downloads.sourceforge.net/project/vimgadgets/
 Mikhail> liblinebreak/$(LIBLINEBREAK_VERSION)
 Mikhail> +LIBLINEBREAK_INSTALL_STAGING = YES
 Mikhail> +LIBLINEBREAK_CONF_OPT = --disable-docs
 Mikhail> +LIBLINEBREAK_DEPENDENCIES = host-pkgconf

Next to Yanns comments I also wonder if it doesn't need E.G. wchar
support in the toolchain.

You depend on host-pkgconf but nothing else, which seems a bit odd.
pkgconf is normally used to find other dependencies.

Care to resend with these things fixed?

-- 
Bye, Peter Korsgaard
