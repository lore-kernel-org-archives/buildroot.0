From: Belisko Marek <marek.belisko@gmail.com>
Date: Sat, 31 Dec 2011 13:12:34 +0100
Subject: [Buildroot] problem with ccache during valgrind compiling
In-Reply-To: <20111230090615.1b93ee88@skate>
References: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
 <20111230090615.1b93ee88@skate>
Message-ID: <CAAfyv37svSYUTu4bE7236jmyG0=XLA=8Ty-eBrPJ02xqZt9=6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 30, 2011 at 9:06 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Belisko, Diego,
>
> Le Fri, 9 Dec 2011 20:09:58 +0100,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>> I'm trying to build valgrind but it fails on my system with:
>
> I have sent yesterday a patch that updates Valgrind to 3.7.0 and that
> fixes the build problem with ccache. See
> http://lists.busybox.net/pipermail/buildroot/2011-December/048683.html.
>
> If would be great if you had the time to test this patch and see if
> Valgrind works for you.
I apply patch you sent and there is another problem:
mv -f .deps/libcoregrind_arm_linux_a-readdwarf3.Tpo
.deps/libcoregrind_arm_linux_a-readdwarf3.Po
/home/open-nandra/projects/buildroot-new/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-DHAVE_CONFIG_H -I. -I..  -I.. -I../include -I../VEX/pub -DVGA_arm=1
-DVGO_linux=1 -DVGP_arm_linux=1 -DVGPV_arm_linux_vanilla=1
-I../coregrind -DVG_LIBDIR="\"/usr/lib/valgrind"\"
-DVG_PLATFORM="\"arm-linux\""  -O2 -g -Wall -Wmissing-prototypes
-Wshadow -Wpointer-arith -Wstrict-prototypes -Wmissing-declarations
-Wno-format-zero-length -fno-strict-aliasing -fno-builtin -marm
-mcpu=cortex-a8 -Wno-long-long -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wno-pointer-sign
-fno-stack-protector -MT libcoregrind_arm_linux_a-readstabs.o -MD -MP
-MF .deps/libcoregrind_arm_linux_a-readstabs.Tpo -c -o
libcoregrind_arm_linux_a-readstabs.o `test -f
'm_debuginfo/readstabs.c' || echo './'`m_debuginfo/readstabs.c
m_debuginfo/readstabs.c:55:45: fatal error: linux/nlist.h: No such
file or directory
compilation terminated.
make[4]: *** [libcoregrind_arm_linux_a-readstabs.o] Error 1
make[4]: *** Waiting for unfinished jobs....
mv -f .deps/libcoregrind_arm_linux_a-readpdb.Tpo
.deps/libcoregrind_arm_linux_a-readpdb.Po
make[4]: Leaving directory
`/home/open-nandra/projects/buildroot-new/output/build/valgrind-3.7.0/coregrind'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/open-nandra/projects/buildroot-new/output/build/valgrind-3.7.0/coregrind'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/open-nandra/projects/buildroot-new/output/build/valgrind-3.7.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/open-nandra/projects/buildroot-new/output/build/valgrind-3.7.0'
make: *** [/home/open-nandra/projects/buildroot-new/output/build/valgrind-3.7.0/.stamp_built]
Error 2

Config in attachment.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17547 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111231/17740737/attachment.obj>
