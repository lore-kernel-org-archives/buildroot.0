From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Oct 2011 17:00:18 +0200
Subject: [Buildroot] [PATCH 1/6] Add basic config infrastructure for host
	utilities
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <62a2ee837d283e2460ee7aaa87efec412c85e3b2.1317481137.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most of the host packages don't have to be exposed to the user as they
are only used as build dependencies of target packages.

However, some host utilities, such as flashing utilities, image
creation programs, specific debuggers, might be useful and should be
presented to the user.

Therefore, we had a new global menu, which lists those host
utilities. These utilities are described in package/*/Config.in.host
files, which will be sourced by package/Config.in.host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in              |    2 ++
 package/Config.in.host |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 package/Config.in.host

diff --git a/Config.in b/Config.in
index 0cf4d49..fa4b42a 100644
--- a/Config.in
+++ b/Config.in
@@ -356,6 +356,8 @@ source "target/generic/Config.in"
 
 source "package/Config.in"
 
+source "package/Config.in.host"
+
 source "fs/Config.in"
 
 source "boot/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
new file mode 100644
index 0000000..54f6a59
--- /dev/null
+++ b/package/Config.in.host
@@ -0,0 +1,3 @@
+menu "Host utilities"
+
+endmenu
-- 
1.7.4.1
