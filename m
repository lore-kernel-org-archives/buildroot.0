From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Aug 2010 20:05:44 +0200
Subject: [Buildroot] libssp missing from target
In-Reply-To: <i5ja47$il4$1@dough.gmane.org>
References: <i5j4vi$oj9$1@dough.gmane.org>
	<i5ja47$il4$1@dough.gmane.org>
Message-ID: <20100831200544.47337e47@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Aug 2010 16:20:23 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I just enabled building of gdbserver for the target, and now it's
> missing a libarary on the target as well (libthread_db).
> 
> How do I tell buildroot to copy to output/target the libraires
> required by the binaries in output/target/usr/bin?

Assuming you're using an external toolchain, libthread_db should
already be added to the target by the following snippet in
toolchain/toolchain-external/ext-tool.mk :

ifneq ($(BR2_PTHREADS_NONE),y)
LIB_EXTERNAL_LIBS+=libpthread.so
ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
LIB_EXTERNAL_LIBS+=libthread_db.so
endif # gdbserver
endif # ! no threads

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
