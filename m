From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 20:50:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/heimdal: security bump to
	version 7.4.0
In-Reply-To: <20170722100736.25753-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 22 Jul 2017 12:07:36 +0200")
References: <20170722100736.25753-1-bernd.kuhls@t-online.de>
Message-ID: <87379n0yy7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes security bugs CVE-2017-11103 & CVE-2017-6594
 > Changed upstream tarball location as noted in the release notes:
 > http://www.h5l.org/releases.html?show=7.4.0

 > --with-db-type-preference= is needed to fix a build error:

 >   CCLD     otp
 > ../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_get_internal':
 > otp_db.c:(.text+0x32): undefined reference to `__roken_dbm_fetch'
 > otp_db.c:(.text+0xd9): undefined reference to `__roken_dbm_store'
 > ../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_db_open':
 > otp_db.c:(.text+0x1c9): undefined reference to `__roken_dbm_open'
 > ../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_db_close':
 > otp_db.c:(.text+0x205): undefined reference to `__roken_dbm_close'
 > ../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_delete':
 > otp_db.c:(.text+0x23e): undefined reference to `__roken_dbm_delete'
 > ../../lib/otp/.libs/libotp.a(otp_db.o): In function `otp_put':
 > otp_db.c:(.text+0x388): undefined reference to `__roken_dbm_store'
 > collect2: error: ld returned 1 exit status

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

As heimdal is only a host package the security risk is quite minimal,
but ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
