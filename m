From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:05:28 +0200
Subject: [Buildroot] [git commit] i386: properly define BR2_ARCH for all x86
	subarchitectures
Message-ID: <20160421210533.864CB81E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=633f20002e4184e91ead8599fcc557e9fd17e1e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were not defining BR2_ARCH for two of the x86 subarchitecture,
which means the architecture part of the GNU_TARGET_NAME tuple was
empty, leading to weird build failures.

This commit fixes that by defining the appropriate values.

Fixes bug #8861.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.x86 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 4039db8..efa9567 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -226,6 +226,8 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_nocona && BR2_i386
 	default "i686"		if BR2_x86_core2 && BR2_i386
 	default "i686"		if BR2_x86_corei7 && BR2_i386
+	default "i686"		if BR2_x86_corei7_avx && BR2_i386
+	default "i686"		if BR2_x86_corei7_avx2 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
