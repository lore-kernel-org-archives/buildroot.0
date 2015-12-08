From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Dec 2015 14:18:14 +0000
Subject: [Buildroot] [PATCH 1/2] nodejs: add support for MIPS big endian
Message-ID: <1449584295-21736-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/nodejs/nodejs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7b6ae6b..edf8bac 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -56,6 +56,8 @@ ifeq ($(BR2_i386),y)
 NODEJS_CPU = ia32
 else ifeq ($(BR2_x86_64),y)
 NODEJS_CPU = x64
+else ifeq ($(BR2_mips),y)
+NODEJS_CPU = mips
 else ifeq ($(BR2_mipsel),y)
 NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
-- 
2.4.10
