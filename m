From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] opusfile: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.9771B81110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc97c0e46559afa69982e22f7c578e5009e7147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opusfile will not build with LibreSSL without patches, so let's
support only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opusfile/opusfile.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 186288d..28d4368 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -11,8 +11,8 @@ OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPUSFILE_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+OPUSFILE_DEPENDENCIES += libopenssl
 else
 OPUSFILE_CONF_OPTS += --disable-http
 endif
