From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 21:32:44 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: fix static build with libatomic
In-Reply-To: <20180913182419.5720-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 13 Sep 2018 20:24:19 +0200")
References: <20180913182419.5720-1-fontaine.fabrice@gmail.com>
Message-ID: <877ej131k3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Second patch added support to link with -latomic if needed however using
 > LDFLAGS doesn't work when statically linking because LDFLAGS is added
 > before LIBS

 > Detection of atomic fails with:

 > configure:23230: /accts/mlweber1/instance-2/output/host/bin/sparc-linux-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static -pedantic -Werror -Wall -D_GNU_SOURCE -D_REENTRANT -D_THREAD_SAFE -Wno-long-long -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -latomic conftest.cpp -lrt -lpthread -lstdc++ >&5
 > /tmp/ccgrvVTg.o: In function `main':
 > conftest.cpp:(.text.startup+0x10): undefined reference to `__atomic_fetch_add_4'
 > collect2: error: ld returned 1 exit status

 > So use LIBS instead of LDFLAGS

 > As second patch was already merged upstream, a new PR was sent:
 > https://github.com/zeromq/libzmq/pull/3250

 > Fixes:
 >  - http://autobuild.buildroot.net/results/c471d6b1061a8516f7772735e471db68a32965aa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
