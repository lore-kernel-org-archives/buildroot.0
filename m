From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 20 Mar 2015 00:42:04 +0300
Subject: [Buildroot] [PATCH v1] postgresql: fix xtensa pthread linking
	flags
In-Reply-To: <1426800588-28574-1-git-send-email-ps.report@gmx.net>
References: <1426800588-28574-1-git-send-email-ps.report@gmx.net>
Message-ID: <CAMo8BfJAA22Z-pHfKRPh6Xuqst4WekCvDPEGhcsocT8YEmBnVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 12:29 AM, Peter Seiderer <ps.report@gmx.net> wrote:
> Caused by pthread flags autodetection failure while configure (from config.log):
> configure:12436: checking whether pthreads work with -pthread
> configure:12521: host/usr/bin/xtensa-linux-gcc -o conftest -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mtext-section-literals  -Os   -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE    conftest.c   -lssl -lcrypto -lz -lrt -lcrypt -ldl -lm  >&5
> conftest.c: In function 'main':
> conftest.c:140:27: warning: 'th' is used uninitialized in this function [-Wuninitialized]
>  pthread_t th; pthread_join(th, 0);
>                            ^
> host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.so: warning: gethostbyname is obsolescent, use getnameinfo() instead.
> configure:12521: $? = 0

But the test has actually succeeded according to the exit code.
Maybe we'd better fix configure?

> configure:12556: result: no

-- 
Thanks.
-- Max
