From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Apr 2020 15:09:47 +0000
Subject: [Buildroot] [Bug 12761] New: Buildroot fails when building GCNano
 binaries for the STM32MP1
Message-ID: <bug-12761-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12761

            Bug ID: 12761
           Summary: Buildroot fails when building GCNano binaries for the
                    STM32MP1
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: adecker246 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Attempting to build for the STM32MP175C target with the GCNano binaries to
enable the GPU. I get the following error.

https://pastebin.com/9VHWLK4D



 CC [M] 
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.o
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaAlloc?:
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:167:11:
error: implicit declaration of function ?dma_alloc_writecombine?; did you mean
?pgprot_writecombine?? [-Werror=implicit-function-declaration]
  167 |         = dma_alloc_writecombine(galcore_device, NumPages * PAGE_SIZE, 
&mdlPriv->dmaHandle, gfp);
      |           ^~~~~~~~~~~~~~~~~~~~~~
      |           pgprot_writecombine
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:167:9:
error: assignment to ?gctPOINTER? {aka ?void *?} from ?int? makes pointer from
integer without a cast [-Werror=int-conversion]
  167 |         = dma_alloc_writecombine(galcore_device, NumPages * PAGE_SIZE, 
&mdlPriv->dmaHandle, gfp);
      |         ^
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaFree?:
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:288:5:
error: implicit declaration of function ?dma_free_writecombine?; did you mean
?pgprot_writecombine?? [-Werror=implicit-function-declaration]
  288 |     dma_free_writecombine(galcore_device, Mdl->numPages * PAGE_SIZE,
mdlPriv->kvaddr, mdlPriv->dmaHandle);
      |     ^~~~~~~~~~~~~~~~~~~~~
      |     pgprot_writecombine
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaMmap?:
/home/ajdecker/projects/buildroot/output/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:324:9:
error: implicit declaration of function ?dma_mmap_writecombine?
[-Werror=implicit-function-declaration]
  324 |     if (dma_mmap_writecombine(gcvNULL,
      |         ^~~~~~~~~~~~~~~~~~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.
