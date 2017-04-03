From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:32:13 +0200
Subject: [Buildroot] [PATCH] binutils: bump to 2.28
In-Reply-To: <20170321005943.3400-1-Adamduskett@outlook.com>
References: <20170321005943.3400-1-Adamduskett@outlook.com>
Message-ID: <20170403223213.7d5d3490@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 20:59:43 -0400, Adam Duskett wrote:
> In addition, I also modified the patch line numbers to match the
> changes.  I also ran this package with test-pkg to insure that
> it built properly.

Please stop using the "first person" in your commit logs. Also, this
commit log was not very useful because it didn't mention which patches
have been upstreamed and in which commit. So I've replaced your commit
log with the following:

    binutils: bump to 2.28
    
     - Patch 0100-elf32-arm-no-data-fix.patch is upstream as of commit
       6342be709e8749d0a44c02e1876ddca360bfd52f, so it is removed.
    
     - Patch 0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch is
       upstream as of commit 78fb7e37eb8bb08ae537d6c487996ff17c810332, so
       it is removed.
    
     - Patch
       0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch is
       upstream as of commit c646b02fdcae5f37bd88f33a0c4683ef13ad5c82, so
       it is removed.
    
     - All other patches are kept, just refreshed to apply cleanly on the
       new binutils version.

Also, your .hash file change added many useless empty lines, so I dropped them.

Applied after fixing those issues. I've also done a few other binutils
related changes in the process:

 - Remove unused 2.24 binutils hash.

 - Switch to binutils 2.27 as the default

 - Remove support for binutils 2.25.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
