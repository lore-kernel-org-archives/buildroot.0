From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Fri, 7 Sep 2012 09:38:16 +0100
Subject: [Buildroot] libthread_db.so and external toolchain
Message-ID: <CAJkQPOnM__r+8SZw-qYEQ=Qn86E=umvLAf4cVetppeL7pnLqkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need libthread_db.so on my target

I saw this previous comment from Thomas:
http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/24671

Since then ext-tool.mk has changed to:

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIB_EXTERNAL_LIBS+=libpthread.so
ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
LIB_EXTERNAL_LIBS+=libthread_db.so
endif # gdbserver
endif # ! no threads

BR2_TOOLCHAIN_HAS_THREADS can be selected by
(BR2_TOOLCHAIN_EXTERNAL_GLIBC && BR2_TOOLCHAIN_EXTERNAL )

but BR2_PACKAGE_GDB_SERVER depends on !BR2_TOOLCHAIN_EXTERNAL

Which means that selecting an external toolchain stops the automatic
copy over of the libthread_db.so library.

Is this because I am expected to include the library in the "external
libs" option?

e.g. BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS="libthread_db.so"

Aras
