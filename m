From: =?big5?B?qkyr2KZ3?= <colin@realtek.com.tw>
Date: Mon, 14 Sep 2009 15:07:56 +0800
Subject: [Buildroot] mklibs.py has problem on gdbserver
Message-ID: <F2F08A63C41443DE8CED853D0B47BB57@realtek.com.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi there,
I am trying to shrink the libraries by using mklibs.py, which is from
buildroot/toolchain/mklibs.
It can work on almost all of the dynamic-linked APs in addition to
gdbserver.
The platform is of MIPSEL. I tried to see if the x86 executable file of
gdbserver has the same problem, and the answer is yes.
Anybody know what the problem is?

The gdbserver is from GNU gdb-6.8.
The log is as following:
     ../bin/mklibs.py -v    -d trimlib /tmp/gdbserver
    I: Using ld-linux.so.2 as dynamic linker.
    I: library reduction pass 1
    Objects: gdbserver
    Object: /tmp/gdbserver
    84 symbols, 84 unresolved
    reducing libthread_db.so.1
    No pic file found for /lib//libthread_db.so.1 ; copying
    reducing libc.so.6
    No pic file found for /lib//libc.so.6 ; copying
    I: library reduction pass 2
    Objects: gdbserver
    Object: trimlib/libthread_db.so.1-so-stripped
    Object: /tmp/gdbserver
    Object: trimlib/libc.so.6-so-stripped
    104 symbols, 10 unresolved
    ../bin/mklibs.py:496: DeprecationWarning: raising a string exception is
deprecated
      raise "No library provides non-weak " + symbol
    Traceback (most recent call last):
      File "../bin/mklibs.py", line 496, in <module>
        raise "No library provides non-weak " + symbol
    No library provides non-weak ps_pdread

Regards,
Colin
