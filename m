From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Apr 2020 00:30:20 +0000
Subject: [Buildroot] [Bug 12761] Buildroot fails when building GCNano
 binaries for the STM32MP1
In-Reply-To: <bug-12761-163@https.bugs.busybox.net/>
References: <bug-12761-163@https.bugs.busybox.net/>
Message-ID: <bug-12761-163-QiKVyj5gif@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12761

--- Comment #2 from Aaron Decker <adecker246@gmail.com> ---
I gave that a shot using the tarball from the ST github. I get a different
error:

https://pastebin.com/UL4vfkNG


In file included from
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:62:
./include/linux/module.h:133:6: error: ?init_module? specifies less restrictive
attribute than its target ?gpu_init?: ?cold? [-Werror=missing-attributes]
  133 |  int init_module(void) __attribute__((alias(#initfn)));
      |      ^~~~~~~~~~~
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:1267:1:
note: in expansion of macro ?module_init?
 1267 | module_init(gpu_init);
      | ^~~~~~~~~~~
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:1224:19:
note: ?init_module? target declared here
 1224 | static int __init gpu_init(void)
      |                   ^~~~~~~~
In file included from
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:62:
./include/linux/module.h:139:7: error: ?cleanup_module? specifies less
restrictive attribute than its target ?gpu_exit?: ?cold?
[-Werror=missing-attributes]
  139 |  void cleanup_module(void) __attribute__((alias(#exitfn)));
      |       ^~~~~~~~~~~~~~
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:1268:1:
note: in expansion of macro ?module_exit?
 1268 | module_exit(gpu_exit);
      | ^~~~~~~~~~~
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.c:1255:20:
note: ?cleanup_module? target declared here
 1255 | static void __exit gpu_exit(void)
      |                    ^~~~~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.
