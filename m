From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Oct 2017 15:42:26 +0200
Subject: [Buildroot] [git commit] Add DEPENDENCIES_HOST_PREREQ to the list
	of packages
Message-ID: <20171022133510.BA8A980190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=862b76cfefc101943f09db2a73f5519f9a5bb2cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That way packages included in that list like ccache will also be
regarded as a normal packages for targets like external-deps,
show-targets or legal-info

Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 02f7cda..79db7fe 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,8 @@ include package/Makefile.in
 -include $(wildcard arch/arch.mk.*)
 include support/dependencies/dependencies.mk
 
+PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
+
 include toolchain/*.mk
 include toolchain/*/*.mk
 
