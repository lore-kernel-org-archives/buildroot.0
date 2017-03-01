From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:09:27 +0100
Subject: [Buildroot] [PATCH v7] gtest/gmock: bump to version 1.8.0
In-Reply-To: <802529421.12331306.1488198710194.JavaMail.zimbra@datacom.ind.br>
References: <1487070316-12583-1-git-send-email-casantos@datacom.ind.br>
 <1487784452-7424-1-git-send-email-casantos@datacom.ind.br>
 <20170226150525.359a21cf@free-electrons.com>
 <802529421.12331306.1488198710194.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170301230927.11de82b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 09:31:50 -0300 (BRT), Carlos Santos wrote:

> Because it does not work (try http://patchwork.ozlabs.org/patch/727786/).

Could you define "does not work" ? Indeed, I applied this version of
your patch (v6), and built it with the following configurations:

BR2_PACKAGE_GTEST=y
# BR2_PACKAGE_GTEST_GMOCK is not set

and:

BR2_PACKAGE_GTEST=y
BR2_PACKAGE_GTEST_GMOCK=y

and both built successfully.

The first one only installed gtest:

>>> gtest release-1.8.0 Installing to staging directory
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5  DESTDIR=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot install/fast -C /home/thomas/projets/buildroot/output/build/gtest-release-1.8.0/
Install the project...
-- Install configuration: "Release"
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgtest.a
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgtest_main.a
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-param-test.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-test-part.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-typed-test.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-message.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-death-test.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-linked_ptr.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-type-util.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-port-arch.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-type-util.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-tuple.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-internal.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util-generated.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-port.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-string.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util-generated.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-filepath.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-tuple.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest-port.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest-printers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest_pred_impl.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-spi.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-printers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest_prod.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-param-test.h.pump
/usr/bin/install -D -m 0644 package/gtest/gtest.pc /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/gtest.pc
# Generate the gtest-config script manually, since the CMake
# build system is not doing it.
sed 's%@PACKAGE_TARNAME@%gtest%; s%@PACKAGE_VERSION@%release-1.8.0%; s%@prefix@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr%; s%@exec_prefix@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr%; s%@libdir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib%; s%@includedir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include%; s%@bindir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin%; s%@PTHREAD_CFLAGS@%%; s%@PTHREAD_LIBS@%-lpthread%;' /home/thomas/projets/buildroot/output/build/gtest-release-1.8.0/googletest/scripts/gtest-config.in > /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/gtest-config
chmod +x /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/gtest-config

While the second one installed both gtest and gmock:

>>> gtest release-1.8.0 Installing to staging directory
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/projets/buildroot/output/host/usr/bin:/home/thomas/projets/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5  DESTDIR=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot install/fast -C /home/thomas/projets/buildroot/output/build/gtest-release-1.8.0/
Install the project...
-- Install configuration: "Release"
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgmock.a
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgmock_main.a
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-nice-strict.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-cardinalities.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-more-matchers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-nice-strict.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-actions.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-matchers.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-actions.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-more-actions.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/gmock-port.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/gmock-internal-utils.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/gmock-generated-internal-utils.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/gmock-generated-internal-utils.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/custom
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/custom/gmock-port.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/custom/gmock-generated-actions.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-matchers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-spec-builders.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-actions.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-function-mockers.h.pump
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-matchers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gmock/gmock-generated-function-mockers.h
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgtest.a
-- Installing: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgtest_main.a
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-param-test.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-test-part.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-typed-test.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-message.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-death-test.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-linked_ptr.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-type-util.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-port-arch.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-type-util.h.pump
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-tuple.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-internal.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util-generated.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-port.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-string.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-param-util-generated.h.pump
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-death-test-internal.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-filepath.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/gtest-tuple.h.pump
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest-port.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/internal/custom/gtest-printers.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest_pred_impl.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-spi.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-printers.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest_prod.h
-- Up-to-date: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gtest/gtest-param-test.h.pump
/usr/bin/install -D -m 0644 package/gtest/gtest.pc /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/gtest.pc
# Generate the gtest-config script manually, since the CMake
# build system is not doing it.
sed 's%@PACKAGE_TARNAME@%gtest%; s%@PACKAGE_VERSION@%release-1.8.0%; s%@prefix@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr%; s%@exec_prefix@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr%; s%@libdir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib%; s%@includedir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include%; s%@bindir@%/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin%; s%@PTHREAD_CFLAGS@%%; s%@PTHREAD_LIBS@%-lpthread%;' /home/thomas/projets/buildroot/output/build/gtest-release-1.8.0/googletest/scripts/gtest-config.in > /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/gtest-config
chmod +x /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/gtest-config
/usr/bin/install -D -m 0644 package/gtest/gmock.pc /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/gmock.pc

What am I missing here ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
