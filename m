From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:11:50 +0200
Subject: [Buildroot] [PATCH] gdb: actually disable gdbserver if
 BR2_PACKAGE_GDB_SERVER is unset
In-Reply-To: <20180515133442.16607-1-anssi.hannula@bitwise.fi> (Anssi
 Hannula's message of "Tue, 15 May 2018 16:34:42 +0300")
References: <20180515133442.16607-1-anssi.hannula@bitwise.fi>
Message-ID: <87muw1auzt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anssi" == Anssi Hannula <anssi.hannula@bitwise.fi> writes:

 > The gdb configure script is given --enable-gdbserver when
 > BR2_PACKAGE_GDB_SERVER is set, but it is not given --disable-gdbserver
 > when BR2_PACKAGE_GDB_SERVER is unset.

 > gdb gdb/configure.ac defaults to enabling gdbserver in "native"
 > (host=target) cases, which is always the case when buildroot builds a
 > gdb which runs on the target hardware. The gdbserver will overwrite
 > BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY gdbserver, if any.

 > Fix that by passing --disable-gdbserver when BR2_PACKAGE_GDB_SERVER is
 > unset.

 > Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
