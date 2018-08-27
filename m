From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 17:31:35 +0200
Subject: [Buildroot] [PATCH 1/1] php: fix build with mysqli
In-Reply-To: <20180827132127.20658-1-chrismcc@gmail.com> (Christopher
 McCrory's message of "Mon, 27 Aug 2018 06:21:27 -0700")
References: <20180827132127.20658-1-chrismcc@gmail.com>
Message-ID: <87bm9n967c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:

 > This fixes autobuild failures like
 > http://autobuild.buildroot.net/results/3288b742cee650ee47a41c5b4d6aaef1fe67bff1

 > php compile breaks with:

 > ext/mysqlnd/mysqlnd_auth.o: In function `php_mysqlnd_scramble_sha2':
 > mysqlnd_auth.c:(.text+0x1054): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x1064): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x1070): undefined reference to `PHP_SHA256Final'
 > mysqlnd_auth.c:(.text+0x1078): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x1088): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x1094): undefined reference to `PHP_SHA256Final'
 > mysqlnd_auth.c:(.text+0x109c): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x10ac): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x10bc): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x10c8): undefined reference to `PHP_SHA256Final'

 > It looks like the php mysqli extension needs the hash extension to work.  This
 > seems to be a php Make dependany bug.  This patch works around it until the
 > upstream maintainers can fix it.

 > --
 > I'm OK with modifing the above at commit time.

 > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

The Signed-off-by line should go above the --  (like git commit -s
automatically does) so it isn't dropped by git when the patch is
applied.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
