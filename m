From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 15:20:38 +0100
Subject: [Buildroot] [PATCH v4 02/13] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 23 Jan 2018 22:09:41 -0600")
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87607mf4jt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > This enables a user to build a complete system using these
 > options.  It is important to note that not all packages will
 > build correctly to start with.

 > Modeled after OpenWRT approach
 > https://github.com/openwrt/openwrt/blob/master/config/Config-build.in#L176

 > A good testing tool to check a target's elf files for compliance
 > to an array of hardening techniques can be found here:
 > https://github.com/slimm609/checksec.sh

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > --
 > Changes

 > v1 -> v2
 >  - Cosmetic caps on titles

 > v2 -> v3
 >  - Consolidated the way flags were set using CPPFLAGS (Arnout)
 >  - Removed fortran flag as not relevant for this feature (Arnout)
 >  - Added BR2_TOOLCHAIN_USES_GLIBC and optimization level dependency

 > v3 -> v4
 > [Nicolas C
 >  - Used BR2_OPTIMIZE_0 as Config.in dependency
 >    for Fortify instead of using a warning at
 >    make time.
 >  - Enable -> Disable for the None options I
 >    mislabeled as enabling (relro/fortify).

 > +config BR2_FORTIFY_SOURCE_1
 > +	bool "Conservative"
 > +	help
 > +	  This option sets _FORTIFY_SOURCE set to 1 and only introduces

This sounds odd. Dropped the 2nd 'set' and rewrapped (here and for _SOURCE_2).

 > +comment "Fortify Source needs a GLIBC toolchain and some level of optimization"
 > +	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)

We elsewhere don't write glibc in CAPITALS. 'Some level of optimization'
sounds a bit odd to me, so I reworded it to 'and optimization'.

Committed with that fixed, thanks!

-- 
Bye, Peter Korsgaard
