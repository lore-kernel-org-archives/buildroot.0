From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:45:11 +0100
Subject: [Buildroot] [git commit] pkg-autotools.mk: remove extra space from
	config-update message
Message-ID: <20130318214520.61D149B164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28bb03ac9d6c8cb73dc01451efcc02c8b87b0456
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If you do a "make -s", you will notice that the UPDATE_CONFIG_HOOK message
has an extra space compared to other highlighted messages. ??For example:

>>> util-linux 2.20.1 ??Updating config.sub and config.guess
>>> util-linux 2.20.1 Patching libtool
>>> util-linux 2.20.1 Autoreconfiguring

A grep shows this is the only instance of the extra space. This patch
removes the extra space.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-autotools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..995c685 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -145,7 +145,7 @@ endif
 # Hook to update config.sub and config.guess if needed
 #
 define UPDATE_CONFIG_HOOK
-       @$$(call MESSAGE, "Updating config.sub and config.guess")
+       @$$(call MESSAGE,"Updating config.sub and config.guess")
        $$(call CONFIG_UPDATE,$$(@D))
 endef
 
