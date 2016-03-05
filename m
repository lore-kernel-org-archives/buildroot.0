From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:13:47 +0100
Subject: [Buildroot] [PATCH v3] libpjsip: new package
In-Reply-To: <1457134363-26450-1-git-send-email-luca@lucaceresoli.net>
References: <1457134363-26450-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160305151347.46da2e3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat,  5 Mar 2016 00:32:43 +0100, Luca Ceresoli wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied to master. However, it is worth mentioning that it fails
to build on musl, and this should be fixed. The build failure is:

../src/pj/os_core_unix.c: In function ?init_mutex?:
../src/pj/os_core_unix.c:1128:40: error: ?PTHREAD_MUTEX_FAST_NP? undeclared (first use in this function)
  rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_FAST_NP);
                                        ^
../src/pj/os_core_unix.c:1128:40: note: each undeclared identifier is reported only once for each function it appears in
../src/pj/os_core_unix.c:1138:40: error: ?PTHREAD_MUTEX_RECURSIVE_NP? undeclared (first use in this function)
  rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
                                        ^

There is a patch in Alpine Linux
(http://git.alpinelinux.org/cgit/aports/plain/main/pjproject/musl-fixes.patch),
but I'm not sure it doesn't break the build with other C libraries, it
lacks a commit log, and should be submitted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
