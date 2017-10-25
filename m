From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:33:16 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Add
	DEPENDENCIES_HOST_PREREQ to the list of packages
Message-ID: <20171025073526.ECD747F969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=572ec0fc9392bc4f0ebaea7dbc2c06c6e62262d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
index 3514d93..7a369b3 100644
--- a/Makefile
+++ b/Makefile
@@ -481,6 +481,8 @@ include Makefile.legacy
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
+PACKAGES += $(DEPENDENCIES_HOST_PREREQ)
+
 include toolchain/*.mk
 include toolchain/*/*.mk
 
