From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 22:10:09 +0200
Subject: [Buildroot] [PATCH] gdb: drop support for Microblaze
In-Reply-To: <20170803215812.28951-1-thomas.petazzoni@free-electrons.com>
References: <20170803215812.28951-1-thomas.petazzoni@free-electrons.com>
Message-ID: <1a0f3d27-091a-b2ac-915d-c1db1ab6d7f9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-08-17 23:58, Thomas Petazzoni wrote:
> Microblaze support was never upstreamed in gdb. We currently use a gdb
> from the Xilinx Github repository, but this gdb is based on 7.6, and
> has never been updated in the last 4 years. There are no other active
> branches at https://github.com/Xilinx/gdb/branches.
> 
> Xilinx has a slightly newer gdb, based on 7.7, available at
> https://github.com/Xilinx/meta-xilinx/tree/master/recipes-microblaze/gdb. However,
> it's apparently only available in the form of stack of big patches
> (https://github.com/Xilinx/meta-xilinx/tree/master/recipes-microblaze/gdb/files).
> 
> Currently, gdb on Microblaze fails to build in various conditions:
> 
>  * Against glibc, with "error: conflicting types for 'ps_lgetfpregs'"
> 
>  * Against musl, with "error: unknown type name 'elf_gregset_t'"
> 
> While those issues can probably be fixed, the fact that there is no
> active upstream significantly reduces the incentive to fix those
> problems.
> 
> Therefore, let's drop support for gdb on Microblaze entirely.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
