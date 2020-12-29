From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 17:14:39 +0100
Subject: [Buildroot] [git commit] package/pkg-download.mk: add <pkg>_DL_ENV
 variable
Message-ID: <20201229155759.71CA9821DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53f23aacebae9adc2062d283b36ce92937028d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This variable can be used by package to pass extra environment
variables to the download logic. It will be used for the Go/Cargo
vendoring.

The <pkg>_DL_ENV variable is intentionally not documented: at this
point, it is not meant to be used by packages directly, but only by
package infrastructures.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: move the two _ENV variables to the same line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 951d2fb554..118df83855 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -99,7 +99,8 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
