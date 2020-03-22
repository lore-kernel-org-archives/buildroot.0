From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:37:11 +0100
Subject: [Buildroot] [PATCH v1] package/libevdev: fix static compile
In-Reply-To: <20200310084540.7176-1-ps.report@gmx.net>
References: <20200310084540.7176-1-ps.report@gmx.net>
Message-ID: <20200322223711.35de850a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 09:45:40 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add patch to enable meson static library build (use meson
> library() instead of shared_library()).
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/b920ef5a250e7d23223352367ded50bf32bb5688
> 
>   .../host/bin/arm-linux-gcc  -o libevdev.so.2.3.0 'evdev at sha/libevdev_libevdev-uinput.c.o' 'evdev at sha/libevdev_libevdev.c.o' 'evdev at sha/libevdev_libevdev-names.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libevdev.so.2 -Wl,--end-group -Wl,-elf2flt -static -Wl,--version-script,.../build/libevdev-1.9.0/libevdev/libevdev.sym
>   ld (ld-elf2flt): -shared used without passing a shared library ID
> 
>   - http://autobuild.buildroot.net/results/dc52a705c7490b722380af7b00ff7c6e172450cf
> 
>   .../host/bin/x86_64-linux-gcc  -o libevdev.so.2.3.0 'evdev at sha/libevdev_libevdev-uinput.c.o' 'evdev at sha/libevdev_libevdev.c.o' 'evdev at sha/libevdev_libevdev-names.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libevdev.so.2 -Wl,--end-group -static -Wl,--version-script,.../build/libevdev-1.9.0/libevdev/libevdev.sym
>   .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object
>   .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/crtend.o: relocation R_X86_64_32 against `.ctors' can not be used when making a shared object; recompile with -fPIC
>   .../host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: final link failed: nonrepresentable section on output
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...on.build-enable-static-library-build.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libevdev/0003-meson.build-enable-static-library-build.patch

Applied to master, thanks. I've added a reference to the upstream
commit, as your patch has been merged upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
