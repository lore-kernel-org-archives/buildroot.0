From: Petr Stetiar <ynezz@true.cz>
Date: Wed, 20 Dec 2006 18:01:36 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
In-Reply-To: <20061220165004.E3D5D48598@busybox.net>
References: <20061220165004.E3D5D48598@busybox.net>
Message-ID: <20061220170136.GY2778@ibawizard.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aldot at uclibc.org <aldot@uclibc.org> [2006-12-20 08:50:04]:

> Author: aldot
> Date: 2006-12-20 08:50:04 -0800 (Wed, 20 Dec 2006)
> New Revision: 17018
> + static int my_shutdown(void)
> + {
> + 	char *args[8];

Sorry. Just noticed, that this correctly should be "char *args[2];".

-- ynezz
-------------- next part --------------
Index: package/kexec/kexec-tools-arm.patch
===================================================================
--- package/kexec/kexec-tools-arm.patch	(revision 17018)
+++ package/kexec/kexec-tools-arm.patch	(working copy)
@@ -446,7 +446,7 @@
 @@ -630,16 +630,11 @@
  static int my_shutdown(void)
  {
- 	char *args[8];
+ 	char *args[2];
 -	int i = 0;
  
 -	args[i++] = "shutdown";
