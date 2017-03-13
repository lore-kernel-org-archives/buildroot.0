From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: add optional support
	for libintl
In-Reply-To: <20170312140605.28511-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 12 Mar 2017 15:06:05 +0100")
References: <20170312140605.28511-1-bernd.kuhls@t-online.de>
Message-ID: <87d1dkwyi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Python links to gettext when available:
 > $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
 > output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
 >  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 >  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > In comparison the same library compiled without gettext:

 > $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
 > output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
 >  0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/python/python.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
