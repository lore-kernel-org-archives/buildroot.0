From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Nov 2014 10:03:54 +0100
Subject: [Buildroot] [git commit] package/mono: force host-mono to use
	internal mono bootstrap compiler
Message-ID: <20141129090423.CECE07FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f6633f17b2149a0a0396760c983b0dd418d2334
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch forces the use of internal compiler for building mono,
for more information please refer to mono official documentation
(README.md)

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/mono.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 23d16f1..df67c33 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -55,6 +55,8 @@ HOST_MONO_CONF_OPTS += \
 	--with-profile4=$(if $(BR2_PACKAGE_MONO_40),yes,no) \
 	--with-profile4_5=$(if $(BR2_PACKAGE_MONO_45),yes,no)
 
+HOST_MONO_MAKE_OPTS += EXTERNAL_MCS="$(@D)/mcs/class/lib/monolite/basic.exe"
+
 HOST_MONO_DEPENDENCIES = host-monolite host-gettext
 
 define HOST_MONO_SETUP_MONOLITE
