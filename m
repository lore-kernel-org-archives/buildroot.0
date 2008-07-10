From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 10 Jul 2008 15:58:02 +0200
Subject: [Buildroot] dbus-1.1.1 is always rebuilt on "make"
Message-ID: <4876156A.4050200@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It looks like dbus is always rebuilt.


make -d -n dbus shows: (In Swedish :-)

++++++++++++++++++++++++++
...
          M?ste ?terskapa m?let "".
          M?lfilen "libxml2-install-staging" ?terskapades.

         F?rdigst?llde de n?dv?ndiga f?ruts?ttningarna f?r m?lfilen
"/home/ulf/projects/Buildroot/20080707/buildroot-avr32/build_avr32/dbus-1.1.1/.configured".

         Den n?dv?ndiga f?ruts?ttningen
"/home/ulf/projects/Buildroot/20080707/buildroot-avr32/build_avr32/dbus-1.1.1/.unpacked"
?r ?ldre ?n m?let
"/home/ulf/projects/Buildroot/20080707/buildroot-avr32/build_avr32/dbus-1.1.1/.configured".

         Den n?dv?ndiga f?ruts?ttningen "libxml2-install-staging" f?r m?let
"/home/ulf/projects/Buildroot/20080707/buildroot-avr32/build_avr32/dbus-1.1.1/.configured"
finns inte.
        M?ste ?terskapa m?let
"/home/ulf/projects/Buildroot/20080707/buildroot-avr32/build_avr32/dbus-1.1.1/.configured".
...
- ----------------------------

Basically "dbus-1.1.1/.configured" depends on "libxml2-install-staging"
which does not exist,
Make cannot find an implicit rule for libxml2-install-staging.

The rule to create dbus-1.1.1/.configured is therefore run, and the
rest of the dbus targets are then run as well.


I tried
.PHONY: libxml2-install-staging
but this does not seem to work.


Any ideas?

BR
Ulf Samuelsson
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdhVqAyRRH5cXxqwRApVzAJsG9nBNFYS1BnLrz1NqQvxd53ByOACdHjl6
yp4Q4mo0hgOso6QinswyVe4=
=7PXW
-----END PGP SIGNATURE-----
