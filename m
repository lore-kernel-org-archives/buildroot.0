From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 Jan 2013 23:17:39 +0100
Subject: [Buildroot] [PATCH 21/33] rrdtool: add python binding support
In-Reply-To: <871udmkt2j.fsf@dell.be.48ers.dk>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-22-git-send-email-s.martin49@gmail.com>
 <871udmkt2j.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMLC7SKsLzxudq+1injbkV9-=pi33ZNpdVBVzcMFisfGyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2013/1/15 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> I was about to commit this, but it doesn't work here. I'm doing an ARM
> build but get:
>
> building 'rrdtoolmodule' extension
> creating build
> creating build/temp.linux-x86_64-2.7
> /usr/bin/gcc -pthread -fno-strict-aliasing -O2 -I/home/peko/source/buildroot/testrrd/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC -I../../src -I/home/peko/source/buildroot/testrrd/host/usr/include/python2.7 -c rrdtoolmodule.c -o build/temp.linux-x86_64-2.7/rrdtoolmodule.o
> rrdtoolmodule.c: In function ?PyRRD_info?:
> rrdtoolmodule.c:450:9: warning: implicit declaration of function ?dst_conv? [-Wimplicit-function-declaration]
> creating build/lib.linux-x86_64-2.7
> /usr/bin/gcc -pthread -shared -L/home/peko/source/buildroot/testrrd/host/lib -L/home/peko/source/buildroot/testrrd/host/usr/lib -Wl,-rpath,/home/peko/source/buildroot/testrrd/host/usr/lib build/temp.linux-x86_64-2.7/rrdtoolmodule.o -L../../src/.libs -L/home/peko/source/buildroot/testrrd/host/usr/lib -Wl,-R/usr/lib -lrrd -lpython2.7 -o build/lib.linux-x86_64-2.7/rrdtoolmodule.so
> /usr/bin/ld: skipping incompatible ../../src/.libs/librrd.so when searching for -lrrd
> /usr/bin/ld: skipping incompatible ../../src/.libs/librrd.a when searching for -lrrd
> /usr/bin/ld: cannot find -lrrd
> collect2: error: ld returned 1 exit status
>
> It looks like it's building for the host instead of for the target. Any
> ideas?
Thanks for the feedback. I'll look into it.

Regards,


-- 
Samuel
