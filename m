From: Scott Reese <sreese@indianaheart.org>
Date: Sun, 01 Oct 2006 14:02:09 -0400
Subject: [Buildroot] Problems with recent zcat changes
Message-ID: <452002A1.2020400@indianaheart.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Greetings:

I think that the zcat changes over the last few days have caused some
problems in the makefile.  The newest buildroot fails to build the
skeleton directories correctly.

The Makefile should be changed to reference BR2_ZCAT instead of ZCAT:

107c107
<               $(ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf -; \
- ---
>               $(BR2_ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf
- -; \

- -Scott
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFIAJuS7FYdPX6+iYRAmcNAJ9IIC8f9tn1ObDR5soVsXVzCFRRPgCdHIxF
hoYF5fYVStfctq4vxlQMUOQ=
=uvcB
-----END PGP SIGNATURE-----
