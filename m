From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 08 Aug 2018 09:24:05 +0200
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_3/6=5D_package/Makefile=2Ein?=
 =?iso-8859-1?q?=3A_Use_gcc_spec_files_for_PIE_build_flags?=
In-Reply-To: <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
Message-ID: <425833b3-d86f-4275-bc3c-a80c6385b030@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt, thanks for working on this.

When I apply this patch, I'm getting a build failure from an out-of-tree 
[1] package, see the attached log. The package lives at [1], the Buildroot 
recipe is pretty straightforward [2]. Here's the relevant snippet from the 
failure:

  /home/jkt/work/prog/_build/br-cfb/host/bin/arm-linux-gnueabihf-gcc -Wall 
-Wl,-z -Wl,now -Wl,-z -Wl,relro 
-specs=/home/jkt/work/cesnet/gerrit/github/buildroot/buildroot/toolchain/gcc-specs-pie-ld 
-o .libs/example example.o  ./.libs/libredblack.so
  
/home/jkt/work/prog/_build/br-cfb/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: 
example.o: relocation R_ARM_MOVW_ABS_NC against `stderr' can not be used 
when making a shared object; recompile with -fPIC

Is that a failure of that particular package, or a problem in the compiler 
specs?

Also, Gentoo Linux has been doing compiler hardening for years and their 
specs appear to be more complex according to the docs [4]. I have no clue 
if that extra complexity is needed in Buildroot.

With kind regards,
Jan

[1] I'll submit them once my patches reach a release upstream.
[2] https://github.com/sysrepo/libredblack
[3] 
https://gerrit.cesnet.cz/plugins/gitiles/github/buildroot/buildroot/+/a0cff08df5918e1721723400da42c8c68b8c0928%5E%21/
[4] https://wiki.gentoo.org/wiki/Hardened/Toolchain
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log-libredblack-spec-files
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180808/4e152f50/attachment.ksh>
