From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 01:44:39 +0300
Subject: [Buildroot] Ignored patches - WHY?
In-Reply-To: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
References: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
Message-ID: <4717E1D7.8080100@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sushi Sensei wrote:
> I have send some patches ( 0001534, 0001533, 0001532) this week with
> the Patch Tracking page, the week before I have send the same patches
> without notices of this inclusion or error, some patch was send 2 or 3
> week before and was ignored... There are some problem with this
> patches??

Sushi, regading this lockfile-progs patch:


Index: package/lockfile-progs/lockfile-progs.mk
===================================================================
--- package/lockfile-progs/lockfile-progs.mk	(revisi?n: 20228)
+++ package/lockfile-progs/lockfile-progs.mk	(copia de trabajo)
@@ -3,11 +3,12 @@
 # lockfile-progs
 #
 #############################################################
-LOCKFILE_PROGS_VERSION=0.1.10
+LOCKFILE_PROGS_VERSION=0.1.11
 LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE:=http://ftp.debian.org/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_CAT:=$(ZCAT)
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
+#LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)/sid
+LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
 LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
....

What the meaning of
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
+LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid

What does it mean "sid" ???

LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)

this line is pretty good and I do not see a reason to change it. Do you?

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
