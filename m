From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:59:36 +0200
Subject: [Buildroot] [PATCH] pulseaudio: fix NEON usage
In-Reply-To: <1377205292-25021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 22 Aug 2013 23:01:32 +0200")
References: <1377205292-25021-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3j6j1dz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The NEON intrinsics used by Pulseaudio are only available in either
 Thomas> -mfloat-abi=softfp or -mfloat-abi=hard, not in
 Thomas> -mfloat-abi=soft. Therefore having NEON support in the processor is
 Thomas> not sufficient, we also should *not* be using soft-float.

 Thomas> Moreover, looking at BR2_ARM_ENABLE_NEON to know if the processor has
 Thomas> NEON support is incorrect. This option is only here to allow the user
 Thomas> to tell whether the processor has NEON support or not, for the ARM
 Thomas> cores that only have optional NEON support. Instead, the
 Thomas> BR2_ARM_CPU_HAS_NEON option really indicates whether NEON is available
 Thomas> or not (it is either set automatically by the ARM cores that always
 Thomas> have NEON support, or when BR2_ARM_ENABLE_NEON is enabled by the user
 Thomas> to confirm that his ARM processor has NEON support).

 Thomas> This fixes build failures such as
 Thomas> http://autobuild.buildroot.org/results/675/675c96059be348b594cc92980bef391126931c83/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
