From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 08:08:37 +0100
Subject: [Buildroot] [PATCH 2020.02.x] package/fakeroot: add upstream
 patches to fix glibc 2.33 compatibility
In-Reply-To: <20210215185541.111347-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 15 Feb 2021 19:55:41 +0100")
References: <20210215185541.111347-1-joerg.krause@embedded.rocks>
Message-ID: <87ft1v5fyi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Glibc 2.33 removed `_STAT_VER`. On host systems, which updated to glibc
 > 2.33, building host-fakeroot breaks:

 > ```
 > In file included from communicate.h:20,
 >              from libfakeroot.c:60:
 > libfakeroot.c: In function ?chown?:
 > libfakeroot.c:99:40: error: ?_STAT_VER? undeclared (first use in this function)
 > 99 | #define INT_NEXT_STAT(a,b) NEXT_STAT64(_STAT_VER,a,b)
 > ```

 > The issue has been discussed on some system package threads, e.g.:
 > https://bugs.archlinux.org/task/69572
 > https://bugzilla.redhat.com/show_bug.cgi?id=1889862#c13

 > A patch set was prepared by Ilya Lipnitskiy which included two other
 > patches not related to the glibc 2.33 compatibility and prepared as
 > merge request for upstream:
 > https://www.mail-archive.com/openwrt-devel at lists.openwrt.org/msg57280.html

 > Upstream accepted the merge request:
 > https://salsa.debian.org/clint/fakeroot/-/merge_requests/10

 > Note, that this patch series only contains the necessay patches for glibc
 > 2.33 compatibility.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2020.02.x, thanks.

For 2020.11.x I have backported the commit from master instead.

-- 
Bye, Peter Korsgaard
