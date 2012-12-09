From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:02:10 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
 (Carsten Schoenert's message of "Mon, 3 Dec 2012 20:47:45 +0100")
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
Message-ID: <87r4mzxad9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@t-online.de>
 Carsten> Updating current crosstool-ng config files to 1.17.0
 Carsten>  crosstool-ng.config-eglibc
 Carsten>  crosstool-ng.config-glibc
 Carsten>  crosstool-ng.config-uClibc

Unfortunately it doesn't seem to build here (ppl compilation issue):

[ERROR]    /home/peko/source/buildroot/testctng/build/build-toolchain/.build/src/ppl-0.10.2/src/Interval.defs.hh:451:86: error: 'f_info' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
[ALL  ]    In file included from /home/peko/source/buildroot/testctng/build/build-toolchain/.build/src/ppl-0.10.2/src/Interval.defs.hh:980:0

Yann, Carsten - Any ideas? Googling around seems to suggest that this is
related to a host-gcc 4.7.x issue, but people are quite likely to be
using that nowadays, so what to do? Build with -fpermissive?

-- 
Bye, Peter Korsgaard
