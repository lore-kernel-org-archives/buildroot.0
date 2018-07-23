From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 23 Jul 2018 12:40:43 -0700
Subject: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
In-Reply-To: <20180717130952.5b09ca40@windsurf>
References: <20180716213010.29310-1-romain.naour@gmail.com>
 <20180717130952.5b09ca40@windsurf>
Message-ID: <CAMo8BfLzVa0V+zM0Cwnp2B3wPi4+nLfv1B7Trmf+yFEe=QO-ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 17, 2018 at 4:09 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> The update to binutils 2.31 seems to be causing a regression: it cannot
> build uClibc anymore:

Thanks for the report, the issue is now fixed in the binutils
and a patch is posted to the buildroot.

>   LD libthread_db-1.0.30.so
> /opt/xtensa-lx60--uclibc--bleeding-edge-2018.07-1/lib/gcc/xtensa-buildroot-linux-uclibc/8.1.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.31 internal error, aborting at elf32-xtensa.c:3269 in elf_xtensa_finish_dynamic_sections
>
> /opt/xtensa-lx60--uclibc--bleeding-edge-2018.07-1/lib/gcc/xtensa-buildroot-linux-uclibc/8.1.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: Please report this bug.
>
> collect2: error: ld returned 1 exit status
> libpthread/nptl_db/Makefile.in:53: recipe for target 'lib/libthread_db.so' failed
> make[1]: *** [lib/libthread_db.so] Error 1
> make[1]: Leaving directory '/opt/output/build/uclibc-1.0.30'
>
> My previous build of toolchains, which was using binutils 2.30, went
> fine including on Xtensa.
>
> See
> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82264912
> for the build failure.

-- 
Thanks.
-- Max
