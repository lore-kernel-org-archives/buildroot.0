From: Geraldo Netto <geraldonetto@gmail.com>
Date: Sun, 5 Oct 2008 10:54:08 -0300
Subject: [Buildroot] error when running make -> missing sysdep.h
Message-ID: <faf3083f0810050654l19efd405nf2efd5bcbecbb8c6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

how are you doing?

i got this when running make:
.
.
/usr/bin/make -j1 -C /media/ntfs/buildroot/toolchain_build_i686/uClibc \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
make[1]: Entrando no diret?rio
`/media/ntfs/buildroot/toolchain_build_i686/uClibc'
  GEN include/bits/sysnum.h
zcat ../../extra/locale/uClibc-locale-030818.tgz | tar -xv -C
../../extra/locale/ -f -
c8tables.h
locale_data.c
locale_mmap.h
lt_defines.h
uClibc_locale_data.h
wctables.h
touch ../../extra/locale/locale_data.c
# we use the one in locale_DIR
#rm -f ../../extra/locale/locale_mmap.h
cat ../../extra/locale/uClibc_locale_data.h | awk 'BEGIN{i=1}{ if (
/WANT_/ ) i = /endif/ ; else if (i) print  }' >
../../include/bits/uClibc_locale_data.h
  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o
  CC ldso/ldso/ldso.oS
In file included from
./libpthread/linuxthreads/sysdeps/i386/i686/pt-machine.h:73,
                 from ./libpthread/linuxthreads/sysdeps/i386/pt-machine.h:24,
                 from ./libpthread/linuxthreads/sysdeps/i386/tls.h:23,
                 from ./include/bits/uClibc_errno.h:35,
                 from ./include/errno.h:62,
                 from ./include/bits/syscalls.h:14,
                 from ./include/sys/syscall.h:34,
                 from ./ldso/ldso/i386/dl-syscalls.h:3,
                 from ./ldso/include/dl-syscall.h:12,
                 from ./ldso/include/ldso.h:36,
                 from ldso/ldso/ldso.c:33:
./libpthread/linuxthreads/sysdeps/i386/i686/../useldt.h:25:20: error:
sysdep.h: No such file or directory
make[1]: ** [ldso/ldso/ldso.oS] Erro 1
make[1]: Saindo do diret?rio `/media/ntfs/buildroot/toolchain_build_i686/uClibc'
make: ** [/media/ntfs/buildroot/toolchain_build_i686/uClibc/lib/libc.a] Erro 2

have any of you faced the same problem?
is there any tip to fix it?

btw, could any of you provide me a .config with tinyx enabled?
i was unable to get it compiled :(
and could nptl break this build?
i mean, i enabled nptl in my .config

Kind Regards and Best Wishes,

Geraldo
S?o Paulo, Brasil, -3gmt
site: http://exdev.sf.net/
msn: geraldo_boca_at_hotmail.com
skype: geraldo-netto
icq: 145-061-456
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-buildroot-thinix
Type: application/octet-stream
Size: 16862 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081005/fe007dae/attachment-0001.obj 
