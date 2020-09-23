From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:51:27 +0200
Subject: [Buildroot] [PATCH] gcc: powerpc32 transition to secureplt
In-Reply-To: <20200923152908.21153-1-matthew.weber@rockwellcollins.com>
References: <20200923152908.21153-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200923205127.0a60882c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2020 10:29:08 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
> runtime code generation to generate the PLT stubs. Secure-PLT was
> introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
> Binutils 2.17), and is a more secure PLT format, using a read-only
> linkage table, with the dynamic linker populating a non-executable
> index table.
> 
> Ref to other distro/BSD transitions
> https://patchwork.openembedded.org/patch/106621/
> https://reviews.freebsd.org/D20598
> 
> Fixes a bug observed when creating SELinux policy where all apps
> require execmem because the heap requires execute before this
> change.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/gcc/gcc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
