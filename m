From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 22 Mar 2016 21:59:05 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-21
In-Reply-To: <CAB0FRssy+PBGQhpC5ELiRyia7opRXsCq8hL4oiqSUVM11pjDvA@mail.gmail.com>
References: <20160322073023.CC980102FD4@stock.ovh.net>
 <CAB0FRssy+PBGQhpC5ELiRyia7opRXsCq8hL4oiqSUVM11pjDvA@mail.gmail.com>
Message-ID: <56F1B219.2020009@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 22/03/2016 18:38, Fran?ois Perrad a ?crit :
> moarvm and many Lua modules (cgilua, copas, xpcall, dado, ...) are
> broken by the latest host-luajit commit (see
> https://git.busybox.net/buildroot/commit/?id=9ba8d1cce4ab00307827083bae234d87b37fb967)
> 
> The common message of error is :
> /home/peko/autobuild/instance-0/output/host/usr/bin/luajit: error
> while loading shared libraries: libluajit-5.1.so.2: cannot open shared
> object file: No such file or directory

It's weird because luajit works here...

./test/luajit/host/usr/bin/luajit
LuaJIT 2.0.4 -- Copyright (C) 2005-2015 Mike Pall. http://luajit.org/
JIT: ON CMOV SSE2 SSE3 SSE4.1 fold cse dce fwd dse narrow loop abc sink fuse
>

ls -l test/luajit/host/usr/lib/libluajit-5.1.so*
lrwxrwxrwx. 1 naourr naourr     22 22 mars  21:42
test/luajit/host/usr/lib/libluajit-5.1.so -> libluajit-5.1.so.2.0.4
lrwxrwxrwx. 1 naourr naourr     22 22 mars  21:42
test/luajit/host/usr/lib/libluajit-5.1.so.2 -> libluajit-5.1.so.2.0.4
-rwxr-xr-x. 1 naourr naourr 458144 22 mars  21:42
test/luajit/host/usr/lib/libluajit-5.1.so.2.0.4

ldd test/luajit/host/usr/bin/luajit
	linux-vdso.so.1 (0x00007ffc995d4000)
	libluajit-5.1.so.2 =>
/home/naourr/buildroot/test/luajit/host/usr/lib/libluajit-5.1.so.2
(0x00007fcf37a42000)
	libm.so.6 => /lib64/libm.so.6 (0x00007fcf3770d000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007fcf37509000)
	libc.so.6 => /lib64/libc.so.6 (0x00007fcf37148000)
	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007fcf36f30000)
	/lib64/ld-linux-x86-64.so.2 (0x000055fd5fd2a000)

Maybe an parallel issue with the install target in luajit makefile ?
I don't know.

Best regards,
Romain

> 
> Fran?ois
> 
