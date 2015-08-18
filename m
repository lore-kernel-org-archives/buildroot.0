From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:18:01 +0200
Subject: [Buildroot] [git commit] msmtp: don't try to use IDN feature
Message-ID: <20150818121818.B895B7F986@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef7a8c7903046be1ee4d7f43a53c2a4e9dae1574
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoconf can't detect if AI_IDN is really supported
(http://sourceforge.net/p/msmtp/code/ci/907916e8089ea9303a7c091b763087530c88a063/),
so a --disable-gai-idn flag was added to explicitly disable the usage
of IDN.

Before this patch, msmtp failed to send mail with the following
output:

  msmtp: cannot locate host smtp.mandrillapp.com: Bad value for ai_flags

[Thomas: tweak commit log.]

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/msmtp/msmtp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index aa75dd4..09d57bf 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -10,6 +10,7 @@ MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
 MSMTP_CONF_OPTS = \
 	--without-libidn \
+	--disable-gai-idn \
 	--without-libgsasl
 MSMTP_LICENSE = GPLv3+
 MSMTP_LICENSE_FILES = COPYING
