From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:04:02 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] procps-ng: fix build
 without wide character support
Message-ID: <20180611211537.399958832F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e038321c5144bc53de2fb1d968577ea5c85934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Define OFF_XTRAWIDE to disable use of wchar API when the toolchain does
not support that.

Fixes:
http://autobuild.buildroot.net/results/b96/b96d29d64f455726a53a7adcfd3edd546346201c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a76fb61aae39d844c60d55726f6afafc7faf8e8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/procps-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index a6cf774d7b..0d5ce9ddf0 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -40,6 +40,10 @@ PROCPS_NG_CONF_OPTS += \
 	--enable-watch8bit
 endif
 
+ifeq ($(BR2_USE_WCHAR),)
+PROCPS_NG_CONF_OPTS += CPPFLAGS=-DOFF_XTRAWIDE
+endif
+
 # numa support requires libdl, so explicitly disable it when
 # BR2_STATIC_LIBS=y
 ifeq ($(BR2_STATIC_LIBS),y)
