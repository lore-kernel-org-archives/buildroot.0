From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:30:28 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/exim: fix target build on
 some toolchains
In-Reply-To: <20200210214840.15023-2-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Mon, 10 Feb 2020 22:48:38 +0100")
References: <20200210214840.15023-1-luca@lucaceresoli.net>
 <20200210214840.15023-2-luca@lucaceresoli.net>
Message-ID: <87lfp8iwor.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Building with the Sourcery CodeBench ARM 2014.05 the build fails with this
 > error:

 >>>> exim_dbmbuild utility built

 >   .../buildroot/output/host/bin/arm-none-linux-gnueabi-gcc -DEXIM_DUMPDB exim_dbutil.c
 >   exim_dbutil.c: In function 'main':
 >   exim_dbutil.c:568:1: error: 'for' loop initial declarations are only allowed in C99 mode
 >    for (uschar * key = dbfn_scan(dbm, TRUE, &cursor);
 >    ^
 >   exim_dbutil.c:568:1: note: use option -std=c99 or -std=gnu99 to compile your code
 >   exim_dbutil.c:630:2: error: 'for' loop initial declarations are only allowed in C99 mode
 >     for (int i = 1; i <= wait->count; i++)
 >     ^
 >   exim_dbutil.c:642:6: error: 'for' loop initial declarations are only allowed in C99 mode
 >         for (int j = 0; j < MESSAGE_ID_LENGTH; j++)
 >         ^

 > Fix by enforcing C99. This completes commit
 > 2c692e81a844b30b4d3161dfd9897b3265bb9279 ("package/exim: fix host build")
 > to also fix target builds.

 > Fixes: http://autobuild.buildroot.net/results/6b7e08090f5f0f2627cc3e89b349c2052b6e3116/

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

 > ---

 > Changes since v1: none.

Committed, thanks.

-- 
Bye, Peter Korsgaard
