From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:15:44 +0200
Subject: [Buildroot] [git commit] dhcpcd: move libexecdir
Message-ID: <20151003131736.B1A787FCBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71932858bdd9963f2b10f6a012ecd91808de6e49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default is $PREFIX/libexec which ends up in an ugly and non-standard
/libexec dir in the target.
Move it to $PREFIX/lib/dhcpcd which is far more nicer and suitable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index de169b5..66928e2 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -23,6 +23,7 @@ define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
 	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--os=linux \
+		--libexecdir=/lib/dhcpcd \
 		$(DHCPCD_CONFIG_OPTS) )
 endef
 
