From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 9 Jan 2012 08:46:51 +0100
Subject: [Buildroot] [PATCH v5 6/6] New package: python-netifaces
In-Reply-To: <87ipkmfoc6.fsf@macbook.be.48ers.dk>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
 <1325676605-31194-7-git-send-email-yegorslists@googlemail.com>
 <87pqevffkd.fsf@macbook.be.48ers.dk> <87ipkmfoc6.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kutt0FTK-N=6EmnSeNXEie_4i87mK+ryGbitRim3fu08w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 8, 2012 at 12:03 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
>>>>>> "yegorslists" == yegorslists ?<yegorslists@googlemail.com> writes:
> ?yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
> ?yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> ?Peter> Committed, thanks.
>
> It unfortunately seems broken and tries to build for the host rather
> than the target:
>
> (on a ppc64 host building for i686):
>
> creating build/lib.linux-ppc64-2.7
> /usr/lib64/ccache/gcc -pthread -shared -L/home/peko/scratch/host/lib -L/home/peko/scratch/host/usr/lib -Wl,-rpath,/home/peko/scratch/host/usr/lib -L/home/peko/scratch/host/usr/i686-unknown-linux-uclibc/sysroot/lib -L/home/peko/scratch/host/usr/i686-unknown-linux-uclibc/sysroot/usr/lib build/temp.linux-ppc64-2.7/netifaces.o -o build/lib.linux-ppc64-2.7/netifaces.so
> /usr/bin/ld: skipping incompatible /home/peko/scratch/host/usr/i686-unknown-linux-uclibc/sysroot/lib/libgcc_s.so when searching for -lgcc_s
> /usr/bin/ld: skipping incompatible /lib/libpthread.so.0 when searching for /lib/libpthread.so.0
> /usr/bin/ld: cannot find /lib/libpthread.so.0
> /usr/bin/ld: skipping incompatible /usr/lib/libpthread_nonshared.a when searching for /usr/lib/libpthread_nonshared.a
> /usr/bin/ld: cannot find /usr/lib/libpthread_nonshared.a
> collect2: ld returned 1 exit status
> error: command '/usr/lib64/ccache/gcc' failed with exit status 1
> make: *** [/home/peko/scratch/build/python-netifaces-0.6/.stamp_built] Error 1
>
> Any ideas?

My bad. I had some problems reorganizing my patches and forgot -x
option by build command. Still learning git :-( Please test the patch
I submitted.

Yegor
