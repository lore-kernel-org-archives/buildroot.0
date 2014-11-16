From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Nov 2014 23:03:56 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
In-Reply-To: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Nov 2014 17:34:27 +0100")
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877fyuerar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > clamav wants to use backtrace, and decides whether it can use it if it
 > detects a glibc >= 2.1.

 > But uClibc does impersonate a glibc >= 2.1, so clamav concludes it is
 > possible to use backtrace. So it includes execinfo.h, which is missing
 > in our default uClibc config file.

 > So, just extend the test so that backtrace support is disable on uClibc,
 > unless it has been configured with backtrace support.

 > A far better solution would be to add a ./configure check for backtrace,
 > but this patch is sufficient enough.

 > Fixes:
 >     http://autobuild.buildroot.net/results/cff/cffa32fcedda735983d4805d6d4fa77844539b10/
 >     http://autobuild.buildroot.net/results/e0a/e0a765a94a538b0b936ea512f7aba0264fac6309/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
