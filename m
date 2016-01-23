From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:27:53 +0100
Subject: [Buildroot] [PATCH] pptp-linux: add musl build fix patch
References: <1453469017-11700-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <psedncx9k5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 22 Jan 2016 10:23:37 -0300 schrieb Gustavo Zacarias:

> +diff --git a/pqueue.h b/pqueue.h +index a56590f..8c60c62 100644 +---
> a/pqueue.h ++++ b/pqueue.h +@@ -3,6 +3,7 @@
> +
> + #include <time.h>
> + #include <sys/time.h>
> ++#include <sys/types.h>
> +
> + /* wait this many seconds for missing packets before forgetting about
> them */
> + #define DEFAULT_PACKET_TIMEOUT 0.3 +--
> +2.4.10 +

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested only using http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-musl-2015.11-rc1-71-g90d1299.tar.bz2)

Regards, Bernd
