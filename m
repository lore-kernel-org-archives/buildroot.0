From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 17:13:20 +0800
Subject: [Buildroot] Make error
In-Reply-To: <ed4892840808310034y2b352388q9dd2ff90a614ee13@mail.gmail.com>
References: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
	<87od3966tr.fsf@macbook.be.48ers.dk>
	<ed4892840808310034y2b352388q9dd2ff90a614ee13@mail.gmail.com>
Message-ID: <ed4892840808310213w4e9edea5wa69beac5ebf7c7eb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 31, 2008 at 3:34 PM, Steven Woody <narkewoody@gmail.com> wrote:
> On Sun, Aug 31, 2008 at 2:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Steven" == Steven Woody <narkewoody@gmail.com> writes:
>>
>>  Steven> Following were outputed when run 'make', but I don't know
>>  Steven> what step it is related to:
>>
>>  Steven> table='target/generic/mini_device_table.txt' makedevs: line
>>  Steven> 53: regular file
>>  Steven> '/home/narke/buildroot/project_build_arm/uclibc/
>>  Steven> root/usr/share/udhcpc/default.script' does not exist: No such
>>  Steven> file or directory
>>
>> Not a big deal. The mini config you have selected
>> (BR2_PACKAGE_BUSYBOX_SKELETON) has the udhcpc script listed in its
>> device table to ensure it gets to be executable, but doesn't have a
>> default script. If you don't enable avahi (which provides such a
>> script) you'll get this warning.
>>
>> The avahi package nowadays ensures that it's udhcpc script gets to be
>> executable, so I'll remove the entry from the device table.
>
> So much thanks!
>

Wait a moment ...!   After I turned on the 'avahi' in networking
section and run make, I got the following error instead:

Making all in avahi-common
make[3]: Entering directory
`/home/woody/buildroot/build_arm/avahi-0.6.22/avahi-common'
/bin/sh ../libtool --tag=CC --mode=link
/home/woody/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os  -I/home/woody/buildroot/build_arm/staging_dir/usr/include
-I/home/woody/buildroot/build_arm/staging_dir/include
--sysroot=/home/woody/buildroot/build_arm/staging_dir/ -isysroot
/home/woody/buildroot/build_arm/staging_dir -mtune=arm920t -I..
'-DDEBUG_TRAP=__asm__("int $3")' -g -O2 -std=c99 -Wall -W -Wextra
-pedantic -pipe -Wformat -Wold-style-definition
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-declarations
-Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls
-Wmissing-noreturn -Wshadow -Wendif-labels -Wpointer-arith
-Wbad-function-cast -Wcast-qual -Wcast-align -Wwrite-strings -Winline
-fPIC -D_XOPEN_SOURCE=500 -D__EXTENSIONS__   -o libavahi-common.la
-rpath /usr/lib  -export-dynamic -version-info 8:0:5
libavahi_common_la-malloc.lo libavahi_common_la-address.lo
libavahi_common_la-alternative.lo libavahi_common_la-error.lo
libavahi_common_la-strlst.lo libavahi_common_la-domain.lo
libavahi_common_la-timeval.lo libavahi_common_la-simple-watch.lo
libavahi_common_la-thread-watch.lo libavahi_common_la-rlist.lo
libavahi_common_la-utf8.lo libavahi_common_la-i18n.lo  -pthread
-lintl
/home/woody/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os  -I/home/woody/buildroot/build_arm/staging_dir/usr/include
-I/home/woody/buildroot/build_arm/staging_dir/include
--sysroot=/home/woody/buildroot/build_arm/staging_dir/ -isysroot
/home/woody/buildroot/build_arm/staging_dir -mtune=arm920t -shared
.libs/libavahi_common_la-malloc.o .libs/libavahi_common_la-address.o
.libs/libavahi_common_la-alternative.o
.libs/libavahi_common_la-error.o .libs/libavahi_common_la-strlst.o
.libs/libavahi_common_la-domain.o .libs/libavahi_common_la-timeval.o
.libs/libavahi_common_la-simple-watch.o
.libs/libavahi_common_la-thread-watch.o
.libs/libavahi_common_la-rlist.o .libs/libavahi_common_la-utf8.o
.libs/libavahi_common_la-i18n.o  -lintl  -mtune=arm920t -pthread
-Wl,-soname -Wl,libavahi-common.so.3 -o .libs/libavahi-common.so.3.5.0
/home/woody/buildroot/build_arm/staging_dir/usr/bin-ccache/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/bin/ld:
cannot find -lintl
collect2: ld returned 1 exit status
make[3]: *** [libavahi-common.la] Error 1

What do I do? Thanks.
