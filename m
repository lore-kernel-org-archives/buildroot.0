From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 19:57:51 +0100
Subject: [Buildroot] [PATCH v2] libinput: drop C++ dependency
In-Reply-To: <20190112094153.9168-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 12 Jan 2019 10:41:53 +0100")
References: <20190112094153.9168-1-ps.report@gmx.net>
Message-ID: <871s5dsq8g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The meson C++ dependency is only used for a build-time header
 > inclusion test, add patch dropping hard meson C++ dependency
 > and build the header inclusion test only in case C++ compiler
 > is available.

 > Fixes [1]:

 >   The Meson build system
 >   Version: 0.49.0
 >   Source dir: .../build/libinput-1.12.5
 >   Build dir: .../build/libinput-1.12.5/build
 >   Build type: cross build
 >   Project name: libinput
 >   Project version: 1.12.5
 >   Native C compiler: cc (gcc 4.8.4 "cc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4")
 >   Cross C compiler: .../host/bin/riscv64-buildroot-linux-gnu-gcc (gcc 7.4.0)

 >   meson.build:1:0: ERROR:  Unknown compiler(s): [['.../host/bin/riscv64-buildroot-linux-gnu-g++']]
 >   The follow exceptions were encountered:
 >   Running ".../host/bin/riscv64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '.../host/bin/riscv64-buildroot-linux-gnu-g++': '.../host/bin/riscv64-buildroot-linux-gnu-g++'"

 > [1] http://autobuild.buildroot.net/results/bf4d3d360f635c3524a52b84a72d558770596ed0

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - change patch to disable c++ header inclusion teste only in case
 >     no c++ compiler is available (suggested by Yann E. MORIN)

Committed, thanks.

-- 
Bye, Peter Korsgaard
