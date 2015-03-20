From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:49:34 +0100
Subject: [Buildroot] [git commit] glibc: disable eglibc 2.18 for sparc
Message-ID: <20150320204939.22404817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e781702c4759dea8203a57d599b47a777ceba5f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's broken as well, wants to emit v9 asm.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 53cd958..8cc8cce 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -11,6 +11,8 @@ choice
 
 config BR2_EGLIBC_VERSION_2_18
 	bool "2.18-svnr23787"
+	# Build breakage
+	depends on !BR2_sparc
 
 config BR2_EGLIBC_VERSION_2_19
 	bool "2.19-svnr25243"
