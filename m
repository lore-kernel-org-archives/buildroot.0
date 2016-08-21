From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sun, 21 Aug 2016 11:25:53 -0400
Subject: [Buildroot] pointer dereference to incomplete type
	vm_operations_struct
In-Reply-To: <CAK7rcp_a4y28wwPVRBAPqLOFL2_OieUj36um84ZHsJmZsc=3Eg@mail.gmail.com>
References: <CAK7rcp9RQO8gfsqc6SAyFpn=kK19iRrS=ckYvnSWJuutc_SE3g@mail.gmail.com>
 <20160820195951.61167f14@free-electrons.com>
 <CAK7rcp_a4y28wwPVRBAPqLOFL2_OieUj36um84ZHsJmZsc=3Eg@mail.gmail.com>
Message-ID: <CAK7rcp_5QbNo0y4Y+W3efR99YQ0fCPHKtqVYCNUpU=uzjvOzUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> linux 3.14.51 Building
PATH="/home/rust/buildroot/output/tropicthunder/dev-0/host/bin:/home/rust/buildroot/output/tropicthunder/dev-0/host/sbin:/home/rust/buildroot/output/tropicthunder/dev-0/host/usr/bin:/home/rust/buildroot/output/tropicthunder/dev-0/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
BR_BINARIES_DIR=/home/rust/buildroot/output/tropicthunder/dev-0/images
/usr/bin/make -j5 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=x86_64
INSTALL_MOD_PATH=/home/rust/buildroot/output/tropicthunder/dev-0/target
CROSS_COMPILE="/home/rust/buildroot/output/tropicthunder/dev-0/host/usr/bin/x86_64-buildroot-linux-uclibc-"
DEPMOD=/home/rust/buildroot/output/tropicthunder/dev-0/host/sbin/depmod
-C /home/rust/buildroot/output/tropicthunder/dev-0/build/linux-3.14.51
bzImage
make[2]: Entering directory
'/home/rust/buildroot/output/tropicthunder/dev-0/build/linux-3.14.51'
make[3]: Nothing to be done for 'all'.
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
make[3]: Nothing to be done for 'relocs'.
  CALL    scripts/checksyscalls.sh
  CC      kernel/fork.o
  CHK     include/generated/compile.h
  CC      mm/filemap.o
  CC      init/do_mounts.o
  CC      fs/open.o
kernel/fork.c: In function 'dup_mmap':
kernel/fork.c:536:33: error: dereferencing pointer to incomplete type
'const struct vm_operations_struct'
   if (tmp->vm_ops && tmp->vm_ops->open)
                                 ^
fs/open.c: In function 'do_fallocate':
fs/open.c:280:17: error: dereferencing pointer to incomplete type
'const struct file_operations'
  if (!file->f_op->fallocate)
                 ^
fs/open.c: In function 'file_open_root':
fs/open.c:994:29: error: dereferencing pointer to incomplete type
'const struct inode_operations'
   if (!dentry->d_inode->i_op->lookup)
                             ^
scripts/Makefile.build:308: recipe for target 'kernel/fork.o' failed
make[3]: *** [kernel/fork.o] Error 1
Makefile:917: recipe for target 'kernel' failed
make[2]: *** [kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
scripts/Makefile.build:308: recipe for target 'fs/open.o' failed
make[3]: *** [fs/open.o] Error 1
make[3]: *** Waiting for unfinished jobs....
  CC      fs/read_write.o
  CC      mm/mempool.o
In file included from include/linux/tcp.h:23:0,
                 from include/linux/ipv6.h:62,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from init/do_mounts.c:32:
include/net/sock.h: In function 'sk_user_ns':
include/net/sock.h:665:36: error: dereferencing pointer to incomplete
type 'const struct cred'
  return sk->sk_socket->file->f_cred->user_ns;
                                    ^
scripts/Makefile.build:308: recipe for target 'init/do_mounts.o' failed
make[3]: *** [init/do_mounts.o] Error 1
Makefile:917: recipe for target 'init' failed
make[2]: *** [init] Error 2
fs/read_write.c: In function 'vfs_llseek':
fs/read_write.c:260:17: error: dereferencing pointer to incomplete
type 'const struct file_operations'
   if (file->f_op->llseek)
                 ^
scripts/Makefile.build:308: recipe for target 'fs/read_write.o' failed
make[3]: *** [fs/read_write.o] Error 1
Makefile:917: recipe for target 'fs' failed
make[2]: *** [fs] Error 2
  PASYMS  arch/x86/realmode/rm/pasyms.h
  LDS     arch/x86/realmode/rm/realmode.lds
  LD      arch/x86/realmode/rm/realmode.elf
  RELOCS  arch/x86/realmode/rm/realmode.relocs
  CC      mm/oom_kill.o
  OBJCOPY arch/x86/realmode/rm/realmode.bin
  AS      arch/x86/realmode/rmpiggy.o
  LD      arch/x86/realmode/built-in.o
  VDSOSYM arch/x86/vdso/vdso-syms.lds
  CC      mm/fadvise.o
  LD      arch/x86/vdso/built-in.o
  LD      arch/x86/built-in.o
  CC      mm/maccess.o
  CC      mm/page_alloc.o
  CC      mm/page-writeback.o
  CC      mm/readahead.o
  CC      mm/swap.o
  CC      mm/truncate.o
  CC      mm/vmscan.o
  CC      mm/shmem.o
  CC      mm/util.o
  CC      mm/mmzone.o
  CC      mm/vmstat.o
  CC      mm/backing-dev.o
  CC      mm/mm_init.o
  CC      mm/mmu_context.o
  CC      mm/percpu.o
  CC      mm/slab_common.o
  CC      mm/compaction.o
  CC      mm/balloon_compaction.o
  CC      mm/vmacache.o
  CC      mm/interval_tree.o
  CC      mm/list_lru.o
  CC      mm/fremap.o
  CC      mm/highmem.o
  CC      mm/madvise.o
mm/fremap.c: In function 'SYSC_remap_file_pages':
mm/fremap.c:195:34: error: dereferencing pointer to incomplete type
'const struct vm_operations_struct'
  if (!vma->vm_ops || !vma->vm_ops->remap_pages)
                                  ^
  CC      mm/memory.o
scripts/Makefile.build:308: recipe for target 'mm/fremap.o' failed
make[3]: *** [mm/fremap.o] Error 1
make[3]: *** Waiting for unfinished jobs....
mm/memory.c: In function 'print_bad_pte':
mm/memory.c:689:21: error: dereferencing pointer to incomplete type
'const struct vm_operations_struct'
          vma->vm_ops->fault);
                     ^
mm/memory.c:692:28: error: dereferencing pointer to incomplete type
'const struct file_operations'
          vma->vm_file->f_op->mmap);
                            ^
scripts/Makefile.build:308: recipe for target 'mm/memory.o' failed
make[3]: *** [mm/memory.o] Error 1
Makefile:917: recipe for target 'mm' failed
make[2]: *** [mm] Error 2
make[2]: Leaving directory
'/home/rust/buildroot/output/tropicthunder/dev-0/build/linux-3.14.51'
package/pkg-generic.mk:201: recipe for target
'/home/rust/buildroot/output/tropicthunder/dev-0/build/linux-3.14.51/.stamp_built'
failed
make[1]: *** [/home/rust/buildroot/output/tropicthunder/dev-0/build/linux-3.14.51/.stamp_built]
Error 2
make[1]: Leaving directory '/home/rust/buildroot'
Makefile.buildsystem:136: recipe for target 'one' failed
make: *** [one] Error 2

On Sat, Aug 20, 2016 at 7:33 PM, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> I don't have the particular machine at hand in order to provide those.
> I hope to be able to provide you those things first thing Monday.
>
> On Sat, Aug 20, 2016 at 1:59 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Sat, 20 Aug 2016 13:03:09 -0400, Kenneth Adam Miller wrote:
>>
>>> I'm trying to compile a small linux, and I'm getting an error
>>> sometimes with vm_operations_struct as per the email title. Is there
>>> some kernel option that I'm missing or forgetting to enable? I did a
>>> make clean and was sure to delete my build and target directories. But
>>> I still get that error. Is there some option that I'm missing that
>>> must be set?
>>
>> Please be more specific:
>>
>>  - Which kernel version you're using.
>>  - Which kernel configuration you're using.
>>  - Which exact error message you're getting.
>>
>> However, most likely the issue you're seeing is not Buildroot related,
>> but kernel related.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
