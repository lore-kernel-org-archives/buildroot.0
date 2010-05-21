From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 15:22:12 +0200
Subject: [Buildroot] [PATCH 1/4] package: Add new <pkg>-show-depends to list
	dependencies
In-Reply-To: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274448102.git.thomas.petazzoni@free-electrons.com>
Message-ID: <118b880d73e812069ec2fe72f921d70894eb10a0.1274448102.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new <pkg>-show-depends simply outputs the list of dependencies for
the given package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index c2f86c7..cdf49f8 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -338,6 +338,9 @@ $(1)-extract:		$(1)-depends \
 
 $(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
+$(1)-show-depends:
+			@echo $$($(2)_DEPENDENCIES)
+
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
-- 
1.6.3.3
