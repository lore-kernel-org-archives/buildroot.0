From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Aug 2013 10:28:46 +0200
Subject: [Buildroot] Problem with Qt when using commit libglib2: Bump
	libglib2 to 2.36.1 ( no touchscreen )
Message-ID: <16F215BDBD9D49C49E858122318082E4@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi
 
For some unknown reason, this commit (1232fe4d22e15a31385c69f02570f036b738b6b2) seems to break Qt484 at runtime.
Qt just does not react any longer to the touchscreen.There are no warnings.
Everything else is the same, i see no obvious relation between this commit and the trouble i have.
Just have no clue what the binding is between libglib2 and Qt ?

I am using Tslib as touch interface for qt.
ts_test / ts_calibrate all work fine.
 
Below is an output of strace : 
It shows that there are indeed bindings to libglib2 ...

I am not skilled enoough to find out what exactly is wrong.
It took me a long time to find out what commit broke it..

How to solve this one ?
Johan

# strace ./fluidlauncher -qws[J
execve("./fluidlauncher", ["./fluidlauncher", "-qws"], [/* 16 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f11000
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\240z\24\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 7294976, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6810000
mmap2(0xb6810000, 7073796, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6810000
mmap2(0xb6ed7000, 178700, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x6bf) = 0xb6ed7000
mmap2(0xb6f03000, 5072, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f03000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270_\2\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 774144, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6753000
mmap2(0xb6753000, 721044, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6753000
mmap2(0xb680b000, 15880, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xb0) = 0xb680b000
mmap2(0xb680f000, 324, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb680f000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\224\3\6\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 2531328, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb64e9000
mmap2(0xb64e9000, 2458640, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb64e9000
mmap2(0xb6749000, 38652, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x258) = 0xb6749000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\260C\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb64d5000
mmap2(0xb64d5000, 65276, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb64d5000
mmap2(0xb64e5000, 4124, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x10) = 0xb64e5000
mmap2(0xb64e7000, 4328, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb64e7000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\4d\4\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 692224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb642c000
mmap2(0xb642c000, 607388, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb642c000
mmap2(0xb64c9000, 18216, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x95) = 0xb64c9000
mmap2(0xb64ce000, 24888, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb64ce000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0<\23\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 98304, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6414000
mmap2(0xb6414000, 57556, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6414000
mmap2(0xb642a000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xe) = 0xb642a000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\260'\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 73728, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6402000
mmap2(0xb6402000, 38976, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6402000
mmap2(0xb6413000, 2648, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x9) = 0xb6413000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\340\300\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 458752, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6392000
mmap2(0xb6392000, 399004, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6392000
mmap2(0xb63fb000, 4900, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x61) = 0xb63fb000
mmap2(0xb63fd000, 19240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb63fd000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(3)                                = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0<\t\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 40960, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6388000
mmap2(0xb6388000, 4548, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6388000
mmap2(0xb6391000, 824, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0xb6391000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\300\4\0\0004\0\0\0"..., 4096) = 3180
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb637f000
mmap2(0xb637f000, 1836, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb637f000
mmap2(0xb6387000, 2140, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6387000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\4I\1\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 1032192, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6283000
mmap2(0xb6283000, 995132, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6283000
mmap2(0xb637e000, 2516, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xf3) = 0xb637e000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\350\24\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 65536, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6273000
mmap2(0xb6273000, 27148, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6273000
mmap2(0xb6282000, 632, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x7) = 0xb6282000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0f000
munmap(0xb6f10000, 4096)                = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\330\n\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 49152, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6267000
mmap2(0xb6267000, 8432, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6267000
mmap2(0xb6271000, 4120, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2) = 0xb6271000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(3)                                = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(3)                                = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(3)                                = 0
open("/lib/librt.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0`\16\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 49152, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb625b000
mmap2(0xb625b000, 8228, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb625b000
mmap2(0xb6265000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2) = 0xb6265000
close(3)                                = 0
munmap(0xb6f10000, 4096)                = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(3)                                = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(3)                                = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f10000
set_tls(0xb6f10490, 0xb6f10b50, 0xb6f10b58, 0xb6f10490, 0xb6f12f74) = 0
mprotect(0xb64e5000, 4096, PROT_READ)   = 0
mprotect(0xb64c9000, 12288, PROT_READ)  = 0
mprotect(0xb642a000, 4096, PROT_READ)   = 0
mprotect(0xb63fb000, 4096, PROT_READ)   = 0
mprotect(0xb6271000, 4096, PROT_READ)   = 0
mprotect(0xb6265000, 4096, PROT_READ)   = 0
mprotect(0xb6f12000, 4096, PROT_READ)   = 0
set_tid_address(0xb6f10068)             = 159
set_robust_list(0xb6f10070, 12)         = 0
rt_sigaction(SIGRTMIN, {0xb64de2d4, [], SA_SIGINFO|0x4000000}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0xb64de188, [], SA_RESTART|SA_SIGINFO|0x4000000}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
brk(0)                                  = 0x7dc000
brk(0x7dd000)                           = 0x7dd000
futex(0xb67527c4, FUTEX_WAKE_PRIVATE, 2147483647) = 0
brk(0x7de000)                           = 0x7de000
gettimeofday({947235248, 268055}, NULL) = 0
brk(0x7df000)                           = 0x7df000
eventfd(0)                              = 3
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
brk(0x7e0000)                           = 0x7e0000
clock_getres(CLOCK_MONOTONIC, {0, 1})   = 0
brk(0x7e1000)                           = 0x7e1000
stat64("/proc/159/exe", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
lstat64("/proc/159/exe", {st_mode=S_IFLNK|0777, st_size=0, ...}) = 0
lstat64("/proc", {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
lstat64("/proc/159", {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
lstat64("/proc/159/exe", {st_mode=S_IFLNK|0777, st_size=0, ...}) = 0
readlink("/proc/159/exe", "/usr/share/qt/demos/embedded/flu"..., 4096) = 56
stat64("/proc/159/exe", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded/fluidlauncher", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded/fluidlauncher/fluidlauncher", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
stat64("/usr/share/qt/demos/embedded/fluidlauncher/qt.conf", 0xbee43258) = -1 ENOENT (No such file or directory)
lstat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
open("/root/Settings/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 4
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
fstat64(4, {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
fstatfs(4, {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936, f_bavail=18270596, f_files=0, f_ffree=0,
f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
fstat64(4, {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
fstat64(4, {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
brk(0x7e5000)                           = 0x7e5000
read(4, "[Qt%20Factory%20Cache%204.8]\ncom"..., 16384) = 1389
read(4, "", 14995)                      = 0
brk(0x7e6000)                           = 0x7e6000
gettimeofday({947235248, 632724}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 5
read(5, "MST7MDT\n", 68)                = 8
close(5)                                = 0
open("/etc/TZ", O_RDONLY)               = 5
read(5, "MST7MDT\n", 68)                = 8
close(5)                                = 0
close(4)                                = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee43350) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee43380) = -1 ENOENT (No such file or directory)
gettimeofday({947235248, 640190}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 4
read(4, "MST7MDT\n", 68)                = 8
close(4)                                = 0
open("/etc/TZ", O_RDONLY)               = 4
read(4, "MST7MDT\n", 68)                = 8
close(4)                                = 0
stat64("/proc/159/exe", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
lstat64("/proc/159/exe", {st_mode=S_IFLNK|0777, st_size=0, ...}) = 0
lstat64("/proc", {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
lstat64("/proc/159", {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
lstat64("/proc/159/exe", {st_mode=S_IFLNK|0777, st_size=0, ...}) = 0
readlink("/proc/159/exe", "/usr/share/qt/demos/embedded/flu"..., 4096) = 56
stat64("/proc/159/exe", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded/fluidlauncher", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded/fluidlauncher/fluidlauncher", {st_mode=S_IFREG|0755, st_size=55768, ...}) = 0
stat64("/usr/share/qt/demos/embedded/fluidlauncher/qt.conf", 0xbee437f0) = -1 ENOENT (No such file or directory)
stat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/share/qt/demos/embedded/fluidlauncher", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("/usr/share/qt/demos/embedded/fluidlauncher", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
pipe2([4, 5], O_NONBLOCK|O_CLOEXEC)     = 0
rt_sigaction(SIGCHLD, {0xb65e2f84, [], SA_NOCLDSTOP|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
mkdir("/tmp/qtembedded-0", 0700)        = -1 EEXIST (File exists)
lstat64("/tmp/qtembedded-0", {st_mode=S_IFDIR|0700, st_size=80, ...}) = 0
getuid32()                              = 0
unlink("/tmp/qtembedded-0/QtEmbedded-0") = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 6
unlink("/tmp/qtembedded-0/QtEmbedded-0") = -1 ENOENT (No such file or directory)
bind(6, {sa_family=AF_FILE, sun_path="/tmp/qtembedded-0/QtEmbedded-0"}, 32) = 0
chmod("/tmp/qtembedded-0/QtEmbedded-0", 0600) = 0
listen(6, 16)                           = 0
getsockname(6, {sa_family=AF_FILE, sun_path="/tmp/qtembedded-0/QtEmbedded-0"}, [33]) = 0
getpeername(6, 0xbee43820, [33])        = -1 ENOTCONN (Transport endpoint is not connected)
getsockopt(6, SOL_SOCKET, SO_TYPE, [1], [4]) = 0
fcntl64(6, F_GETFL)                     = 0x2 (flags O_RDWR)
fcntl64(6, F_SETFL, O_RDWR|O_NONBLOCK)  = 0
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
setsockopt(6, SOL_SOCKET, SO_LINGER, {onoff=1, linger=0}, 8) = 0
rt_sigaction(SIGPIPE, {0xb696b1ac, [PIPE], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
geteuid32()                             = 0
mount(NULL, "/var/shm", "shm", 0, NULL) = -1 ENOENT (No such file or directory)
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=100, ...}) = 0
open("/tmp/qtembedded-0//fonts", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 7
fstat64(7, {st_mode=S_IFDIR|0755, st_size=100, ...}) = 0
fcntl(7, F_SETFD, FD_CLOEXEC)           = 0
statfs("/tmp/qtembedded-0//fonts/", {f_type=0x1021994, f_bsize=4096, f_blocks=63625, f_bfree=63521, f_bavail=63521, f_files=63625,
f_ffree=63417, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(7, /* 5 entries */, 4096)    = 176
getdents64(7, /* 0 entries */, 4096)    = 0
close(7)                                = 0
unlink("/tmp/qtembedded-0//fonts/dejavu_sans_12_50.qsf") = 0
unlink("/tmp/qtembedded-0//fonts/dejavu_sans_14_75.qsf") = 0
stat64("/usr/lib/fonts", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
stat64("/tmp/qtembedded-0//fonts//fontdb", {st_mode=S_IFREG|0644, st_size=4475, ...}) = 0
gettimeofday({947235249, 19029}, NULL)  = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
stat64("/usr/lib/fonts", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
gettimeofday({947235249, 24359}, NULL)  = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
gettimeofday({947235249, 28873}, NULL)  = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
gettimeofday({947235249, 33389}, NULL)  = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
open("/tmp/qtembedded-0//fonts//fontdb.tmp", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE|O_CLOEXEC, 0666) = 7
fcntl64(7, F_SETFD, FD_CLOEXEC)         = 0
fstat64(7, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
brk(0x7ee000)                           = 0x7ee000
open("/usr/lib/fonts/fontdir", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
open("/usr/lib/fonts", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 8
fstat64(8, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
brk(0x7ef000)                           = 0x7ef000
statfs("/usr/lib/fonts/", {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936, f_bavail=18270596,
f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(8, /* 51 entries */, 4096)   = 2072
stat64("/usr/lib/fonts/helvetica_140_50.qpf", {st_mode=S_IFREG|0644, st_size=3860, ...}) = 0
stat64("/usr/lib/fonts/helvetica_180_75i.qpf", {st_mode=S_IFREG|0644, st_size=5977, ...}) = 0
stat64("/usr/lib/fonts/helvetica_120_50.qpf", {st_mode=S_IFREG|0644, st_size=3301, ...}) = 0
stat64("/usr/lib/fonts/helvetica_80_50.qpf", {st_mode=S_IFREG|0644, st_size=2735, ...}) = 0
stat64("/usr/lib/fonts/helvetica_120_75.qpf", {st_mode=S_IFREG|0644, st_size=3326, ...}) = 0
stat64("/usr/lib/fonts/helvetica_80_75.qpf", {st_mode=S_IFREG|0644, st_size=2745, ...}) = 0
stat64("/usr/lib/fonts/helvetica_80_75i.qpf", {st_mode=S_IFREG|0644, st_size=2750, ...}) = 0
stat64("/usr/lib/fonts/helvetica_100_75i.qpf", {st_mode=S_IFREG|0644, st_size=3081, ...}) = 0
stat64("/usr/lib/fonts/fixed_70_50.qpf", {st_mode=S_IFREG|0644, st_size=2567, ...}) = 0
stat64("/usr/lib/fonts/helvetica_140_50i.qpf", {st_mode=S_IFREG|0644, st_size=4208, ...}) = 0
stat64("/usr/lib/fonts/helvetica_100_75.qpf", {st_mode=S_IFREG|0644, st_size=3040, ...}) = 0
stat64("/usr/lib/fonts/helvetica_80_50i.qpf", {st_mode=S_IFREG|0644, st_size=2742, ...}) = 0
stat64("/usr/lib/fonts/micro_40_50.qpf", {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
stat64("/usr/lib/fonts/helvetica_100_50i.qpf", {st_mode=S_IFREG|0644, st_size=3052, ...}) = 0
stat64("/usr/lib/fonts/helvetica_120_75i.qpf", {st_mode=S_IFREG|0644, st_size=3759, ...}) = 0
stat64("/usr/lib/fonts/helvetica_180_50.qpf", {st_mode=S_IFREG|0644, st_size=5179, ...}) = 0
stat64("/usr/lib/fonts/helvetica_180_50i.qpf", {st_mode=S_IFREG|0644, st_size=5778, ...}) = 0
stat64("/usr/lib/fonts/helvetica_240_75.qpf", {st_mode=S_IFREG|0644, st_size=7912, ...}) = 0
brk(0x7f0000)                           = 0x7f0000
stat64("/usr/lib/fonts/helvetica_240_50i.qpf", {st_mode=S_IFREG|0644, st_size=8333, ...}) = 0
stat64("/usr/lib/fonts/helvetica_140_75i.qpf", {st_mode=S_IFREG|0644, st_size=4498, ...}) = 0
stat64("/usr/lib/fonts/fixed_120_50.qpf", {st_mode=S_IFREG|0644, st_size=3109, ...}) = 0
stat64("/usr/lib/fonts/helvetica_240_50.qpf", {st_mode=S_IFREG|0644, st_size=7691, ...}) = 0
stat64("/usr/lib/fonts/helvetica_240_75i.qpf", {st_mode=S_IFREG|0644, st_size=8588, ...}) = 0
stat64("/usr/lib/fonts/helvetica_180_75.qpf", {st_mode=S_IFREG|0644, st_size=5712, ...}) = 0
stat64("/usr/lib/fonts/helvetica_140_75.qpf", {st_mode=S_IFREG|0644, st_size=4035, ...}) = 0
stat64("/usr/lib/fonts/helvetica_100_50.qpf", {st_mode=S_IFREG|0644, st_size=3046, ...}) = 0
stat64("/usr/lib/fonts/helvetica_120_50i.qpf", {st_mode=S_IFREG|0644, st_size=3560, ...}) = 0
getdents64(8, /* 0 entries */, 4096)    = 0
close(8)                                = 0
brk(0x7f1000)                           = 0x7f1000
open("/usr/lib/fonts", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 8
fstat64(8, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
brk(0x7f2000)                           = 0x7f2000
statfs("/usr/lib/fonts/", {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936, f_bavail=18270596,
f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(8, /* 51 entries */, 4096)   = 2072
stat64("/usr/lib/fonts/VeraMoIt.ttf", {st_mode=S_IFREG|0644, st_size=54508, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSans-Oblique.ttf", {st_mode=S_IFREG|0644, st_size=434576, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSansMono-BoldOblique.ttf", {st_mode=S_IFREG|0644, st_size=177780, ...}) = 0
stat64("/usr/lib/fonts/VeraBd.ttf", {st_mode=S_IFREG|0644, st_size=58716, ...}) = 0
stat64("/usr/lib/fonts/VeraIt.ttf", {st_mode=S_IFREG|0644, st_size=63684, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSans.ttf", {st_mode=S_IFREG|0644, st_size=493564, ...}) = 0
stat64("/usr/lib/fonts/VeraMono.ttf", {st_mode=S_IFREG|0644, st_size=49224, ...}) = 0
stat64("/usr/lib/fonts/VeraMoBd.ttf", {st_mode=S_IFREG|0644, st_size=49052, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSerif-Oblique.ttf", {st_mode=S_IFREG|0644, st_size=179872, ...}) = 0
stat64("/usr/lib/fonts/VeraBI.ttf", {st_mode=S_IFREG|0644, st_size=63208, ...}) = 0
stat64("/usr/lib/fonts/VeraSe.ttf", {st_mode=S_IFREG|0644, st_size=60280, ...}) = 0
brk(0x7f3000)                           = 0x7f3000
stat64("/usr/lib/fonts/VeraSeBd.ttf", {st_mode=S_IFREG|0644, st_size=58736, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSerif-BoldOblique.ttf", {st_mode=S_IFREG|0644, st_size=180948, ...}) = 0
stat64("/usr/lib/fonts/Vera.ttf", {st_mode=S_IFREG|0644, st_size=65932, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSans-Bold.ttf", {st_mode=S_IFREG|0644, st_size=466696, ...}) = 0
stat64("/usr/lib/fonts/VeraMoBI.ttf", {st_mode=S_IFREG|0644, st_size=55032, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSerif-Bold.ttf", {st_mode=S_IFREG|0644, st_size=201516, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSansMono-Bold.ttf", {st_mode=S_IFREG|0644, st_size=229460, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSerif.ttf", {st_mode=S_IFREG|0644, st_size=210416, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSansMono-Oblique.ttf", {st_mode=S_IFREG|0644, st_size=184896, ...}) = 0
stat64("/usr/lib/fonts/DejaVuSansMono.ttf", {st_mode=S_IFREG|0644, st_size=237788, ...}) = 0
brk(0x7f4000)                           = 0x7f4000
stat64("/usr/lib/fonts/DejaVuSans-BoldOblique.ttf", {st_mode=S_IFREG|0644, st_size=441736, ...}) = 0
getdents64(8, /* 0 entries */, 4096)    = 0
close(8)                                = 0
brk(0x7f8000)                           = 0x7f8000
open("/usr/lib/fonts/DejaVuSans-Bold.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=466696, ...}) = 0
mmap2(NULL, 466696, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb61e9000
close(8)                                = 0
brk(0x7fc000)                           = 0x7fc000
brk(0x7fd000)                           = 0x7fd000
munmap(0xb61e9000, 466696)              = 0
open("/usr/lib/fonts/DejaVuSans-BoldOblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=441736, ...}) = 0
mmap2(NULL, 441736, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb61ef000
close(8)                                = 0
munmap(0xb61ef000, 441736)              = 0
open("/usr/lib/fonts/DejaVuSans-Oblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=434576, ...}) = 0
mmap2(NULL, 434576, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb61f0000
close(8)                                = 0
munmap(0xb61f0000, 434576)              = 0
open("/usr/lib/fonts/DejaVuSans.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=493564, ...}) = 0
mmap2(NULL, 493564, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb61e2000
close(8)                                = 0
munmap(0xb61e2000, 493564)              = 0
open("/usr/lib/fonts/DejaVuSansMono-Bold.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=229460, ...}) = 0
mmap2(NULL, 229460, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb6222000
close(8)                                = 0
munmap(0xb6222000, 229460)              = 0
open("/usr/lib/fonts/DejaVuSansMono-BoldOblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=177780, ...}) = 0
mmap2(NULL, 177780, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb622f000
close(8)                                = 0
munmap(0xb622f000, 177780)              = 0
open("/usr/lib/fonts/DejaVuSansMono-Oblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=184896, ...}) = 0
mmap2(NULL, 184896, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb622d000
close(8)                                = 0
munmap(0xb622d000, 184896)              = 0
open("/usr/lib/fonts/DejaVuSansMono.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=237788, ...}) = 0
mmap2(NULL, 237788, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb6220000
close(8)                                = 0
munmap(0xb6220000, 237788)              = 0
open("/usr/lib/fonts/DejaVuSerif-Bold.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=201516, ...}) = 0
mmap2(NULL, 201516, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb6229000
close(8)                                = 0
munmap(0xb6229000, 201516)              = 0
open("/usr/lib/fonts/DejaVuSerif-BoldOblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=180948, ...}) = 0
mmap2(NULL, 180948, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb622e000
close(8)                                = 0
munmap(0xb622e000, 180948)              = 0
open("/usr/lib/fonts/DejaVuSerif-Oblique.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=179872, ...}) = 0
mmap2(NULL, 179872, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb622f000
close(8)                                = 0
munmap(0xb622f000, 179872)              = 0
open("/usr/lib/fonts/DejaVuSerif.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=210416, ...}) = 0
mmap2(NULL, 210416, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb6227000
close(8)                                = 0
munmap(0xb6227000, 210416)              = 0
open("/usr/lib/fonts/Vera.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=65932, ...}) = 0
mmap2(NULL, 65932, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624a000
close(8)                                = 0
munmap(0xb624a000, 65932)               = 0
open("/usr/lib/fonts/VeraBd.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=58716, ...}) = 0
mmap2(NULL, 58716, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624c000
close(8)                                = 0
munmap(0xb624c000, 58716)               = 0
open("/usr/lib/fonts/VeraBI.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=63208, ...}) = 0
mmap2(NULL, 63208, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624b000
close(8)                                = 0
munmap(0xb624b000, 63208)               = 0
open("/usr/lib/fonts/VeraIt.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=63684, ...}) = 0
mmap2(NULL, 63684, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624b000
close(8)                                = 0
munmap(0xb624b000, 63684)               = 0
open("/usr/lib/fonts/VeraMoBd.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=49052, ...}) = 0
mmap2(NULL, 49052, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624f000
close(8)                                = 0
munmap(0xb624f000, 49052)               = 0
open("/usr/lib/fonts/VeraMoBI.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=55032, ...}) = 0
mmap2(NULL, 55032, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624d000
close(8)                                = 0
munmap(0xb624d000, 55032)               = 0
open("/usr/lib/fonts/VeraMoIt.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=54508, ...}) = 0
mmap2(NULL, 54508, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624d000
close(8)                                = 0
munmap(0xb624d000, 54508)               = 0
open("/usr/lib/fonts/VeraMono.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=49224, ...}) = 0
mmap2(NULL, 49224, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624e000
close(8)                                = 0
munmap(0xb624e000, 49224)               = 0
open("/usr/lib/fonts/VeraSe.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=60280, ...}) = 0
mmap2(NULL, 60280, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624c000
close(8)                                = 0
munmap(0xb624c000, 60280)               = 0
open("/usr/lib/fonts/VeraSeBd.ttf", O_RDONLY|O_LARGEFILE) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
fstat64(8, {st_mode=S_IFREG|0644, st_size=58736, ...}) = 0
mmap2(NULL, 58736, PROT_READ, MAP_PRIVATE, 8, 0) = 0xb624c000
close(8)                                = 0
munmap(0xb624c000, 58736)               = 0
open("/usr/lib/fonts", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 8
fstat64(8, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl(8, F_SETFD, FD_CLOEXEC)           = 0
statfs("/usr/lib/fonts/", {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936, f_bavail=18270596,
f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(8, /* 51 entries */, 4096)   = 2072
getdents64(8, /* 0 entries */, 4096)    = 0
close(8)                                = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235250, 244101}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 8
read(8, "MST7MDT\n", 68)                = 8
close(8)                                = 0
open("/etc/TZ", O_RDONLY)               = 8
read(8, "MST7MDT\n", 68)                = 8
close(8)                                = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee43170) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee431a0) = -1 ENOENT (No such file or directory)
gettimeofday({947235250, 250476}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 8
read(8, "MST7MDT\n", 68)                = 8
close(8)                                = 0
open("/etc/TZ", O_RDONLY)               = 8
read(8, "MST7MDT\n", 68)                = 8
close(8)                                = 0
stat64("/usr/lib/qt/plugins/fontengines/.", 0xbee431d8) = -1 ENOENT (No such file or directory)
stat64("/usr/share/qt/demos/embedded/fluidlauncher/fontengines/.", 0xbee431d8) = -1 ENOENT (No such file or directory)
unlink("/tmp/qtembedded-0//fonts//fontdb") = 0
lstat64("/tmp/qtembedded-0//fonts//fontdb", 0xbee42350) = -1 ENOENT (No such file or directory)
write(7, "\4\f\0\0\0\34\0/\0u\0s\0r\0/\0l\0i\0b\0/\0f\0o\0n\0t"..., 4475) = 4475
close(7)                                = 0
rename("/tmp/qtembedded-0//fonts//fontdb.tmp", "/tmp/qtembedded-0//fonts//fontdb") = 0
stat64("/tmp/qtembedded-0/QtEmbedded-0", {st_mode=S_IFSOCK|0600, st_size=0, ...}) = 0
semget(0x640d03db, 0, 0)                = -1 ENOENT (No such file or directory)
semget(0x640d03db, 1, IPC_CREAT|0600)   = 131072
semctl(131072, 0, IPC_64|SETVAL, 0xc8)  = 0
rt_sigaction(SIGHUP, {0xb697bc10, [HUP], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGINT, {0xb697bc10, [INT], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGQUIT, {0xb697bc10, [QUIT], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGILL, {0xb697bc10, [ILL], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGABRT, {0xb697bc10, [ABRT], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGFPE, {0xb697bc10, [FPE], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGSEGV, {0xb697bc10, [SEGV], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGTERM, {0xb697bc10, [TERM], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
rt_sigaction(SIGBUS, {0xb697bc10, [BUS], SA_RESTART|0x4000000}, {SIG_DFL, [], 0}, 8) = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235250, 599018}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee434f0) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee43520) = -1 ENOENT (No such file or directory)
gettimeofday({947235250, 605384}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
open("/etc/TZ", O_RDONLY)               = 7
read(7, "MST7MDT\n", 68)                = 8
close(7)                                = 0
stat64("/usr/lib/qt/plugins/gfxdrivers/.", 0xbee43558) = -1 ENOENT (No such file or directory)
stat64("/usr/share/qt/demos/embedded/fluidlauncher/gfxdrivers/.", 0xbee43558) = -1 ENOENT (No such file or directory)
access("/dev/fb0", R_OK|W_OK)           = 0
open("/dev/fb0", O_RDWR|O_LARGEFILE|O_CLOEXEC) = 7
fcntl64(7, F_SETFD, FD_CLOEXEC)         = 0
ioctl(7, FBIOGET_FSCREENINFO or FBIOPUT_CONTRAST, 0xbee4379c) = 0
ioctl(7, FBIOGET_VSCREENINFO, 0xbee436fc) = 0
mmap2(NULL, 3145728, PROT_READ|PROT_WRITE, MAP_SHARED, 7, 0) = 0xb5f5b000
shmget(IPC_PRIVATE, 1024, IPC_CREAT|0600) = 131073
shmat(131073, 0, 0)                     = 0xb5f5a000
shmctl(131073, IPC_64|IPC_RMID, 0)      = 0
open("/dev/tty0", O_RDWR|O_LARGEFILE|O_CLOEXEC) = 8
fcntl64(8, F_SETFD, FD_CLOEXEC)         = 0
ioctl(8, KDGETMODE, 0x7edee0)           = 0
write(8, "\33[9;0]\33[?33l\33[?25l\33[?1c\0", 24) = 24
ioctl(7, FBIOGET_VSCREENINFO, 0xbee437dc) = 0
ioctl(7, FBIOGET_FSCREENINFO or FBIOPUT_CONTRAST, 0xbee4387c) = 0
ioctl(7, FBIOBLANK, 0)                  = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235250, 622333}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee430d0) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee43100) = -1 ENOENT (No such file or directory)
gettimeofday({947235250, 960403}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
gettimeofday({947235250, 967993}, NULL) = 0
gettimeofday({947235250, 968417}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235250, 975433}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee43578) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee435a8) = -1 ENOENT (No such file or directory)
gettimeofday({947235250, 981816}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
open("/etc/TZ", O_RDONLY)               = 9
read(9, "MST7MDT\n", 68)                = 8
close(9)                                = 0
stat64("/usr/lib/qt/plugins/mousedrivers/.", 0xbee435e0) = -1 ENOENT (No such file or directory)
stat64("/usr/share/qt/demos/embedded/fluidlauncher/mousedrivers/.", 0xbee435e0) = -1 ENOENT (No such file or directory)
open("/proc/self/auxv", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 9
fcntl64(9, F_SETFD, FD_CLOEXEC)         = 0
read(9, "\20\0\0\0\327\260\10\0\6\0\0\0\0\20\0\0\21\0\0\0d\0\0\0\3\0\0\0004\200\0\0"..., 256) = 144
close(9)                                = 0
semop(131072, {{0, -1, SEM_UNDO}}, 1)   = 0
semop(131072, {{0, 1, SEM_UNDO}}, 1)    = 0
open("/dev/tty0", O_RDWR|O_LARGEFILE|O_CLOEXEC) = 9
fcntl64(9, F_SETFD, FD_CLOEXEC)         = 0
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
ioctl(9, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(9, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(9, KDGKBMODE, 0x7e6a3c)           = 0
ioctl(9, KDSKBMODE, 0x2)                = 0
ioctl(9, SNDCTL_TMR_START or SNDRV_TIMER_IOCTL_TREAD or TCSETS, {B0 -opost -isig -icanon -echo ...}) = 0
ioctl(9, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B38400 -opost -isig -icanon -echo ...}) = 0
rt_sigaction(SIGUSR1, {0xb661a78c, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigaction(SIGUSR2, {0xb661a78c, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
ioctl(9, VIDIOC_RESERVED or VT_GETMODE, 0xbee438b8) = 0
ioctl(9, VIDIOC_ENUM_FMT or VT_SETMODE, 0xbee438b8) = 0
ioctl(9, VT_GETSTATE, 0xbee438c8)       = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 10
unlink("/tmp/.qt_soundserver-0")        = 0
bind(10, {sa_family=AF_FILE, sun_path="/tmp/.qt_soundserver-0"}, 24) = 0
chmod("/tmp/.qt_soundserver-0", 0600)   = 0
listen(10, 16)                          = 0
getsockname(10, {sa_family=AF_FILE, sun_path="/tmp/.qt_soundserver-0"}, [25]) = 0
getpeername(10, 0xbee43790, [25])       = -1 ENOTCONN (Transport endpoint is not connected)
getsockopt(10, SOL_SOCKET, SO_TYPE, [1], [4]) = 0
fcntl64(10, F_GETFL)                    = 0x2 (flags O_RDWR)
fcntl64(10, F_SETFL, O_RDWR|O_NONBLOCK) = 0
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235251, 8733}, NULL)   = 0
open("/etc/TZ", O_RDONLY)               = 11
read(11, "MST7MDT\n", 68)               = 8
close(11)                               = 0
open("/etc/TZ", O_RDONLY)               = 11
read(11, "MST7MDT\n", 68)               = 8
close(11)                               = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee436d0) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee43700) = -1 ENOENT (No such file or directory)
gettimeofday({947235251, 347225}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 11
read(11, "MST7MDT\n", 68)               = 8
close(11)                               = 0
open("/etc/TZ", O_RDONLY)               = 11
read(11, "MST7MDT\n", 68)               = 8
close(11)                               = 0
stat64("/usr/lib/qt/plugins/decorations/.", 0xbee43738) = -1 ENOENT (No such file or directory)
stat64("/usr/share/qt/demos/embedded/fluidlauncher/decorations/.", 0xbee43738) = -1 ENOENT (No such file or directory)
clock_gettime(CLOCK_MONOTONIC, {416, 622593904}) = 0
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
brk(0x80f000)                           = 0x80f000
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
brk(0x810000)                           = 0x810000
brk(0x823000)                           = 0x823000
clock_gettime(CLOCK_MONOTONIC, {416, 636929838}) = 0
lstat64("config.xml", {st_mode=S_IFREG|0644, st_size=2508, ...}) = 0
open("config.xml", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=2508, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=2508, ...}) = 0
read(11, "<?xml version=\"1.0\" encoding=\"is"..., 16384) = 2508
read(11, "", 13876)                     = 0
read(11, "", 5684)                      = 0
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
open("slides", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 12
fstat64(12, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl(12, F_SETFD, FD_CLOEXEC)          = 0
statfs("slides/", {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936, f_bavail=18270596, f_files=0,
f_ffree=0, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(12, /* 8 entries */, 4096)   = 240
stat64("slides/demo_6.png", {st_mode=S_IFREG|0644, st_size=5826, ...}) = 0
access("slides/demo_6.png", R_OK)       = 0
stat64("slides/demo_2.png", {st_mode=S_IFREG|0644, st_size=5209, ...}) = 0
access("slides/demo_2.png", R_OK)       = 0
stat64("slides/.", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("slides/..", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("slides/demo_1.png", {st_mode=S_IFREG|0644, st_size=20560, ...}) = 0
access("slides/demo_1.png", R_OK)       = 0
stat64("slides/demo_3.png", {st_mode=S_IFREG|0644, st_size=19791, ...}) = 0
access("slides/demo_3.png", R_OK)       = 0
stat64("slides/demo_4.png", {st_mode=S_IFREG|0644, st_size=5505, ...}) = 0
access("slides/demo_4.png", R_OK)       = 0
stat64("slides/demo_5.png", {st_mode=S_IFREG|0644, st_size=6130, ...}) = 0
access("slides/demo_5.png", R_OK)       = 0
getdents64(12, /* 0 entries */, 4096)   = 0
close(12)                               = 0
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
read(11, "", 16384)                     = 0
read(11, "", 8192)                      = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=2508, ...}) = 0
stat64(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
getcwd("/usr/share/qt/demos/embedded/fluidlauncher", 4096) = 43
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {416, 675121999}) = 0
clock_gettime(CLOCK_MONOTONIC, {416, 675546109}) = 0
open("screenshots/concentriccircles.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=29623, ...}) = 0
stat64("/root/Settings/Trolltech.conf", {st_mode=S_IFREG|0644, st_size=1389, ...}) = 0
gettimeofday({947235251, 411497}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
lstat64("/etc/xdg/Trolltech.conf", 0xbee43508) = -1 ENOENT (No such file or directory)
open("/etc/xdg/Trolltech.conf", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat64("/etc/xdg/Trolltech.conf", 0xbee43538) = -1 ENOENT (No such file or directory)
gettimeofday({947235251, 749740}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
stat64("/usr/lib/qt/plugins/imageformats/.", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
open("/usr/lib/qt/plugins/imageformats", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 12
fstat64(12, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl(12, F_SETFD, FD_CLOEXEC)          = 0
statfs("/usr/lib/qt/plugins/imageformats/", {f_type="NFS_SUPER_MAGIC", f_bsize=4096, f_blocks=33295704, f_bfree=19961936,
f_bavail=18270596, f_files=0, f_ffree=0, f_fsid={0, 0}, f_namelen=255, f_frsize=4096}) = 0
getdents64(12, /* 8 entries */, 4096)   = 240
stat64("/usr/lib/qt/plugins/imageformats/libqmng.so", {st_mode=S_IFREG|0755, st_size=259056, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqgif.so", {st_mode=S_IFREG|0755, st_size=19440, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/.", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/..", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqsvg.so", {st_mode=S_IFREG|0755, st_size=14972, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqtga.so", {st_mode=S_IFREG|0755, st_size=14404, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqjpeg.so", {st_mode=S_IFREG|0755, st_size=185320, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqico.so", {st_mode=S_IFREG|0755, st_size=19140, ...}) = 0
getdents64(12, /* 0 entries */, 4096)   = 0
close(12)                               = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqgif.so", {st_mode=S_IFREG|0755, st_size=19440, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqgif.so", {st_mode=S_IFREG|0755, st_size=19440, ...}) = 0
gettimeofday({947235251, 775539}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqico.so", {st_mode=S_IFREG|0755, st_size=19140, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqico.so", {st_mode=S_IFREG|0755, st_size=19140, ...}) = 0
gettimeofday({947235251, 785750}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqjpeg.so", {st_mode=S_IFREG|0755, st_size=185320, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqjpeg.so", {st_mode=S_IFREG|0755, st_size=185320, ...}) = 0
gettimeofday({947235252, 126179}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqmng.so", {st_mode=S_IFREG|0755, st_size=259056, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqmng.so", {st_mode=S_IFREG|0755, st_size=259056, ...}) = 0
gettimeofday({947235252, 135382}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqsvg.so", {st_mode=S_IFREG|0755, st_size=14972, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqsvg.so", {st_mode=S_IFREG|0755, st_size=14972, ...}) = 0
gettimeofday({947235252, 144445}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/usr/lib/qt/plugins/imageformats/libqsvg.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=14972, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb5f59000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\4 \0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 49152, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5f4d000
mmap2(0xb5f4d000, 12876, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5f4d000
mmap2(0xb5f58000, 1432, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x3) = 0xb5f58000
close(12)                               = 0
munmap(0xb5f59000, 4096)                = 0
open("/lib/libQtSvg.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtSvg.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtSvg.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=207416, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb5f59000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\374\344\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 241664, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5f12000
mmap2(0xb5f12000, 199820, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5f12000
mmap2(0xb5f4b000, 5512, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x31) = 0xb5f4b000
close(12)                               = 0
munmap(0xb5f59000, 4096)                = 0
open("/lib/libQtXml.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtXml.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtXml.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/X11R6/lib/libQtXml.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/usr/lib/qt/plugins/imageformats/libqsvg.so", {st_mode=S_IFREG|0755, st_size=14972, ...}) = 0
lstat64("/usr", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib", {st_mode=S_IFDIR|0755, st_size=16384, ...}) = 0
lstat64("/usr/lib/qt", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
lstat64("/usr/lib/qt/plugins/imageformats/libqtga.so", {st_mode=S_IFREG|0755, st_size=14404, ...}) = 0
stat64("/usr/lib/qt/plugins/imageformats/libqtga.so", {st_mode=S_IFREG|0755, st_size=14404, ...}) = 0
gettimeofday({947235252, 500982}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
open("/etc/TZ", O_RDONLY)               = 12
read(12, "MST7MDT\n", 68)               = 8
close(12)                               = 0
stat64("/usr/share/qt/demos/embedded/fluidlauncher/imageformats/.", 0xbee43570) = -1 ENOENT (No such file or directory)
open("/usr/lib/qt/plugins/imageformats/libqgif.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=19440, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0e000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\230\32\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 53248, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5f05000
mmap2(0xb5f05000, 17404, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5f05000
mmap2(0xb5f11000, 1804, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x4) = 0xb5f11000
close(12)                               = 0
munmap(0xb6f0e000, 4096)                = 0
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/librt.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=29623, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\1\265\0\0\1\301\10\2\0\0\0a{\262"..., 16384) = 16384
open("/usr/lib/qt/plugins/imageformats/libqico.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=19140, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0e000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0H\36\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 53248, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5ef8000
mmap2(0xb5ef8000, 17076, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5ef8000
mmap2(0xb5f04000, 1504, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x4) = 0xb5f04000
close(12)                               = 0
munmap(0xb6f0e000, 4096)                = 0
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/librt.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/usr/lib/qt/plugins/imageformats/libqjpeg.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=185320, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0e000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\324-\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 217088, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5ec3000
mmap2(0xb5ec3000, 182276, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5ec3000
mmap2(0xb5ef7000, 3844, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x2c) = 0xb5ef7000
close(12)                               = 0
munmap(0xb6f0e000, 4096)                = 0
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/librt.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/usr/lib/qt/plugins/imageformats/libqmng.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=259056, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0e000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\334?\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 290816, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5e7c000
mmap2(0xb5e7c000, 246484, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5e7c000
mmap2(0xb5ec1000, 7948, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x3d) = 0xb5ec1000
close(12)                               = 0
munmap(0xb6f0e000, 4096)                = 0
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/librt.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/usr/lib/qt/plugins/imageformats/libqtga.so", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=14404, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f0e000
read(12, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\354\30\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 49152, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb5e70000
mmap2(0xb5e70000, 11408, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 12, 0) = 0xb5e70000
mmap2(0xb5e7b000, 864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 12, 0x3) = 0xb5e7b000
close(12)                               = 0
munmap(0xb6f0e000, 4096)                = 0
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/lib/libQtGui.so.4", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtGui.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=7253692, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libQtNetwork.so.4", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtNetwork.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=737976, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libts-1.0.so.0", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libQtCore.so.4", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libQtCore.so.4", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=2497548, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libgthread-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libgthread-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=3180, ...}) = 0
close(12)                               = 0
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/librt.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13192, ...}) = 0
close(12)                               = 0
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=629924, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libm.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=62244, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libglib-2.0.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libglib-2.0.so.0", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=999096, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libintl.so.8", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/home/buildroot12git/output/build/libglib2-2.36.1/glib/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/lib/libintl.so.8", O_RDONLY)     = -1 ENOENT (No such file or directory)
open("/usr/lib/libintl.so.8", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=41008, ...}) = 0
close(12)                               = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=40760, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/ld-uClibc.so.0", O_RDONLY)   = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=25296, ...}) = 0
close(12)                               = 0
open("/lib/libc.so.0", O_RDONLY)        = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=403260, ...}) = 0
close(12)                               = 0
open("/lib/libdl.so.0", O_RDONLY)       = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=13216, ...}) = 0
close(12)                               = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 12
fstat(12, {st_mode=S_IFREG|0755, st_size=95340, ...}) = 0
close(12)                               = 0
_llseek(11, 0, [0], SEEK_SET)           = 0
mmap2(NULL, 786432, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5db0000
brk(0x82b000)                           = 0x82b000
_llseek(11, 16384, [16384], SEEK_SET)   = 0
read(11, "\6\303G\303\307\220\2e\257Kz\277\267\0018[\360\317\34=v\34 \363\255\22\366\272\300\7n\360"..., 41) = 41
read(11, "\260`q \343\243K$\211 \230\221\245Ct\303h39^\241&\365iE[I\2151`g\213"..., 16384) = 13198
read(11, "", 3186)                      = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=29623, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=29623, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=29623, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {423, 862784961}) = 0
open("screenshots/wiggly.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=6546, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=6546, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\1p\0\0\0\253\10\3\0\0\0HI7"..., 16384) = 6546
read(11, "", 9838)                      = 0
_llseek(11, 0, [0], SEEK_SET)           = 0
brk(0x832000)                           = 0x832000
brk(0x83a000)                           = 0x83a000
fstat64(11, {st_mode=S_IFREG|0644, st_size=6546, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=6546, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=6546, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {423, 874215980}) = 0
open("screenshots/pathstroke.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=14216, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=14216, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\0\360\0\0\1@\10\2\0\0\0\r\212f"..., 16384) = 14216
read(11, "", 2168)                      = 0
_llseek(11, 0, [0], SEEK_SET)           = 0
mmap2(NULL, 311296, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5d64000
fstat64(11, {st_mode=S_IFREG|0644, st_size=14216, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=14216, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=14216, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {423, 890593446}) = 0
open("screenshots/deform.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=18393, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=18393, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\0\360\0\0\1@\10\2\0\0\0\r\212f"..., 16384) = 16384
_llseek(11, 0, [0], SEEK_SET)           = 0
mmap2(NULL, 311296, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5d18000
_llseek(11, 16384, [16384], SEEK_SET)   = 0
read(11, "v\357\336]!OlB{\365\326y\272=\370\340\203\21\10\300\362,\356r\245\16\30Ha\275\367-"..., 41) = 41
read(11, "A\6\22\215<\31=\257\240\231\351upC6)\351\360\203\367k\251\3\6\330C\37\304}\206'\33"..., 16384) = 1968
read(11, "", 14416)                     = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=18393, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=18393, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=18393, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {423, 911978466}) = 0
open("screenshots/styledemo.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=26891, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=26891, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\0\360\0\0\1@\10\3\0\0\0\2656\1"..., 16384) = 16384
_llseek(11, 0, [0], SEEK_SET)           = 0
brk(0x845000)                           = 0x845000
brk(0x84d000)                           = 0x84d000
_llseek(11, 16384, [16384], SEEK_SET)   = 0
read(11, "\315c\262\350\313\6\177|\30eiF\0f\244\321\252\221\250\326\305\312B\26\27\275\326\347\32\235\263v"..., 245) = 245
read(11, "I\2140F\33\17\324\372\32\204e\r3\330\205&\30\256Y\323\21\25r\227\235\r\226+-Q-\23"..., 16384) = 10262
read(11, "", 6122)                      = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=26891, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=26891, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=26891, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {424, 261538139}) = 0
open("screenshots/embeddedsvgviewer.png", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=7482, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=7482, ...}) = 0
read(11, "\211PNG\r\n\32\n\0\0\0\rIHDR\0\0\0\360\0\0\1@\10\2\0\0\0\r\212f"..., 16384) = 7482
read(11, "", 8902)                      = 0
_llseek(11, 0, [0], SEEK_SET)           = 0
mmap2(NULL, 311296, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5ccc000
fstat64(11, {st_mode=S_IFREG|0644, st_size=7482, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=7482, ...}) = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=7482, ...}) = 0
close(11)                               = 0
clock_gettime(CLOCK_MONOTONIC, {424, 277489679}) = 0
clock_gettime(CLOCK_MONOTONIC, {424, 277891379}) = 0
stat64("/usr/lib/fonts/DejaVuSans.ttf", {st_mode=S_IFREG|0644, st_size=493564, ...}) = 0
lstat64("/usr/lib/fonts/DejaVuSans.ttf", {st_mode=S_IFREG|0644, st_size=493564, ...}) = 0
open("/usr/lib/fonts/DejaVuSans.ttf", O_RDONLY|O_LARGEFILE) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
fstat64(11, {st_mode=S_IFREG|0644, st_size=493564, ...}) = 0
mmap2(NULL, 493564, PROT_READ, MAP_PRIVATE, 11, 0) = 0xb5c53000
close(11)                               = 0
brk(0x84e000)                           = 0x84e000
brk(0x84f000)                           = 0x84f000
brk(0x850000)                           = 0x850000
brk(0x851000)                           = 0x851000
brk(0x852000)                           = 0x852000
brk(0x853000)                           = 0x853000
brk(0x854000)                           = 0x854000
brk(0x855000)                           = 0x855000
brk(0x856000)                           = 0x856000
brk(0x857000)                           = 0x857000
brk(0x858000)                           = 0x858000
brk(0x859000)                           = 0x859000
brk(0x85a000)                           = 0x85a000
brk(0x85b000)                           = 0x85b000
brk(0x85c000)                           = 0x85c000
brk(0x85d000)                           = 0x85d000
brk(0x85e000)                           = 0x85e000
brk(0x85f000)                           = 0x85f000
brk(0x860000)                           = 0x860000
brk(0x861000)                           = 0x861000
brk(0x862000)                           = 0x862000
brk(0x863000)                           = 0x863000
brk(0x865000)                           = 0x865000
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
access("/tmp/qtembedded-0//fonts/dejavu_sans_12_50.qsf", F_OK) = -1 ENOENT (No such file or directory)
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
access("/tmp/qtembedded-0//fonts/", W_OK) = 0
open("/tmp/qtembedded-0//fonts/dejavu_sans_12_50.qsf", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE|O_CLOEXEC, 0644) = 11
fcntl64(11, F_SETFD, FD_CLOEXEC)        = 0
brk(0x86d000)                           = 0x86d000
write(11, "QPF2\0\0\0\0\2\0\0\250\0\0\0\vDejaVu Sans\0\1\0\35/"..., 16552) = 16552
fstat64(11, {st_mode=S_IFREG|0644, st_size=16552, ...}) = 0
mmap2(NULL, 16552, PROT_READ|PROT_WRITE, MAP_SHARED, 11, 0) = 0xb5c4e000
mmap2(NULL, 770048, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5b92000
clock_gettime(CLOCK_MONOTONIC, {424, 313659659}) = 0
mmap2(NULL, 1540096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb5a1a000
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
clock_gettime(CLOCK_MONOTONIC, {424, 316015124}) = 0
clock_gettime(CLOCK_MONOTONIC, {424, 316653179}) = 0
poll([{fd=3, events=POLLIN}, {fd=6, events=POLLIN}, {fd=9, events=POLLIN}, {fd=10, events=POLLIN}], 4, 0) = 1 ([{fd=3,
revents=POLLIN}])
clock_gettime(CLOCK_MONOTONIC, {424, 318299114}) = 0
brk(0x89b000)                           = 0x89b000
brk(0x8d1000)                           = 0x8d1000
brk(0x907000)                           = 0x907000
mmap2(NULL, 311296, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0xb59ce000
munmap(0xb59ce000, 311296)              = 0
brk(0x93d000)                           = 0x93d000
brk(0x97b000)                           = 0x97b000
brk(0x9a9000)                           = 0x9a9000
stat64("/usr/lib/fonts/DejaVuSans-Bold.ttf", {st_mode=S_IFREG|0644, st_size=466696, ...}) = 0
lstat64("/usr/lib/fonts/DejaVuSans-Bold.ttf", {st_mode=S_IFREG|0644, st_size=466696, ...}) = 0
open("/usr/lib/fonts/DejaVuSans-Bold.ttf", O_RDONLY|O_LARGEFILE) = 12
fcntl64(12, F_SETFD, FD_CLOEXEC)        = 0
fstat64(12, {st_mode=S_IFREG|0644, st_size=466696, ...}) = 0
mmap2(NULL, 466696, PROT_READ, MAP_PRIVATE, 12, 0) = 0xb59a8000
close(12)                               = 0
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=80, ...}) = 0
access("/tmp/qtembedded-0//fonts/dejavu_sans_14_75.qsf", F_OK) = -1 ENOENT (No such file or directory)
stat64("/tmp/qtembedded-0//fonts", {st_mode=S_IFDIR|0755, st_size=80, ...}) = 0
access("/tmp/qtembedded-0//fonts/", W_OK) = 0
open("/tmp/qtembedded-0//fonts/dejavu_sans_14_75.qsf", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE|O_CLOEXEC, 0644) = 12
fcntl64(12, F_SETFD, FD_CLOEXEC)        = 0
write(12, "QPF2\0\0\0\0\2\0\0\260\0\0\0\vDejaVu Sans\0\1\0\"/"..., 16548) = 16548
fstat64(12, {st_mode=S_IFREG|0644, st_size=16548, ...}) = 0
mmap2(NULL, 16548, PROT_READ|PROT_WRITE, MAP_SHARED, 12, 0) = 0xb59a3000
fcntl64(12, F_SETLKW64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}, 0xbee3fe18) = 0
_llseek(12, 0, [16548], SEEK_END)       = 0
write(12, "\t\v\f\1\365\n", 6)          = 6
write(12, "%4442#\2\0\0\0\0\0\270\377\377\377\377\377\352h\0\0\0\0\270\377\372\264\273\364\377\377"..., 132) = 132
_llseek(12, 0, [16686], SEEK_END)       = 0
write(12, "\t\t\f\0\370\t", 6)          = 6
write(12, "\0c\256\314\324\302\205\21\0\0\0\0\0\274\362\317\321\373\377\314\1\0\0\0\0/\4\0\0H\377\377"..., 108) = 108
_llseek(12, 0, [16800], SEEK_END)       = 0
write(12, "\7\n\10\0\366\7", 6)         = 6
write(12, "\0}\324\262\0\0\0\0\0\230\377\330\0\0\0\0\210\334\377\362\250\250?\0\320\377\377\377\377\377`\0"..., 80) = 80
_llseek(12, 0, [16886], SEEK_END)       = 0
write(12, "\10\v\10\1\365\n", 6)        = 6
write(12, "\207\244f\0\0\0\0\0\324\377\240\0\0\0\0\0\324\377\240\0\0\0\0\0\324\377\240O\275\317\207\5"..., 88) = 88
_llseek(12, 0, [16980], SEEK_END)       = 0
write(12, "\0\0\0\0\0\5", 6)            = 6
write(12, NULL, 0)                      = 0
_llseek(12, 0, [16986], SEEK_END)       = 0
write(12, "\t\f\f\1\365\n", 6)          = 6
write(12, "\0\3>^\\C\27\0\0\0\0\0(\333\377\377\377\377\377]\0\0\0\0\300\377\357\231\211\254\355d"..., 144) = 144
_llseek(12, 0, [17136], SEEK_END)       = 0
write(12, "\6\10\10\1\370\7", 6)        = 6
write(12, "\213\250iS\300\264\0\0\324\377\336\376\377\334\0\0\324\377\377y)=\0\0\324\377\304\0\0\0\0\0"..., 64) = 64
_llseek(12, 0, [17206], SEEK_END)       = 0
write(12, "\n\t\f\0\370\n", 6)          = 6
write(12, "\0\0L\256\321\311\222 \0\0\0\0\0|\377\377\363\373\377\357+\0\0\0\32\373\377\241\3\34\350\377"..., 108) = 108
_llseek(12, 0, [17320], SEEK_END)       = 0
write(12, "\t\v\f\1\365\t", 6)          = 6
write(12, "\207\244f\0\0\0\0\0\0\0\0\0\324\377\240\0\0\0\0\0\0\0\0\0\324\377\240\0\0\0\0\0"..., 132) = 132
_llseek(12, 0, [17458], SEEK_END)       = 0
write(12, "\3\v\4\1\365\5", 6)          = 6
write(12, "\207\244f\0\324\377\240\0L\\9\0\213\250i\0\324\377\240\0\324\377\240\0\324\377\240\0\324\377\240\0"..., 44) = 44
_llseek(12, 0, [17508], SEEK_END)       = 0
write(12, "\10\10\10\1\370\n", 6)       = 6
write(12, "\213\250iO\275\317\207\5\324\377\345\377\377\377\377~\324\377\373@\21\323\377\314\324\377\271\0\0\235\377\336"..., 64) =
64
_llseek(12, 0, [17578], SEEK_END)       = 0
write(12, "\t\f\f\0\370\n", 6)          = 6
write(12, "\0\4y\310\275Vf\250\215\0\0\0\0\232\377\377\370\376\344\377\330\0\0\0\37\376\377\250\5+\365\377"..., 144) = 144
fcntl64(12, F_SETLK64, {type=F_UNLCK, whence=SEEK_SET, start=0, len=0}, 0xbee3fe38) = 0
_llseek(12, 0, [17728], SEEK_END)       = 0
mremap(0xb59a3000, 16548, 17728, MREMAP_MAYMOVE) = 0xb59a3000
write(3, "\1\0\0\0\0\0\0\0", 8)         = 8
clock_gettime(CLOCK_MONOTONIC, {424, 988903250}) = 0
semop(131072, {{0, -1, SEM_UNDO}}, 1)   = 0
semop(131072, {{0, 1, SEM_UNDO}}, 1)    = 0
semop(131072, {{0, -1, SEM_UNDO}}, 1)   = 0
semop(131072, {{0, 1, SEM_UNDO}}, 1)    = 0
poll([{fd=3, events=POLLIN}, {fd=6, events=POLLIN}, {fd=9, events=POLLIN}, {fd=10, events=POLLIN}], 4, 0) = 1 ([{fd=3,
revents=POLLIN}])
read(3, "\v\0\0\0\0\0\0\0", 16)         = 8
clock_gettime(CLOCK_MONOTONIC, {425, 30657956}) = 0
poll([{fd=3, events=POLLIN}, {fd=6, events=POLLIN}, {fd=9, events=POLLIN}, {fd=10, events=POLLIN}], 4, 59958Process 159 detached
 <detached ...>
# 
