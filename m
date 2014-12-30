From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:42:17 +0100
Subject: [Buildroot] [PATCH 1/2] libupnp: mark as broken on Nios II,
	infamous _gp issue
In-Reply-To: <1419859373-13766-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Dec 2014 14:22:52 +0100")
References: <1419859373-13766-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d270bt7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.org/results/bc3/bc32c15ba569e700e401ddf97faba584fc16c4cc/

 > The real error is in the config.log:

 > configure:15081: checking for UpnpInit in -lupnp
 > configure:15106: /home/thomas/projets/buildroot/output/host/usr/bin/nios2-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  c
 > onftest.c -lupnp  -lpthread -lrt  >&5
 > /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.8.3/../../../../nios2-linux-gnu/bin/ld: /home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
 > /home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libthreadutil.so.6: error adding symbols: DSO missing from command line
 > collect2: error: ld returned 1 exit status
 > configure:15106: $? = 1
 > [...]
 > configure:15125: error: libupnp not found

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
