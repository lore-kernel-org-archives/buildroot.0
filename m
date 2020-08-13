From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 18:44:23 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/nodejs: use system-icu for
 host-nodejs
In-Reply-To: <20200727115155.824789-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 27 Jul 2020 05:51:55 -0600")
References: <20200727115155.824789-1-james.hilliard1@gmail.com>
Message-ID: <878sei7axk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > The nodejs configure.py file orders zlib headers before the bundled ICU
 > headers. The zlib headers happen to be located in the system include
 > directory, next to some system ICU headers (not bundled). If these are
 > built before nodejs is, nodejs will get confused and try to use the
 > system ICU headers instead of the bundled ones.

 > Fix this by always using host-icu.

 > Set CXXFLAGS to -DU_DISABLE_RENAMING=1 when building with
 > system-icu since host-icu is built with --disable-renaming.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
