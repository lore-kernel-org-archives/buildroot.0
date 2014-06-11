From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 15:18:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Add optional
	dependency to libiconv
In-Reply-To: <1402491726-3830-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Wed, 11 Jun 2014 15:02:06 +0200")
References: <1402491726-3830-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y4x3h9eg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > To get reproducable builds depend on libiconv if needed.
 > tvheadend configure either shows

 >   checking for cc libiconv ...                      fail

 > or

 >   checking for cc libiconv ...                      ok

 > depending on the presence of libiconv, and gets linked

 > output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/tvheadend | grep NEEDED | grep iconv
 >  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]

 > Please note that libiconv is not a hard-dependency.

 > Tested with minimal defconfig

 > BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
 > BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 > BR2_PACKAGE_LIBICONV=y
 > BR2_PACKAGE_TVHEADEND=y

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: resend with added note about optional dependency (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
