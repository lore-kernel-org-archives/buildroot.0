From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 23 Dec 2017 11:06:04 +0100
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <87608xykge.fsf@paral.in>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87608xykge.fsf@paral.in>
Message-ID: <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

check config.log where pam_misc is added. May be configure has a bug and detects your host pam under certain conditions.

best regards
 Waldemar 

> Am 23.12.2017 um 08:25 schrieb Christian Stewart <christian@paral.in>:
> 
> 
> Hi Waldemar, all,
> 
> Waldemar Brodkorb <wbx@openadk.org> writes:
>> can you make the last failing link command more verbose?
>> CCLD should be expanded to the full command used.
> 
> I went back and figured out how to make autotools verbose in Buildroot,
> so here you are. Note that I am using out-of-tree build mode, like this:
> 
>  make -O$(pwd) -C path/to/buildroot
> 
> /bin/sh ./libtool  --tag=CC   --mode=link /home/paralin/buildroot/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__  -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2  -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z,relro -Wl,-z,now -pie    -o busctl src/busctl/busctl.o src/busctl/busctl-introspect.o libsystemd-shared.la                           
> libtool: link: /home/paralin/buildroot/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z -Wl,relro -Wl,-z -Wl,now -pie -o systemd-mount src/mount/mount-tool.o  ./.libs/libsystemd-shared.so -L/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lcap -lrt -lresolv /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblzma.so -llz4 /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgcrypt.so /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgpg-error.so /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so /home/paralin/buildroot/build/util-linux-2.31/.libs/libuuid.so -pthread -Wl,-rpath -Wl,/home/paralin/buildroot/build/systemd-234/.libs -Wl,-rpath -Wl,/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/paralin/buildroot/build/util-linux-2.31/.libs -Wl,-rpath -Wl,/lib/systemd -Wl,-rpath -Wl,/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib                                                                                                                                                                                             
> libtool: link: /home/paralin/buildroot/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections -I/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount -I/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid -I/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z -Wl,relro -Wl,-z -Wl,now -pie -o systemd-analyze src/analyze/systemd_analyze-analyze.o src/analyze/systemd_analyze-analyze-verify.o  ./.libs/libcore.a /home/paralin/buildroot/build/systemd-234/.libs/libsystemd-shared.so -L/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lcap -lresolv -llz4 /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgcrypt.so /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgpg-error.so /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so /lib/libpam.so /lib/libpam_misc.so /home/paralin/buildroot/build/linux-pam-1.3.0/libpam/.libs/libpam.so -ldl /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libkmod.so /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblzma.so -lz /home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libmount.so /home/paralin/buildroot/build/util-linux-2.31/.libs/libblkid.so /home/paralin/buildroot/build/util-linux-2.31/.libs/libuuid.so -lrt -pthread -Wl,-rpath -Wl,/home/paralin/buildroot/build/systemd-234/.libs -Wl,-rpath -Wl,/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/paralin/buildroot/build/linux-pam-1.3.0/libpam/.libs -Wl,-rpath -Wl,/home/paralin/buildroot/build/util-linux-2.31/.libs -Wl,-rpath -Wl,/lib/systemd -Wl,-rpath -Wl,/home/paralin/buildroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib                                                                                                                                                                                          
> /lib/libpam.so: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
> make[4]: *** [Makefile:12785: systemd-analyze] Error 1
> make[4]: *** Waiting for unfinished jobs....
> libtool: link: /home/paralin/buildroot/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-style
> 
> It appears to be explicitly linking against absolute path /lib/libpam.so
> on my machine. My environment is clean, no LD_PATH modifications or so.
> 
> Any help is greatly appreciated. I cannot use the newer versions of
> Buildroot because of this.
> 
> Thanks,
> Christian
> 
