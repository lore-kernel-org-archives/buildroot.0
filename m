From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 May 2017 21:28:27 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump to version
	10.1.23
In-Reply-To: <20170508153716.16809-1-bluemrp9@gmail.com> (Ryan Coe's message
 of "Mon, 8 May 2017 08:37:16 -0700")
References: <20170508153716.16809-1-bluemrp9@gmail.com>
Message-ID: <87efvzno6c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Fixes:
 > CVE-2017-3302 - Crash in libmysqlclient.so in Oracle MySQL before 5.6.21 and
 > 5.7.x before 5.7.5 and MariaDB through 5.5.54, 10.0.x through 10.0.29,
 > 10.1.x through 10.1.21, and 10.2.x through 10.2.3.

[snip]

 > -MARIADB_VERSION = 10.1.22
 > +MARIADB_VERSION = 10.1.23
 >  MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 >  MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL
 > client library), LGPL-2.0 (LGPL client library)
 >  MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER

Thanks, I (obviously) want to apply this, but something odd is going on
with the licensing. COPYING.LESSER has been removed by this commit:

https://github.com/MariaDB/server/commit/577915def8

But the client library IS listed as being LGPL:

https://mariadb.com/kb/en/mariadb/mariadb-connector-c/

And same for the "old" one:

https://mariadb.com/kb/en/mariadb/lgpl-mysql-client-library-32358/

Grepping around in the 10.1.23 tarball, I don't see a lot of references
to Lesser og LGPL.

Now, I know next to nothing about mariadb. Do you have any idea what is
going on here?

-- 
Bye, Peter Korsgaard
