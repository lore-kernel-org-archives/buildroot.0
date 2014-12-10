From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 17:00:22 +0100
Subject: [Buildroot] [PATCH] libsvgtiny: disable -Werror
In-Reply-To: <1418223572-2456-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418223572-2456-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210170022.1cc25505@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Dec 2014 14:59:32 +0000, Vicente Olivert Riera wrote:
> glibc-2.20 includes some changes to the include/features.h file
> introduced by this commit:
> 
>   https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78
> 
> Those changes make libsvgtiny fail because some warnings are thrown and
> the build system is using the -Werror option. We disable this to be able
> to build it, or otherwise we will see errors like this one:
> 
> GPERF: src/colors.gperf
> COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
> In file included from
> /br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
> 		 from src/colors.gperf:16:
> /br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
> error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
> _DEFAULT_SOURCE" [-Werror=cpp]
> 
> and this one:
> 
> In file included from src/colors.gperf:18:0:
> /home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
> error: "strndup" redefined [-Werror]
> 
> Fixes:
>   http://autobuild.buildroot.net/results/3dd/3dd700405055750262738f867eb5aa08531f5781/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>

If you have some time, it would be good to report upstream that they
shouldn't use -Werror, and to fix the warnings themselves.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
