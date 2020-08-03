From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Aug 2020 13:43:53 +0200
Subject: [Buildroot] [PATCH v2] boot/grub2: Backport Boothole securify
 fixes
In-Reply-To: <20200803080025.434603-1-stefan.sorensen@spectralink.com>
 (stefan's message of "Mon, 3 Aug 2020 10:00:25 +0200")
References: <20200803080025.434603-1-stefan.sorensen@spectralink.com>
Message-ID: <873654uf7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "stefan" == stefan  <stefan@astylos.dk> writes:

 > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html

 > Fixes the following security issues:

 >  * CVE-2020-10713
 >    A flaw was found in grub2, prior to version 2.06. An attacker may
 >    use the GRUB 2 flaw to hijack and tamper the GRUB verification
 >    process. This flaw also allows the bypass of Secure Boot
 >    protections. In order to load an untrusted or modified kernel, an
 >    attacker would first need to establish access to the system such as
 >    gaining physical access, obtain the ability to alter a pxe-boot
 >    network, or have remote access to a networked system with root
 >    access. With this access, an attacker could then craft a string to
 >    cause a buffer overflow by injecting a malicious payload that leads
 >    to arbitrary code execution within GRUB. The highest threat from
 >    this vulnerability is to data confidentiality and integrity as well
 >    as system availability.

 >  * CVE-2020-14308
 >    In grub2 versions before 2.06 the grub memory allocator doesn't
 >    check for possible arithmetic overflows on the requested allocation
 >    size. This leads the function to return invalid memory allocations
 >    which can be further used to cause possible integrity,
 >    confidentiality and availability impacts during the boot process.

 >  * CVE-2020-14309
 >    There's an issue with grub2 in all versions before 2.06 when
 >    handling squashfs filesystems containing a symbolic link with name
 >    length of UINT32 bytes in size. The name size leads to an
 >    arithmetic overflow leading to a zero-size allocation further
 >    causing a heap-based buffer overflow with attacker controlled data.

 >  * CVE-2020-14310
 >    An integer overflow in read_section_from_string may lead to a heap
 >    based buffer overflow.

 >  * CVE-2020-14311
 >    An integer overflow in grub_ext2_read_link may lead to a heap-based
 >    buffer overflow.

 >  * CVE-2020-15706
 >    GRUB2 contains a race condition in grub_script_function_create()
 >    leading to a use-after-free vulnerability which can be triggered by
 >    redefining a function whilst the same function is already
 >    executing, leading to arbitrary code execution and secure boot
 >    restriction bypass

 >  * CVE-2020-15707
 >    Integer overflows were discovered in the functions grub_cmd_initrd
 >    and grub_initrd_init in the efilinux component of GRUB2, as shipped
 >    in Debian, Red Hat, and Ubuntu (the functionality is not included
 >    in GRUB2 upstream), leading to a heap-based buffer overflow. These
 >    could be triggered by an extremely large number of arguments to the
 >    initrd command on 32-bit architectures, or a crafted filesystem
 >    with very large files on any architecture. An attacker could use
 >    this to execute arbitrary code and bypass UEFI Secure Boot
 >    restrictions. This issue affects GRUB2 version 2.04 and prior
 >    versions.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > ---
 > Changes since v1:
 >  * Add Signed-off-by to patches


Please use the -N option to git format-patch as pointed out by
check-package:

Applying: boot/grub2: Backport Boothole securify fixes
boot/grub2/0002-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch:4: generate your patches with 'git format-patch -N'

Committed after fixing that up, thanks.

-- 
Bye, Peter Korsgaard
