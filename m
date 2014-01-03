From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:43:25 +0100
Subject: [Buildroot] [git commit] Disable MIPS64 ISAs for MIPS32 targets
Message-ID: <20140103194333.59B349C380@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b10a40535d5a69ba0fba44272e72657bf4e409a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently you can select MIPS64 ISAs, like mips64 and mips64r2, for
MIPS32 targets. This is incorrect, so we disable the possibility to do
that.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 4121200..9b3fff4 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -29,8 +29,10 @@ config BR2_mips_32r2
 	depends on !BR2_ARCH_IS_64
 config BR2_mips_64
 	bool "mips 64"
+	depends on BR2_ARCH_IS_64
 config BR2_mips_64r2
 	bool "mips 64r2"
+	depends on BR2_ARCH_IS_64
 endchoice
 
 
