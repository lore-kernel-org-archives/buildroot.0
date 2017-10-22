From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:39:43 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] Add
	DEPENDENCIES_HOST_PREREQ to the list of packages
Message-ID: <20171022224415.1AD018073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61bf28e5cb4461a515f6afeca4d963b0b389e401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

That way packages included in that list like ccache will also be
regarded as a normal packages for targets like external-deps,
show-targets or legal-info

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 862b76cfefc101943f09db2a73f5519f9a5bb2cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index d859e25..42fcf6d 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,8 @@ include package/Makefile.in
 -include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
+PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
+
 include toolchain/*.mk
 include toolchain/*/*.mk
 
