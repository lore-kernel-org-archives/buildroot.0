From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Dec 2013 11:52:46 +0100
Subject: [Buildroot] [PATCH] libglib2: bump version to 2.38.2
In-Reply-To: <1386585472-2345-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 9 Dec 2013 10:37:52 +0000")
References: <1386585472-2345-1-git-send-email-spdawson@gmail.com>
Message-ID: <87vbyy70u9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > libglib2 can fail to build for arm, with the following error.

 >   gatomic.c:668:2: error: #error G_ATOMIC_LOCK_FREE defined, but incapable of lock-free atomics.

 > The following upstream commit fixes the problem.

 >   commit 996edb0c46356d8a326f886b91a77a6af9a2de3e
 >   Author: Antoine Jacoutot <antoine@mtier.org>
 >   Date:   Wed Aug 28 09:35:27 2013 +0200

 >     fix atomic ops detection

 >     AC_TRY_LINK should be used instead of AC_TRY_COMPILE because the code
 >     will compile everywhere, either producing ``atomic'' code, or an
 >     external reference to __sync_bool_compare_and_swap.

 >     https://bugzilla.gnome.org/show_bug.cgi?id=706958

 > The upstream commit went into version 2.37.7, so this is the lowest version
 > that we can bump to, in order to fix the atomic operations problem. However,
 > 2.37.x is a development version, so we bump to 2.38.2 instead.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
