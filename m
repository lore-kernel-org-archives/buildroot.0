From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 18:24:47 +0100
Subject: [Buildroot] [git commit] nodejs: add support for MIPS big endian
Message-ID: <20151212172708.79DE38081F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b807c1ee584a857cae839ea8be2b2cf1b59eac49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
