From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:52:19 +0100
Subject: [Buildroot] [git commit] moarvm: enable optional support for libffi
Message-ID: <20161201222139.BF3747FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8981b3785d6719bc8a2869a5931ab3abd48a2b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/moarvm/moarvm.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 80bd19c..d091174 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -25,6 +25,11 @@ MOARVM_CONF_OPTS = \
 	--has-libtommath \
 	--has-libatomic
 
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+MOARVM_CONF_OPTS += --has-libffi
+MOARVM_DEPENDENCIES += libffi
+endif
+
 ifeq ($(BR2_ENDIAN),"BIG")
 MOARVM_CONF_OPTS += --big-endian
 endif
