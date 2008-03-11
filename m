From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Mar 2008 11:39:03 +0100
Subject: [Buildroot] Trying to compile uClibc in thumb mode
Message-ID: <20080311113903.1e46d90e@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm currently trying to compile uClibc in thumb mode using Buildroot
(binutils 2.18.50.0.1, gcc 4.2.1, uclibc 0.9.29). To enable thumb mode,
I simply modified toolchain/uClibc/uClibc-0.9.29.config, and set
UCLIBC_EXTRA_CFLAGS to "-mthumb".

However, the compilation fails quickly in ldso:

make[1]: entrant dans le r?pertoire ? /mnt/space/free-electrons/buildroot/toolchain_build_arm/uClibc-0.9.29 ?
  CC ldso/ldso/ldso.oS
ldso/ldso/dl-elf.c: In function '_dl_load_elf_shared_library':
ldso/ldso/dl-elf.c:647: error: unable to find a register to spill in class 'LO_REGS'
ldso/ldso/dl-elf.c:647: error: this is the insn:
(insn:HI 912 911 913 105 (set (reg/v:SI 0 r0 [ _a1 ])
        (plus:SI (reg/v:SI 187 [ map_size ])
            (reg:SI 214 [ iftmp.138 ]))) 5 {*thumb_addsi3} (nil)
    (expr_list:REG_DEAD (reg/v:SI 187 [ map_size ])
        (expr_list:REG_DEAD (reg:SI 214 [ iftmp.138 ])
            (nil))))
ldso/ldso/dl-elf.c:647: confused by earlier errors, bailing out
make[1]: *** [ldso/ldso/ldso.oS] Erreur 1

Is it an issue with uClibc itself or with the compiler ?

Thanks for your help,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080311/7db210a0/attachment.pgp 
