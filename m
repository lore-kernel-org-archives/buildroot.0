From: Bernhard Fischer <rep.nop@aon.at>
Date: Sun, 1 Oct 2006 20:37:36 +0200
Subject: [Buildroot] Problems with recent zcat changes
In-Reply-To: <452002A1.2020400@indianaheart.org>
References: <452002A1.2020400@indianaheart.org>
Message-ID: <20061001183736.GK17455@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 01, 2006 at 02:02:09PM -0400, Scott Reese wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Greetings:
>
>I think that the zcat changes over the last few days have caused some
>problems in the makefile.  The newest buildroot fails to build the
>skeleton directories correctly.

No idea why that hunk wasn't checked in.

Added now as r16285, it looked like:
Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 16280)
+++ package/Makefile.in	(working copy)
@@ -8,6 +8,8 @@
 #"
 SVN:=$(strip $(subst ",, $(BR2_SVN)))
 #"
+ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
+#"
 TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
 #"
 
Ok now?
>
>The Makefile should be changed to reference BR2_ZCAT instead of ZCAT:
>
>107c107
><               $(ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf -; \
>- ---
>>               $(BR2_ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf
>- -; \
>
>- -Scott
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.4.2.2 (GNU/Linux)
>Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
>iD8DBQFFIAJuS7FYdPX6+iYRAmcNAJ9IIC8f9tn1ObDR5soVsXVzCFRRPgCdHIxF
>hoYF5fYVStfctq4vxlQMUOQ=
>=uvcB
>-----END PGP SIGNATURE-----
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
