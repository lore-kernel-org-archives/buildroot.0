From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:51:17 +0200
Subject: [Buildroot] [PATCH] package/python3: adjust
 _REMOVE_USELESS_FILES fix for new layout
In-Reply-To: <20190802174359.10033-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Aug 2019 19:43:59 +0200")
References: <20190802174359.10033-1-peter@korsgaard.com>
Message-ID: <87a7bphix6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > python3 nowadays appends the triplet to the config-<version>m directory:
 > echo target/usr/lib/python3.7/config-*
 > target/usr/lib/python3.7/config-3.7m-powerpc-linux-gnu

 > Likewise, there is no longer a pyconfig.h:

 > ls target/usr/lib/python3.7/config-3.7m-powerpc-linux-gnu
 > config.c  config.c.in  install-sh  libpython3.7m.a  Makefile
 > makesetup  python-config.py  python.o  Setup  Setup.local

 > So adjust the removal logic to match.  Use a wildcard rather than
 > $GNU_TARGET_NAME as buildroot and python3's idea of the triplet doesn't
 > always match (E.G.  for musl/uclibc).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
