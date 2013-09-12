From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Sep 2013 00:12:54 +0200
Subject: [Buildroot] [PATCH] nommu/flat: build packages with the correct
	FLAGS
In-Reply-To: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Sep 2013 09:53:44 -0300")
References: <1378904024-14607-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gelpu3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When building for nommu flat targets the CFLAGS/CXXFLAGS/LDFLAGS must be
 Gustavo> adjusted accordingly.
 Gustavo> For gcc this means passing along -Wl,-elf2flt to signal the linker.
 Gustavo> For ld this means -elf2flt.

 Gustavo> Also correct the error in STACKSIZE settings from commit 9edf482d which
 Gustavo> is setting gcc flags as ld flags and will surely fail (no package uses
 Gustavo> it at the moment so it was never seen).

Committed, thanks.

-- 
Bye, Peter Korsgaard
