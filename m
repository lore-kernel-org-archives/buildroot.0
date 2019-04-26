From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:46:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/lynx: fix build with latomic
In-Reply-To: <20190422104821.16807-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Apr 2019 12:48:21 +0200")
References: <20190422104821.16807-1-fontaine.fabrice@gmail.com>
Message-ID: <87o94tylwv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Help lynx finding openssl dependencies by giving it a path in --with-ssl
 > and using pkg-config to directly pass the correct libraries in LIBS.

 > This will disable the call to pkg-config and CF_ADD_LIBS which has the
 > sad behavior of removing duplicates ...
 > As a result, build fails because, the following correct dependencies:

 > configure:14170: testing adding
 > -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib
 > -lssl
 > -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib
 > -lz -pthread -latomic -lcrypto -lz -pthread -latomic to LIBS ...

 > is replaced by:

 > -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib
 > -lssl -lz -pthread -latomic -lcrypto

 > As a result, static linking fails on crypto because the second -latomic
 > has been removed ...

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2c28426253014d93e86e3ba6ed578e84317a9f19

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
