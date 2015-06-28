From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:34:42 +0200
Subject: [Buildroot] [PATCH 2/2] glog: disable on blackfin external
 toolchains
In-Reply-To: <1435239804-17119-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1435239804-17119-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1435239804-17119-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20150628153442.580a3352@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On Thu, 25 Jun 2015 19:13:24 +0530, Rahul Bedarkar wrote:
> With following blackfin toolchains
> 
> BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
> BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
> BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
> 
> when BR2_BINFMT_FDPIC=y
> 
> ../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
> ../usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'
> 
> code snippet at line 95 in elf-fdpic.h
> -------------------------------------------------------
> unsigned long offset = p - (void*)map->segs[c].p_vaddr;
> -------------------------------------------------------

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
