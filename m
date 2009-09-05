From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:43 +0200
Subject: [Buildroot] [PATCH 1/7] makefile: new qstrip make function
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <580c6d9b448ea8db5c9fe8f99aa43967d297903b.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Define a qstrip function that strips double quotes and then
whitespaces around a given string. This is a very commonly needed
thing, and having a function allows to remove a large quantity of
hand-written definitions, followed by a dummy comment to make text
editors not crazy because of the unmatching double quote.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 5683484..fd272b5 100644
--- a/Makefile
+++ b/Makefile
@@ -40,6 +40,10 @@ else
 BR2_LOCAL:=$(TOPDIR)/local
 endif
 
+# Strip quotes and then whitespaces
+qstrip=$(strip $(subst ",,$(1)))
+#"))
+
 # Variables for use in Make constructs
 comma:=,
 empty:=
-- 
1.6.0.4
