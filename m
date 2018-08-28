From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 10:13:27 +0200
Subject: [Buildroot] [PATCH 1/1] php: fix build with mysqli
In-Reply-To: <20180827132127.20658-1-chrismcc@gmail.com> (Christopher
 McCrory's message of "Mon, 27 Aug 2018 06:21:27 -0700")
References: <20180827132127.20658-1-chrismcc@gmail.com>
Message-ID: <87h8je7vtk.fsf@dell.be.48ers.dk>
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

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
