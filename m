From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Feb 2012 21:29:14 +0100
Subject: [Buildroot] [git commit branch/next] qt: bump version
In-Reply-To: <20120226095808.775a2b05@gmail.com> (Ismael Luceno's message of
 "Sun, 26 Feb 2012 09:58:08 -0200")
References: <20120225222047.C951590B6D@busybox.osuosl.org>
 <20120226095808.775a2b05@gmail.com>
Message-ID: <877gz9z6cl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ismael" == Ismael Luceno <ismael.luceno@gmail.com> writes:

 Ismael> Hi.
 Ismael> I've been working on QT4.8, and I found that it fails to compile
 Ismael> with GCC 4.6.2 on ARM, due to -fstrict-volatile-bitfields becoming
 Ismael> default [0].

 Ismael> Also, I'm wondering if it should override or append to QMAKE_CFLAGS
 Ismael> and QMAKE_CXXFLAGS...

 Ismael> [0] <http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02245.html>

I think we can just add -fno-strict-volatile-bitfields to QT_CXXFLAGS
for arm/armeb and gcc 4.6.x.

-- 
Bye, Peter Korsgaard
